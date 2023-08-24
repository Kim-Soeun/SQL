-- 사용자 계정 생성
create user 'user1'@'127.0.0.1' identified by '1111';
create user 'user2'@'localhost' identified by '2222';
create user 'user3'@'192.168.0.25' identified by '3333';
create user 'user4'@'%' identified by '4444';

-- 생성된 사용자 계정 정보 확인
select host,user from mysql.user;

-- 권한부여(GRANT)
-- on 뒤에는 권한을 부여할 데이터베이스 객체 명시

-- 
grant insert,update,delete on univdb.* to 'user1'@'127.0.0.1';
-- 'univDB' 데이터베이스의 모든 테이블들에 insert,update,delete 기능에 대해 user1이 접근 권한 가짐
-- 127.0.0.1 호스트에서 접근 가능 

grant all on *.* to 'user4'@'%' with grant option;
-- 모든 데이터베이스의 모든 테이블들에 접근권한을 user4에게 부여
-- user4는 다른 사용자에게 권한도 부여할 수 있음

grant select on univdb.학생 to 'user2'@'localhost';
-- 'univDB' 데이터베이스의 학생 테이블에 접근권한을 user2에게 부여
-- localhost로 접근 가능