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

select * from member;

-- 크루 게시판
create table crewboard(
	no int primary key auto_increment,
    id varchar(30) not null,
    nickname varchar(30) not null,
    created varchar(20) not null,
    content text not null,
    category varchar(20) not null,
    imgName varchar(450) not null,
    crewName varchar(100) not null,
    foreign key(id) references member(id) on delete cascade
);

select * from crewboard;
select imgName from crewboard where crewName = '크루4';

select imgName, crewName, no from crewboard where crewName = '크루4';

alter table crewboard add column crewName varchar(100) not null;
update crewboard set crewName = '크루5' where no = 19;

select *, (select count(*) from recommend where no=crewboard.no) as count from crewboard where crewName = '크루3';

-- 게시판 추천
create table recommend(
	no int not null,
    id varchar(30) not null,
    primary key(no, id),
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
    crewName varchar(100) not null,
	foreign key(id) references member(id)
);

select * from photobook;
select imgName, crewName, p_no from photobook where crewName = '크루3';

-- 단기크루 등록 & 일정 등록 / 장기크루 일정 no pk auto_increment crewname pk삭제 iscrew(단기크루인지 장기크루 일정인지) boolean추가
create table crewRecruit(
	no int primary key auto_increment,
	crewName varchar(30) not null,
    title varchar(30) not null,
    content varchar(400) not null,
    location varchar(30) not null,
    memberNum int not null,
    created varchar(20) not null,
    gatherDate varchar(20) not null,
    adminId varchar(30) not null,
    isCrew boolean default true		-- 단기크루 생성(true)인지, 장기크루 일정(false)인지 확인
);
select * from crewRecruit;
select *, (select count(memId) from crewSchedule where crewName = crewRecruit.crewName) 
as totalCount from crewRecruit where isCrew = true order by created desc;

insert into crewRecruit values(8,'크루2','제목8','내용8','장소8',4,'2023-11-30','2023-12-21','java',false);
select crewRecruit.no from crewRecruit join longCrewSchedule on crewRecruit.no = longCrewSchedule.no where memId = 'java' and longCrewSchedule.crewName = '크루1';
select *, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) as totalCount from crewRecruit order by created desc;
select crewRecruit.*, (select count(memId) from crew where crewName = crewRecruit.crewName) totalCount from crewRecruit 
join crew on crew.crewName = crewRecruit.crewName where crew.memId = ? and isCrew = true;
delete from crewRecruit where crewName = '크루3' and (select count(*) from longCrewSchedule where crewName = '크루3') <= 1 and isCrew = true;

select crewRecruit.*, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) as totalCount 
from crewRecruit where crewRecruit.crewName = '크루4' and isCrew = true;

select crewRecruit.*, (select count(memId) from crewSchedule where crewName = crewRecruit.crewName) as totalCount 
from crewRecruit where crewRecruit.crewName = '크루2';

select crewRecruit.*, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) as totalCount from crewRecruit 
join longCrewSchedule on longCrewSchedule.crewName = crewRecruit.crewName where longCrewSchedule.memId = 'java';

-- 크루 일정 멤버 등록(단기크루는 그 자체로 일정 fk->no로 바꾸고 pk설정되있는 크루네임 대신에 no)
create table crewSchedule(
	no int not null,
	crewName varchar(30) not null,
    memberNum int not null,
    memId varchar(30) not null,
    memAdmin boolean not null,			-- 일정등록자인지 아닌지
    PRIMARY KEY(no, memId),
    foreign key(memId) references member(id) on delete cascade,
	foreign key(no) references crewRecruit(no) on delete cascade
);

insert into crewSchedule values(9,'크루8',5,'ee',false);
select * from crewSchedule;
select *, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) as totalCount from crewRecruit where crewName = '크루1';
insert into longCrewSchedule values(4,'크루4',5,'ee',true);


select crewRecruit.*, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) totalCount from crewRecruit 
join longCrewSchedule on longCrewSchedule.no = crewRecruit.no where longCrewSchedule.memId = 'java';

-- 게시판 댓글
create table reply(
	r_no int primary key auto_increment,
    b_no int not null,
    content varchar(70) not null,
    created varchar(20) not null,
    id varchar(30) not null,
    foreign key(b_no) references crewboard(no) on delete cascade
);


-- 장기크루 등록
create table longCrewRecruit(
	crewName varchar(30) primary key,
    content varchar(400) not null,
    memberNum int not null,
    created varchar(20) not null,
    adminId varchar(30) not null
);
select * from longCrewRecruit;
delete from longCrewRecruit where crewName = '크루5';
insert into longCrewRecruit values('크루5','내용1',5,'2023-11-30','java');
select *, (select count(memId) from longCrewMember where crewName = longCrewRecruit.crewName) as totalCount 
from longCrewRecruit order by created desc;

select *, (select count(memId) from longCrewMember where crewName = longCrewRecruit.crewName) 
as totalCount from longCrewRecruit where crewName = '크루7';

-- 장기크루 크루가입 정보
create table longCrewMember(
	crewName varchar(30) not null,
    memId varchar(30) not null,
	memberNum int not null,
    isAdmin boolean not null,
    joinDate varchar(100),
    PRIMARY KEY(crewName, memId),
    foreign key(memId) references member(id) on delete cascade,
    FOREIGN KEY (crewName) references longCrewRecruit(crewName) on delete cascade
);
select * from longCrewMember;
select *, (select count(memId) from longCrewMember where crewName = longCrewRecruit.crewName) 
as totalCount from longCrewRecruit where crewName = '크루2';

insert into longCrewMember values('크루2','ee',5,false,'2023-11-30');


-- 가입정보 ( 장기 단기 크루가입, 일정참여 전부에 사용됨)
create table crewJoin(
	no int primary key auto_increment,
	crewName varchar(30) not null,
    memid varchar(30) not null,
    adminid varchar(30) not null,
    ischeck boolean default false
);

select * from lognCrewRecruit;
