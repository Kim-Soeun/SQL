create database project;

-- 회원
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
    total varchar(20),
    profileImg varchar(400),
    gender varchar(10)
);
alter table member add gender varchar(10) not null;
alter table member modify birthDate varchar(30);
select * from member;
select gender from member where id = 'aa';
update member set gender = '여';



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
select * from crewboard where crewName = '크루5';
select count(*) from crewboard where crewName = '크루5';
insert into crewboard values(null, 'bb', '고릴라', '2023-12-04', '반가워', 'greeting', 'lee11.jpg' ,'크루5');



-- 게시판 추천
create table recommend(
	no int not null,
    id varchar(30) not null,
    primary key(no, id),
    foreign key(no) references crewboard(no) on delete cascade,
    foreign key(id) references member(id)
);



-- 사용안할듯
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
    isCrew boolean default true,		-- 단기크루 생성(true)인지, 장기크루 일정(false)인지 확인
    courseId varchar(20)
);

select * from crewRecruit;

-- 크루 일정 멤버 등록 & 단기크루 멤버(일정멤버) 등록(단기크루는 그 자체로 일정 fk->no로 바꾸고 pk설정되있는 크루네임 대신에 no)
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

select * from crewSchedule;

-- 게시판 댓글
create table reply(
	r_no int primary key auto_increment,
    b_no int not null,
    content varchar(70) not null,
    created varchar(20) not null,
    id varchar(30) not null,
    foreign key(b_no) references crewboard(no) on delete cascade
);

select * from reply;


-- 장기크루 등록
create table longCrewRecruit(
	crewName varchar(30) primary key,
    content varchar(400) not null,
    memberNum int not null,
    created varchar(20) not null,
    adminId varchar(30) not null
);


select * from longCrewRecruit;




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



-- 가입정보 ( 장기 단기 크루가입, 일정참여 전부에 사용됨)
create table crewJoin(
	no int primary key auto_increment,
	crewName varchar(30) not null,
    memId varchar(30) not null,
    adminId varchar(30) not null,
    isCheck int not null,	-- 1: 승인대기, 2: 승인완료, 3: 승인거절
    memberNum int not null,
    isShortCrew boolean,		-- true : 단기크루, false : 장기크루
    gender varchar(10) not null
);


create table course(
	memId varchar(30) not null,
    courseId varchar(100) not null,
    no int not null
    
);

select no from course where memId = 'java';
delete from course where courseId = '코스4' and no = 12;
select * from member;
select * from crewboard;
select * from recommend;
select * from crewRecruit;
select * from crewSchedule;
select * from reply;
select * from longCrewRecruit;
select * from longCrewMember;
select * from crewJoin;
select * from course;

insert into course values('java', '코스4', 12);