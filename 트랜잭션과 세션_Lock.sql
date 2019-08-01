--
-- 세션에서 Lock의 개념
--
-- Lock이란, 데이터를 조작중인 세션 이외의 세션들은,
-- 이 데이터를 조작할 수 없도록 접근을 보류시키는 것이다.
--
-- 세션1 : SCOTT 계정 (SQL Dveloper)
-- 세션2 : SCOTT 계정 (CMD)

-- 세션1에서 UPDATE문 사용
UPDATE DEPT_TCL
   SET LOC = 'SEOUL'
 WHERE DEPTNO = 30;
 
-- UPDATE문 적용 결과
SELECT *
  FROM DEPT_TCL;
  
-- 세션2 에서 UPDATE문 실행
-- UPDATE문이 실행되지 않고, 대기상태가 된다 - HANG
-- HANG 이란, LOCK이 걸린 행 데이터를 UNLOCK 될 때 까지 기다리는 현상

-- 세션1에서 COMMIT 실행
COMMIT;

SELECT *
  FROM DEPT_TCL;
  
-- LOCK은 적용되는 데이터 범위에 따라, 
-- 행 레벨 록(ROW LEVEL LOCK),
-- 테이블 레벨 록(TABLE LEVEL LOCK)
-- 이 적용된다.
--
-- LOCK이 적용되는 데이터 범위가 크거나,
-- 오래 걸릴 경우,
-- 동료 개발자에게 양해 또는 미리 알려두자.