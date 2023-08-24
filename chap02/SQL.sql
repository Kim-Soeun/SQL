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
-- 작업대상 데이터베이스 변경

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

-- '정보보호' 과목을 수강한 학생의 이름을 검색 (중첩 부 질의문)
-- = : 결과가 하나일 때 사용
select 이름 from 학생 where 학번 in (
select 학번 from 수강 where 과목번호 = 
(select 과목번호 from 과목 where 이름='정보보호'));

-- '정보보호' 과목을 수강한 학생의 이름을 검색 (중첩 부 질의문)
-- in : 결과가 여러개일 때 사용
select 이름 from 학생 where 학번 in (
select 학번 from 수강 where 과목번호 in
(select 과목번호 from 과목 where 이름='정보보호'));

-- 과목번호가 'c002'인 과목을 수강한 학생의 이름을 검색(EXISTS 연산자)
select 이름 from 학생 where EXISTS (select * from 수강 where 수강.학번 and 과목번호='c002');

-- 학생 중에서 한 과목도 수강하지 않은 학생의 이름을 검색
select 이름 from 학생 where not EXISTS ( select * from 수강 where 수강.학번 = 학생.학번); 

select * from 학생;  -- 7개
select * from 수강;  -- 9개

-- 학생,수강 테이블 데이터 모두 가져옴
select * from 학생,수강; -- 63개

-- 전체 학생의 기본 정보와 모든 수강 정보를 검색(조인 검색)
select * from 학생, 수강 where 학생.학번=수강.학번;
select 이름 from 학생, 수강 where 학생.학번=수강.학번;
select DISTINCT 이름 from 학생, 수강 where 학생.학번=수강.학번;
select * from 학생 join 수강 on 학생.학번=수강.학번;

-- 학생 중에서 과목번호가 'c002'인 과목을 수강한 학생의 학번과 이름, 과목번호 
-- 그리고 변환중간성적(학생별 중간 성적의 10% 가산점수)을 검색
select 학생.학번,이름,과목번호,중간성적*1.1 as 변환중간성적 from 학생, 수강 where 학생.학번=수강.학번 and 과목번호='c002';
select 학생.학번,이름,과목번호,중간성적*1.1 as 변환중간성적 from 학생 join 수강 on 학생.학번=수강.학번 where 과목번호='c002';

-- 학생 중에서 '정보보호' 과목을 수강한 학생의 학번과 이름, 과목번호를 검색
select 학생.학번,학생.이름,수강.과목번호 from (학생 join 수강 on 학생.학번=수강.학번)
join 과목 on 수강.과목번호=과목.과목번호 where 과목.이름='정보보호';

-- 학생 중에서 과목번호가 'c002'인 과목을 수강한 학생의 이름, 과목번호를 검색(테이블 별칭 사용)
select 이름,과목번호 from 학생 as S, 수강 as E
where S.학번=E.학번 and 과목번호='c002';

-- 주소가 같은 학생들의 이름을 쌍으로 검색
-- 검색되는 첫 번째 학생이 두 번째 학생보다 학년이 높도록 설정(셀프 조인)
 select S1.이름,S2.이름 from 학생 S1 JOIN 학생 S2 ON S1.주소=S2.주소 
 WHERE S1.학년>S2.학년;
 
 -- 과목을 수강하지 않은 학생을 포함하여 모든 학생의 학번, 이름과 
 -- 학생이 수강한 교과의 평가학점을 검색(외부 조인)
 -- left outer join : 조인 연산자 왼쪽 테이블의 모든 행들이 빠짐없이 조인 최종 결과에 포함
 select 학생.학번,이름,평가학점 from 학생 left outer join 수강 on 학생.학번=수강.학번;
 
 -- 학생테이블의 모든 데이터를 가져와 새로운 학생1 테이블 생성
 create table 학생1 as(select * from 학생);
 create table 수강1 as(select * from 수강);
 create table 과목1 as(select * from 과목);
 desc 학생1;

-- 괄호 안 요소들과 데이터의 순서가 맞아야 함
insert into 학생1(학번,이름,주소,학년,나이,성별,휴대폰번호,소속학과)
values('g001','김연아2','서울 서초',4,23,'여','010-111-2222','컴퓨터');

-- 괄호안 순서가 바껴도 데이터 순서와만 맞으면 됨
insert into 학생1(이름,학번,주소,학년,나이,성별,휴대폰번호,소속학과)
values('홍길동2','DEFAULT','서울 서초',4,23,'여','010-111-2222','컴퓨터');

-- 학번,이름,학년,성별 속성은 not null로 설정했기 때문에 값이 꼭 들어가야 함
insert into 학생1(학번,이름,학년,성별) values('g002','김연아3',4,'여');

select * from 학생1;

insert into 학생1(이름,학년,나이,성별,소속학과,학번) values('홍길동2',1,26,'남','통계','g002');

insert into 학생1(학년,나이,성별,소속학과,학번,이름)
values(3,30,'남','정보통신','g003','이승엽2');

select * from 학생1;
delete from 학생1 where 이름='김연아3';
delete from 학생1 where 이름='홍길동2';

update 학생1 set 학년=3 where 이름='이은진';

select * from 학생1 where 이름='이은진';

-- 4학년을 1씩 증가시키고 소속학과를 '자유전공학부'로 변경
update 학생1
set 학년=학년+1, 소속학과='자유전공학부'
where 학년=4;

select * from 학생1;

-- 수강 내용이 없는 학생의 소속학과를 널 값으로 수정
update 학생1 set 소속학과=null where 학번 not in(select 학번 from 수강1);
select * from 학생1;

