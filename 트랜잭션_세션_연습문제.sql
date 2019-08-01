--
-- 트랜잭션과 세션 연습문제

-- 연습문제용 테이블 작성
CREATE TABLE DEPT_HW
    AS SELECT *
         FROM DEPT;
         
-- DEPTNO = 30 인 행이 LOCK됨
UPDATE DEPT_HW
   SET DNAME = 'DATABASE',
       LOC = 'SEOUL'
 WHERE DEPTNO = 30;
 
-- 트랜잭션 복구
ROLLBACK;

SELECT *
  FROM DEPT_HW;