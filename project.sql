create database project;

create table member (
	id varchar(30) primary key,
    password varchar(30) not null,
    name varchar(10) not null,
    birthDate varchar(10) not null,
    email varchar(30) not null,
    nickname varchar(30) not null,
	phone varchar(20),
    registerDate DATE,
    lastVisitDate DATETIME,
    score int,
    location varchar(20),
    total varchar(20)
);
alter table member add column profileImg varchar(400);

select * from member;
select * from crewboard;
SELECT imgName, no FROM crewboard ORDER BY created DESC;
insert into member values('java', '1234', '고길동', '751125', 'java@naver.com', '자바', '010-1111-1111', '2023-11-26', '2023-11-26',null,null,null,'dog.png');
select * from member where id = 'java';
delete from member where id ='1' and password = '#1dfagrehh';
select id from member where name='가나' and email='aaa@null' and birthDate='951112';
select password from member where id='aa' and name='가나' and email='aaa@null' and birthDate='951112';
update member set lastVisitDate = '2023-11-03 11:11' where id = 'aa';

update member set profileImg = 'zzanggu.jpg' where id = 'aa'; 
update member set password='1', name='고릴라', birthDate='851112', email='bbb@naver.com', nickname='고릴라', phone='010-1111-2222', location='문흥동', profileImg='dog.png' where id = 'aa';

create table crewboard(
	no int primary key auto_increment,
    id varchar(30) not null,
    nickname varchar(30) not null,
    created varchar(20) not null,
    content text not null,
    category varchar(20) not null,
    imgName varchar(450) not null,
    foreign key(id) references member(id) on delete cascade
);

ALTER TABLE crewboard MODIFY imgName VARCHAR(450) NULL;
delete from crewboard where no = 4; 
update crewboard set created = '2023.11.23', content = '내용입니다', category = 'board', imgName = 'dog.png'
where no = 7;
select * from crewboard;
select *, (select count(*) from recommend where no=crewboard.no) as count from crewboard;
select * from crewboard where category = '자유게시판';
insert into crewboard values(0, 'java', 'java', '2023.11.21', '내용1', '자유게시판', 'dog.png');
SELECT imgName, no FROM crewboard ORDER BY created DESC;

create table recommend(
	no int not null,			-- 게시물 넘버
    id varchar(30) not null,	-- 추천한 아이디
    primary key(no, id),		-- 같은 아이디로 게시물 한 번 이상 추천 x
    foreign key(no) references crewboard(no) on delete cascade,
    foreign key(id) references member(id)
);

select * from recommend;
select count(*) from recommend where no=1;
SELECT SUM(total) as total_count FROM recommend WHERE no = 1;
insert into recommend values (1, 'java');
update recommend set total = total+1 where no = 1 and id = 'aa';
select *, (select count(*) from recommend where no=crewboard.no) as count from crewboard where no = 7;
select *, (select count(*) from recommend where no=crewboard.no) as count from crewboard;


create table photobook(
	p_no int primary key AUTO_INCREMENT,
	id varchar(30) not null,
    title varchar(50) not null,
    content varchar(100),
    created varchar(20) not null,
    imgName varchar(450) not null,
	foreign key(id) references member(id)
);

select * from photobook;
insert into photobook values (0, 'java', '제목1', '내용1', '2023.11.22', 'dog.png');
delete from photobook where p_no = '2';

SELECT imgName, no FROM crewboard ORDER BY created DESC;
update crewboard set imgName = null where no = '11';


create table crewRecruit(
	crewName varchar(30) primary key,		-- 크루명
    title varchar(30) not null,				-- 모집글 제목
    content varchar(400) not null,			-- 내용(ex.조건사항)
    location varchar(30) not null,			-- 모임장소
    memberNum int not null, 				-- 모집인원
    created varchar(20) not null, 			-- 크루 생성일
    gatherDate varchar(20) not null,		-- 모임일
    adminId varchar(30) not null			-- 방장 id
);


select * from crewRecruit;
insert into crewRecruit values('크루3', '같이뛰어요', '#매일달리기', '전대운동장' , 7, '2023.10.25', '2023.10.30', 'java');
select crewName from crewRecruit where crewName = '크루1';
select crewName from crewRecruit;

create table crew(
	crewName varchar(30) not null,			-- 크루명
    memberNum int not null,					-- 모집인원
    memId varchar(30) not null,				-- 가입멤버 id
    memAdmin boolean not null,				-- 방장 (true:방장, false:크루원)
    PRIMARY KEY(crewName, memId),			-- 같은 아이디가 같은 크루에 중복으로 들어갈 수 없음
    foreign key(memId) references member(id) on delete cascade,
	foreign key(crewName) references crewRecruit(crewName) on delete cascade
);

insert into crew values('크루1', 7, 'java', true);
insert into crew values('크루1', 7, 'aa', false);

select * from crew;
DELETE FROM crewRecruit
WHERE (SELECT COUNT(memId) FROM crew) <= 1 AND created < DATE_SUB(NOW(), INTERVAL 1 MONTH);

DELETE cr, c
FROM crewRecruit cr
JOIN crew c ON cr.crewName = c.crewName
WHERE cr.created < DATE_SUB(NOW(), INTERVAL 1 MONTH)
AND (SELECT COUNT(*) FROM crew WHERE crewName = cr.crewName) <= 1;

select count(*) from crew where crewName = '크루2';
select *, (select count(memId) from crew where crewName = crewRecruit.crewName) as totalCount from crewRecruit;
select *, (select count(memId) from crew where crewName = crewRecruit.crewName) as totalCount from crewRecruit where crewName = '크루1';