-- 학번이 's003'인 학생의 수강 내용을 '이은진' 학생이 수강한 것으로 수정
-- 즉, 수강1 테이블에서 학번을 's003' 대신에 '이은진' 학생의 학번으로 변경
update 수강1 set 학번 =(select 학번 from 학생1 where 이름='이은진') where 학번='s003';
select * from 수강1 where 학번='s003' or 학번='s007'; 

-- 송윤아 학생의 모든 정보 삭제
delete from 학생1 where 이름='송윤아';
select * from 학생1;

-- 3학년 모든 학생 정보 삭제
delete from 학생1 where 학년=3;
select * from 학생1;

-- 수강자가 2명 미만인 과목에 대한 과목 정보를 모두 삭제
delete from 과목1 where 과목번호 in(select 과목번호 from 수강1 group by 과목번호 having count(*)<2);
select * from 과목1;

create database chap5;

create table 과목2(
	과목번호 char(4) not null primary key,
    이름 varchar(20) not null,
    강의실 char(5) not null,
    개설학과 varchar(20) not null,
    시수 int not null
);


create table 학생2(
	학번 char(4) not null,
    이름 varchar(20) not null,
    주소 varchar(50) default '미정',
    학년 int not null,
    나이 int null,
	성별 char(1) not null,
    휴대폰번호 char(13) null,
    소속학과 varchar(20) null,
	primary key(학번), 	 -- 기본키(중복 x, 널값 x)
    unique(휴대폰번호)   	 -- 후보키(중복 x, 널값 o)
);    

DESC 학생2;

show create table 학생2;

create table 수강2(
	학번 char(6) not null,
    과목번호 char(4) not null,
    신청날짜 date not null,
    중간성적 int null default 0,
    기말성적 int null default 0,
    평가학점 char(1) null,
    primary key(학번, 과목번호),   					-- 기본키 지정
    foreign key(학번) references 학생2(학번),  		-- 외래키 '학번' 열이 '학생2' 테이블의 '학번' 열을 참조
    foreign key(과목번호) references 과목2(과목번호)	-- 외래키 '과목번호'열이 '과목2' 테이블의 기본키 '과목번호' 열을 참조
);

insert into 과목2 values('c111','database',A-123,'산업공학');     -- 오류(문자에 따옴표 없음)
insert into 과목2 values('c111','database','A-123','산업공학');   -- 오류(필드 5개인데 4개만 입력)
insert into 과목2 values('c111','database','A-123','산업공학',3); -- 정상

insert into 학생2(학번,이름,학년,나이,성별,휴대폰번호,소속학과)
values ('s111','박태환',4,null,'남','010-1111-1111','산업공학');

insert into 학생2(학번,이름,학년,나이,성별,휴대폰번호,소속학과)
values ('s222','박태환2',2,null,'남','010-1111-1111','산업공학');	  -- 오류 : 휴대폰번호(후보키) 중복 입력 안됨

insert into 학생2(학번,이름,학년,나이,성별,휴대폰번호,소속학과)
values ('s222','박태환',2,null,'남','010-2222-2222','산업공학');   -- 정상

insert into 수강2(학번,과목번호,신청날짜) values('s111','c111','2019-12-31');
-- 정상 처리(학생2 학번에 s111 존재하고 과목2 테이블에 c111 존재함)

insert into 수강2(학번,과목번호,신청날짜,중간성적,기말성적,평가학점)
values('s111','c222','2019-12-31',93,98,'A');
-- 외래키 오류 (과목2 테이블에 과목번호 C222가 존재하지 않음)

insert into 수강2(학번,과목번호,신청날짜,중간성적,기말성적,평가학점)
values ('s111','c111','2019-12-31',93,98,'A');
-- 기본키 오류 (학번, 과목번호가 중복된 값이 존재함)
-- 

insert into 수강2(학번,과목번호,신청날짜,중간성적,기말성적,평가학점)
values ('s222','c111','2019-12-31',93,98,'A');
-- 정상

-- 학생2( 박태환 데이터 2개), 과목2(1개), 수강2(2개)

select * from 학생2;

-- create table 과목3 as (select * from 과목2);
-- 과목2 테이블 복사해서 과목3 테이블을 생성

insert into 과목2 select * from 과목;
 -- 과목에 있는 데이터를 과목2 테이블에 복사함
insert into 학생2 select * from 학생;
insert into 수강2 select * from 수강;
 
 -- 학생2 테이블에 새로운 등록날짜 열을 추가
 alter table 학생2 add 등록날짜 datetime not null default '2019-12-30';
 
 -- 학생2 테이블에 등록날짜 삭제
 alter table 학생2 drop column 등록날짜;
 
 -- 열 이름 변경( 학생2 테이블에서 '이름'을 '학생이름'으로 변경)
 -- alter table 테이블이름 change 기존이름 신규이름 데이터타입;
 alter table 학생2 change 이름 학생이름 varchar(20);
 
 select * from 학생2;

-- 테이블 이름 변경(테이블 '학생2'를 '재학생2'로 변경)
-- alter table 테이블이름 rename to 신규이름;  
alter table 학생2 rename to 재학생2;
select * from 재학생2;

-- 과목2, 수강2, 재학생2
-- 수강2 테이블은 과목2 테이블과 재학생2 테이블을 외래키로 참조하고 있음
-- 삭제할 때는 참조하고 있는 테이블을 먼저 삭제
drop table 과목2;    -- 오류 : 수강2 테이블이 과목2 테이블을 참조하고 있으므로 삭제 안됨
drop table 수강2;    -- 참조 테이블(자식 테이블) 먼저 삭제
drop table 과목2;    -- 그 후 부모 테이블 삭제

select * from 과목2;  -- 오류 : 삭제되었기 때문에 결과 없음

