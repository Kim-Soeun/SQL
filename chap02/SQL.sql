create database test;
use test;

create table 학생(
	학번 varchar(10),
    이름 varchar(20),
    학년 int,
    성별 varchar(2)
 );   
 
 create table 직원(
	사번 varchar(10),
    이름 varchar(20),
    나이 int,
    성별 varchar(2)
 );  

insert into 학생 values("s001","김연아",4,"여");
insert into 학생 values("s002","홍길동",1,"남");
insert into 학생 values("s003","이승엽",3,"남");

-- 한 줄 복사 ctrl + D , 한 줄 삭제 ctrl + L 
 
insert into 직원 values("e001","김춘식",41,"남");
insert into 직원 values("e002","이미나",28,"여");

-- 키워드는 대소문자 구분하지 않음 예) insert, INSERT 똑같음 

select * from 학생;


create database univDB;
use univDB;

CREATE table 학생(
	학번 char(4) not null,
    이름 varchar(20) not null,
    주소 varchar(50) null default "미정",
    학년 int not null,
    나이 int null,
    성별 char(1) not null,
    휴대폰번호 char(14) null,
    소속학과 varchar(20) null,
    primary key(학번)
);

select * from 학생;
select * from 과목;


create table 수강(
	학번 char(6) not null,
    과목번호 char(4) not null,
    신청날짜 date not null,
    중간성적 int null default 0,
    기말성적 int null default 0,
    평가학점 char(1) null,
    primary key(학번,과목번호)
 );   
 
 -- 사용자 계정 생성(1234 : 비밀번호)
 CREATE user 'manager' IDENTIFIED by '1234';
 -- 사용자 계정 권한 부여
 -- *.*: 모든 데이터베이스의 모든 테이블
 -- 모든 데이터베이스의 모든 테이블에 사용자 권한 부여함을 의미
 grant all on *.* to 'manager';
 
 
 -- 학생 테이블 입력
 insert into 학생 values('s001', '김연아', '서울 서초', 4, 23, '여', '010-1111-2222', '컴퓨터');
 insert into 학생 values('s002', '홍길동', default, 1, 26, '남', null, '통계');
 insert into 학생 values('s003', '이승엽', NULL, 3, 30, '남', null, '정보통신');
 insert into 학생 values('s004', '이영애', '경기 분당', 2, null, '여', '010-4444-5555', '정보통신');
 insert into 학생 values('s005', '송윤아', '경기 분당', 4, 23, '여', '010-6666-7777', '컴퓨터');
 insert into 학생 values('s006', '홍길동', '서울 종로', 2, 26, '남', '010-8888-9999', '컴퓨터');
 insert into 학생 values('s007', '이은진', '경기 과천', 1, 23, '여', '010-2222-3333', '경영');
 
 -- 만약 잘못 삽입한 경우는
 -- delete from 학생; 명령문으로 모두 삭제 후 삽입 다시 실행
 
 -- insert 정식 구문
 -- insert into 학생(학번,이름,주소,학년,성별,휴대폰번호,소속학과) values(값...);
 -- 필드를 다 적을 때는 괄호 안 필드 모두 적지 않아도 됨
 -- 단, 필드 중 몇개만 적을 때는 괄호 안에 필드 적어주고 내용 적어줌
 -- INSERT INTO 학생 (나이) VALUES(20);
 
 -- 과목 테이블 입력
 insert into 과목 values('c001', '데이터베이스', '126', '컴퓨터', 3);
 insert into 과목 values('c002', '정보보호', '137', '정보통신', 3);
 insert into 과목 values('c003', '모바일웹', '128', '컴퓨터', 3);
 insert into 과목 values('c004', '철학개론', '117', '철학', 2);
 insert into 과목 values('c005', '전공글쓰기', '120', '교양학부', 1);
 
 -- 수강 테이블 입력
 insert into 수강 values('s001', 'c002', '2019-09-03', 93, 98, 'A'); 
 insert into 수강 values('s004', 'c005', '2019-03-03', 72, 78, 'C'); 
 insert into 수강 values('s003', 'c002', '2017-09-06', 85, 82, 'B'); 
 insert into 수강 values('s002', 'c001', '2018-03-10', 31, 50, 'F'); 
 insert into 수강 values('s001', 'c004', '2019-03-05', 82, 89, 'B'); 
 insert into 수강 values('s004', 'c003', '2020-09-03', 91, 94, 'A'); 
 insert into 수강 values('s001', 'c005', '2020-09-03', 74, 79, 'C'); 
 insert into 수강 values('s003', 'c001', '2019-03-03', 81, 82, 'B'); 
 insert into 수강 values('s004', 'c002', '2018-03-05', 92, 95, 'A'); 
 
 -- drop database test;  스키마 삭제
 
 desc 과목;
 select * from 과목; 
 -- 과목에 입력한 모든 데이터 볼 수 있음
 
 -- univdb 활성화
 use univdb;
 
 -- 학생 테이블에서 학번, 이름 데이터 가져오기
 select 학번, 이름 from 학생;
 
 -- 학생 테이블에서 소속학과 데이터 가져오기(중복 데이터 모두 출력)
 select 소속학과 from 학생;
 -- 중복된 데이터는 제거하고 소속학과 데이터 가져오기
 select DISTINCT 소속학과 from 학생;
 
 -- 학생 테이블에서 2학년 이상이면서 컴퓨터학과 학생의
 -- 이름, 학년, 소속학과, 휴대폰번호를 검색
 select 이름,학년,소속학과,휴대폰번호 from 학생 where 학년>=2 and 소속학과='컴퓨터';
 
 -- 1,2,3 학년 학생이거나 '컴퓨터'학과에 소속되지 않은 학생의 이름, 학년, 소속학과, 휴대폰 번호 정보를 검색하시오
 select 이름,학년,소속학과,휴대폰번호 from 학생 where (학년>=1 and 학년<=3) or not(소속학과='컴퓨터');
 select 이름,학년,소속학과,휴대폰번호 from 학생 where (학년 between 1 and 3) or not(소속학과='컴퓨터');
 
 -- 순서 정렬 
 select 이름, 학년, 소속학과 from 학생 where 소속학과='컴퓨터' or 소속학과='정보통신' order by 학년; -- asc 생략 가능(기본값이기 때문)
 select 이름, 학년, 소속학과 from 학생 where 소속학과='컴퓨터' or 소속학과='정보통신' order by 학년 desc; -- desc : 내림차순

