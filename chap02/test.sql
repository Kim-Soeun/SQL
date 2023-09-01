create database test;
use test;

-- utf8 설정, use test를 실행하고나서 table을 실행해야 오류 안나옴 
-- 단축키 : ctrl + enter 한 줄 실행 
	   -- ctrl + B 쿼리 정리 정렬 
	   -- ctrl + / 주석
	   -- ctrl + shift + enter 다중 실행
	   -- ctrl + L 한 줄 삭제 
       	   -- ctrl + D 한 줄 복사 
       
create table 학생(
	학번 varchar(10),
    이름 varchar(20),
    학년 int,
    성별 varchar(2)
);
-- 실행은 마지막 세미콜론에서 실행해야함

create table 직원(
	사번 varchar(10),
    이름 varchar(20),
    나이 int,
    성별 varchar(2)
);

insert into 학생 values("s001","김연아","4","여"); -- 학생 테이블에 존재하는 모든 필드를 선택 후 값 입력
insert into 학생 values("s002","홍길동","1","남");
insert into 학생 values("s003","이승엽","3","남");
-- 특정 필드 선택해서 값 입력 가능 


insert into 직원 values("e001","김춘식","41","남");
insert into 직원 values("e002","이미나","28","여");

-- 키워드는 대소문자 구분하지 않음 예) insert, InSERT 똑같음 

SELECT * from 학생;


CREATE database univDB;
use univDB;

create table 학생(
학번 char(4) not null, 			-- 학번 필드에 null 값을 허용하지 않도록 지정 (데이터 값이 비어있으면 안된다) 무조건 4글자만 써야함
이름 varchar(20) not null, 		-- 20글자 이하로 사용가능
주소 varchar(50) null default "미정",    -- null일때 null대신 "미정"으로 표시 
학년 int not null,
나이 int null,
성별 char(1) not null,
휴대폰번호 char(14) null,
소속학과 varchar(20) null,
primary key(학번) 	-- primary key값 내에서 중복이 존재하면 안된다. 학번 속성 내에서 중복이 존재하면 안된다... 
);

select * from 학생; 	-- select * from 학생 : 학생 테이블의 모든 필드를 조회

create table 수강(
학번 char(6) not null,
과목번호 char(4) not null,
신청날짜 date not null,
중간성적 int null default 0,
기말성적 int null default 0,
평가학점 char(1) null,
primary key(학번,과목번호) -- primary key로 지정을 하면 중복값을 넣을 수 없음, index가 자동으로 생성된다. 검색 기능 향상..
);

-- 사용자 계정 생성
Create user 'manager' identified by '1234'; -- 사용자 manager, 비밀번호 1234
grant all on *.* to 'manager'; 		    --  사용자 'manager'에게 모든 데이터베이스와 테이블에 대한 모든 권한을 부여, *.*는 "모든 데이터베이스의 모든 테이블

insert into 학생 values('s001','김연아','서울 서초',4,23,'여','010-1111-2222','컴퓨터');
insert into 학생 values('s002','홍길동',DEFAULT,1,26,'남',NULL,'통계');
insert into 학생 values('s003','이승엽',NULL,3,30,'남',NULL,'정보통신');
insert into 학생 values('s004','이영애','경기 분당',2,NULL,'여','010-4444-5555','정보통신');
insert into 학생 values('s005','송윤아','경기 분당',4,23,'여','010-6666-7777','컴퓨터');
insert into 학생 values('s006','홍길동','서울 종로',2,26,'남','010-8888-9999','컴퓨터');
insert into 학생 values('s007','이은진','경기 과천',1,23,'여','010-2222-3333','경영');

Delete from 학생;
-- insert into 학생 (나이) values (23);
-- 특정 필드에만 값을 넣을 때에도 명시한 필드의 개수와 순서가 테이블의 구조와 일치해야 한다.
-- 만약 잘못 삽입한 경우는 DELETE FROM 학생; 명령문으로 모두 삭제 후 삽입 다시 실행
select * from 학생;
-- insert 정식 구문
-- insert into 학생(학번,이름,주소,학년,나이,성별,휴대폰번호,소속학과) values(값);

-- 과목 테이블 입력
Insert into 과목 values('c001','데이터베이스','126','컴퓨터',3);
Insert into 과목 values('c002','정보보호','137','정보통신',3);
Insert into 과목 values('c003','모바일웹','128','컴퓨터',3);
Insert into 과목 values('c004','철학개론','117','철학',32);
Insert into 과목 values('c005','전공글쓰기','120','교양학부',1);

-- 수강 테이블 입력
insert into 수강 value('s001','c002','2019-09-03',93,98,'A');
insert into 수강 value('s004','c005','2019-03-03',72,78,'C');
insert into 수강 value('s003','c002','2017-09-06',85,82,'B');
insert into 수강 value('s002','c001','2018-03-10',31,50,'F');
insert into 수강 value('s001','c004','2019-03-05',82,89,'B');
insert into 수강 value('s004','c003','2020-09-03',91,94,'A');
insert into 수강 value('s001','c005','2020-09-03',74,79,'C');
insert into 수강 value('s003','c001','2019-03-03',81,82,'B');
insert into 수강 value('s004','c002','2018-03-05',92,95,'A');

-- drop database test; test 데이터베이스 삭제 

DESC 과목; -- 과목 테이블 생성 정보 확인
select * from 과목;
Use univdb; -- 작업 대상 데이터베이스 변경

select 학번,이름 from 학생;
-- 학생 테이블에서 학번, 이름 데이터 가져오기
select 소속학과 from 학생;
-- 학생 테이블에서 소속학과 데이터 가져오기(중복 데이터 모두 출력)
select distinct 소속학과 from 학생;
-- 학생 테이블에서 중복된 데이터를 제거한 소속학과 출력

select 이름,학년,소속학과,휴대폰번호 from 학생 where 학년>=2 and 소속학과='컴퓨터';
-- 학생 테이블에서 2학년 이상이면서 컴퓨터학과 학생의 이름, 학년, 소속학과, 휴대폰번호를 검색
