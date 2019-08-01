--
-- 트랜잭션 연습을 위한 임시 테이블 생성
CREATE TABLE DEPT_TCL
    AS SELECT *
         FROM DEPT;

-- 현재 트랜잭션 작업 수행
INSERT INTO DEPT_TCL
             VALUES(50, 'DATABASE', 'SEOUL');
             
UPDATE DEPT_TCL
   SET LOC = 'BUSAN'
 WHERE DEPTNO = 40;
 
DELETE FROM DEPT_TCL
 WHERE DNAME = 'RESEARCH';
 
SELECT *
  FROM DEPT_TCL;
  
-- 현재 트랜잭션의 작업을 취소
ROLLBACK;


-- 현재 트랜잭션 작업 수행
INSERT INTO DEPT_TCL(DEPTNO, DNAME, LOC)
              VALUES(50, 'NETWORK', 'SEOUL');
              
UPDATE DEPT_TCL
   SET LOC = 'BUSAN'
 WHERE DEPTNO = 20;
 
DELETE FROM DEPT_TCL
 WHERE DEPTNO = 40;
 
SELECT *
  FROM DEPT_TCL;

-- 현재 트랜잭션의 작업을 영구반영
COMMIT;