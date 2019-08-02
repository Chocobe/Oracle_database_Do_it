--
-- 객체 - 데이터 사전
--

--
-- DICT명령어 (= DICTIONARY)
-- SCOTT계정에서 사용 가능한 데이터 사전 살펴보기
SELECT * FROM DICT;

SELECT * FROM DICTIONARY;


--
-- USER_접두어
-- 현재 데이터베이스에 접속한 계정이 소유한 객체 정보가 보관되어 있다.
--
-- USER_TABLES를 검색하면, 이 계정이 소유한 테이블 정보를 찾을 수 있다.
SELECT TABLE_NAME
  FROM USER_TABLES;
  
  
--
-- ALL_접두어
-- 현재 데이터베이스에 접속한 계정으로 사용할 수 있는 모든 객체 정보를 알 수 있다.
SELECT OWNER, TABLE_NAME
  FROM ALL_TABLES;
  
  
--
-- DBA_접두어
-- 데이터베이스 관리 권한을 가진 사용자만 조회할 수 있는 데이터 사전
-- SYS, SYSTEM 계정만 접근 가능
SELECT *
  FROM DBA_TABLES;
  
  
-- DBA계정으로 사용자 SCOTT 정보 조회하기
SELECT *
  FROM DBA_USERS
 WHERE USERNAME = 'SCOTT';