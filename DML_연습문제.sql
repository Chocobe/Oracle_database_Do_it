--
-- DML 연습문제
--

-- EMP, DEPT, SALGRADE 테이블 복사본 만들기
CREATE  TABLE CHAP10HW_EMP
    AS  SELECT  *
          FROM  EMP;
          
CREATE  TABLE  CHAP10HW_DEPT
    AS  SELECT  *
          FROM  DEPT;

CREATE  TABLE  CHAP10HW_SALGRADE
    AS  SELECT  *
          FROM  SALGRADE;


-- [1] CHAP10HW_DEPT 테이블에
-- 50, 60, 70, 80번 부서를 등록하기
INSERT  INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
                    VALUES(50, 'ORACLE', 'BUSAN');
                    
INSERT  INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
                    VALUES(60, 'SQL', 'ILSAN');
                    
INSERT  INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
                    VALUES(70, 'SELECT', 'INCHEON');
                    
INSERT  INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
                    VALUES(80, 'DML', 'BUNDANG');


-- [2] CHAP10HW_EMP 테이블에 사원등록하기
INSERT  INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, 
                          HIREDATE, 
                          SAL, COMM, DEPTNO)
                   VALUES(7201, 'TEST_USER1', 'MANAGER', 7788, 
                          TO_DATE('2016-01-02', 'YYYY-MM-DD'),
                          4500, NULL, 50);
                          
INSERT  INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, 
                          HIREDATE, 
                          SAL, COMM, DEPTNO)
                   VALUES(7202, 'TEST_USER2', 'CLERK', 7201, 
                          TO_DATE('2016-02-21', 'YYYY-MM-DD'),
                          1800, NULL, 50);
                          
INSERT  INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR,
                          HIREDATE, 
                          SAL, COMM, DEPTNO)
                   VALUES(7203, 'TEST_USER3', 'ANALYST', 7201,
                          TO_DATE('2016-04-11', 'YYYY-MM-DD'),
                          3400, NULL, 60);
                          
INSERT  INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, 
                          HIREDATE, 
                          SAL, COMM, DEPTNO)
                   VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201,
                          TO_DATE('2016-05-31', 'YYYY-MM-DD'),
                          2700, 300, 60);
                          
INSERT  INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, 
                          HIREDATE, 
                          SAL, COMM, DEPTNO)
                   VALUES(7205, 'TEST_USER5', 'CLERK', 7201,
                          TO_DATE('2016-07-20', 'YYYY-MM-DD'),
                          2600, NULL, 70);
                          
INSERT  INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, 
                          HIREDATE, 
                          SAL, COMM, DEPTNO)
                   VALUES(7206, 'TEST_USER6', 'CLERK', 7201,
                          TO_DATE('2016-09-08', 'YYYY-MM-DD'),
                          2600, NULL, 70);
                          
INSERT  INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR,
                          HIREDATE,
                          SAL, COMM, DEPTNO)
                   VALUES(7207, 'TEST_USER7', 'LECTURER', 7201,
                          TO_DATE('2016-10-28', 'YYYY-MM-DD'),
                          2300, NULL, 80);
                          
INSERT  INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, 
                          HIREDATE, 
                          SAL, COMM, DEPTNO)
                   VALUES(7208, 'TEST_USER8', 'STUDENT', 7201,
                          TO_DATE('2018-03-09', 'YYYY-MM-DD'),
                          1200, NULL, 80);
                          
                          
-- [3] CHAP10HW_EMP 에 속한 사원 중, 50번 부서에서 근무하는 사원들의
-- 평균급여보다 많은 급여를 받고 있는 사원들을 70번 부서로 옮기기
UPDATE CHAP10HW_EMP
   SET DEPTNO = 70
 WHERE SAL > (SELECT AVG(SAL)
                FROM CHAP10HW_EMP
               WHERE DEPTNO = 50);
-- 검사
SELECT *
  FROM CHAP10HW_EMP
 WHERE SAL > (SELECT AVG(SAL)
                FROM CHAP10HW_EMP
               WHERE DEPTNO = 50);
-- 결과
SELECT *
  FROM CHAP10HW_EMP
 ORDER BY DEPTNO;


-- [4] CHAP10HW_EMP에 속한 사원 중, 60번 부서의 사원 중에 입사일이
-- 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10%인상하고
-- 80번 부서로 옮기기
UPDATE CHAP10HW_EMP
   SET SAL = SAL * 1.1,
       DEPTNO = 80
 WHERE HIREDATE > (SELECT MIN(HIREDATE)
                     FROM CHAP10HW_EMP
                    WHERE DEPTNO = 60);
-- 검사
SELECT *
  FROM CHAP10HW_EMP
 WHERE HIREDATE > (SELECT MIN(HIREDATE)
                     FROM CHAP10HW_EMP
                    WHERE DEPTNO = 60);
-- 결과
SELECT *
  FROM CHAP10HW_EMP;
  
  
-- [5] CHAP10HW_EMP 테이블에서 급여등급이 5인 사원 삭제하기
DELETE FROM CHAP10HW_EMP
 WHERE EMPNO IN (SELECT EMPNO
                  FROM CHAP10HW_EMP E, CHAP10HW_SALGRADE S
                 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                   AND S.GRADE = 5);
-- 검사
SELECT *
  FROM CHAP10HW_EMP
 WHERE EMPNO IN (SELECT EMPNO
                   FROM CHAP10HW_EMP E, CHAP10HW_SALGRADE S
                  WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                    AND S.GRADE = 5);
-- 결과
SELECT *
  FROM CHAP10HW_EMP;