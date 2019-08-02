--
-- 동의어(Synonym)
-- 테이블, 뷰, 시퀀스 등, 객체의 원래 이름 대신 사용할 수 있는
-- 다른 이름을 부여하는 객체이다.
--
-- 주로, 테이블 이름이 너무 길어 사용하기 불편할 경우에 간편한 이름을 주기위해 사용한다.

-- SYNONYM을 만들기 위해선, 관리자 계정(SYS계정)의 권한부여가 필요하다.
GRANT CREATE SYNONYM TO SCOTT;

-- SYNONYM 생성하기
CREATE SYNONYM E
   FOR EMP;
   
-- 생성한 SYNONYM 조회하기 (EMP = E)
SELECT *
  FROM E;
  
-- USER_SYNONYM 조회하기
SELECT *
  FROM USER_SYNONYMS;
  
-- SYNONYM 삭제하기
DROP SYNONYM E;