-- where 조건문 입력시 속성 잊지말고 적어주기!!
-- select 이름, 학년, 소속학과 from 학생 where 소속학과='컴퓨터' or '정보통신' order by 학년 desc; -- 틀린 예시

-- 전체 학생의 모든 정보를 검색하되
-- 학년 기준으로 1차 오름차순 정렬하고, 학년이 같은 경우엔 이름을 기준으로 2차 내림차순 정렬하여 검색

select * from 학생 order by 학년 asc, 이름 desc;

-- 전체 학생수 검색(7)
 select count(*) from 학생; 
 select count(학번) from 학생; 
 
 
 -- 값에 null이 들어가면 count할 때 세지 않음
 -- 그래서 주소의 count 결과는 6이 나옴
 select count(주소) from 학생;
 select * from 학생;
 
 
 -- as(별칭이름, alias) : 검색 결과 반환되는 열에 대한 별칭(별명)을 정의하는 키워드
 -- 속성인 주소가 학생수로 바껴서 출력됨
 select count(주소) as 학생수 from 학생;
 select count(*) as 학생수1, count(주소) as 학생수2, count(DISTINCT 주소) as 학생수3 from 학생;


 -- 통계 함수 별명 부여시 as 생략 가능하나
 -- 별칭(as)이 공백이나 특수 문자를 포함하는 경우, 작은따옴표('')로 별칭을 묶어줌
 -- 여학생의 평균 나이 검색
 select avg(나이) '여학생 평균나이' from 학생 where 성별='여';
 
 -- 전체 학생의 성별 최고 나이, 최저 나이 검색
 select 성별,max(나이) as '최고 나이', min(나이) as '최저 나이' from 학생 group by 성별;
 
 -- 나이별로 나눠서 20세 이상 30세 미만의 나이별 학생수 검색
 select 나이, count(*) as '나이별 학생수' from 학생 where 나이>=20 and 나이<30 GROUP BY 나이;
 
 
-- having절 : group by 통해 생성된 그룹 중 특정 조건 만족하는 그룹만 검색
-- 각 학년별로 2명 이상의 학생을 갖는 학년에 대해서만 학생수를 검색
select 학년,count(*) as '학년별 학생수' from 학생 GROUP BY 학년 HAVING count(*)>=2;

-- '이'씨 성을 가진 학생들의 학번과 학생 이름을 검색
select 학번, 이름 from 학생 where 이름 like '이__';
-- 주소지가 '서울'인 학생의 이름, 주소, 학년을 학년 순(내림차순)으로 검색
select 이름, 주소, 학년 from 학생 where 주소 like '%서울%' order by 학년 desc;

-- 휴대폰번호가 등록되지 않은(널 값을 갖는) 학생의 이름과 휴대폰번호를 검색
select 이름, 휴대폰번호 from 학생 where 휴대폰번호 is null;

-- 학생 테이블에서 연락처가 비어 있지 않은 학생들의 이름, 주소, 나이를 검색하되
-- 소속학과가 컴퓨터인 학생들만 검색하시오
select 이름, 주소, 나이 from 학생 where 휴대폰번호 is not null and 소속학과='컴퓨터';

-- UNION(합집합)
-- 여학생이거나 A학점 받은 학생의 학번을 검색하시오
select 학번 from 학생 where 성별='여' UNION select 학번 from 수강 where 평가학점='A';

-- IN 연산자 & 부 질의문
-- 과목번호가 c002인 과목을 수강한 학생의 이름을 검색
select 이름 from 학생 where 학번 in('s001', 's003', 's004');
select 이름 from 학생 where 학번 in (select 학번 from 수강 where 과목번호='c002');