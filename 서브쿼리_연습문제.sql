--
-- 서브쿼리 연습문제
--

-- [1] 전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의
-- 사원정보, 부서정보 를 출력하기
SELECT  E.JOB, E.EMPNO, E.ENAME, E.SAL,
        DEPTNO, D.DNAME
  FROM  EMP E JOIN DEPT D USING(DEPTNO)
 WHERE  JOB = (SELECT  JOB
                 FROM  EMP
                WHERE  ENAME = 'ALLEN');
                
SELECT  E.JOB, E.EMPNO, E.ENAME, E.SAL,
        D.DEPTNO, D.DNAME
  FROM  EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
 WHERE  E.JOB = (SELECT  JOB
                   FROM  EMP
                  WHERE  ENAME = 'ALLEN');
                  
SELECT  E.JOB, E.EMPNO, E.ENAME, E.SAL,
        D.DEPTNO, D.DNAME
  FROM  EMP E, DEPT D
 WHERE  E.DEPTNO = D.DEPTNO
   AND  E.JOB = (SELECT  JOB
                   FROM  EMP
                  WHERE  ENAME = 'ALLEN');
                  
                  
-- [2] 전체 사원의 평균급여보다 높은 급여를 받는 사원들의
-- 사원정보, 부서정보, 급여등급 정보를 출력하기
SELECT  E.EMPNO, E.ENAME, D.DNAME, 
        TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS HIREDATE,
        D.LOC, E.SAL, S.GRADE
  FROM  EMP E 
        JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
        JOIN SALGRADE S ON(E.SAL BETWEEN S.LOSAL AND S.HISAL)
 WHERE  E.SAL > ANY(SELECT  AVG(SAL)
                      FROM  EMP);
                      
SELECT  E.EMPNO, E.ENAME, D.DNAME,
        TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS HIREDATE,
        D.LOC, E.SAL, S.GRADE
  FROM  EMP E 
        JOIN DEPT D USING(DEPTNO)
        JOIN SALGRADE S ON(E.SAL BETWEEN S.LOSAL AND S.HISAL)
 WHERE  E.SAL > ANY(SELECT  AVG(SAL)
                      FROM  EMP);
                      
SELECT  E.EMPNO, E.ENAME, D.DNAME,
        TO_CHAR(HIREDATE, 'YYY-MM-DD') AS HIREDATE,
        D.LOC, E.SAL, S.GRADE
  FROM  EMP E, DEPT D, SALGRADE S
 WHERE  E.DEPTNO = D.DEPTNO
   AND  E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND  E.SAL > ANY(SELECT  AVG(SAL)
                      FROM  EMP);
                      
                      
-- [3] 10번 부서에 근무하는 사원 중, 30번 부서에는 존재하지 않는
-- 직책을 가진 사원들의 사원정보, 부서정보를 출력하기
SELECT  E.EMPNO, E.ENAME, E.JOB,
        D.DEPTNO, D.DNAME, D.LOC
  FROM  EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
 WHERE  E.DEPTNO = 10
   AND  E.JOB NOT IN(SELECT  JOB
                            FROM  EMP
                           WHERE  DEPTNO = 30);
                           
SELECT  E.EMPNO, E.ENAME, E.JOB,
        DEPTNO, D.DNAME, D.LOC
  FROM  EMP E JOIN DEPT D USING(DEPTNO)
 WHERE  DEPTNO = 10
   AND  E.JOB NOT IN(SELECT  JOB
                       FROM  EMP
                      WHERE  DEPTNO = 30);
                      
SELECT  E.EMPNO, E.ENAME, E.JOB,
        D.DEPTNO, D.DNAME, D.LOC
  FROM  EMP E, DEPT D
 WHERE  E.DEPTNO = D.DEPTNO
   AND  E.DEPTNO = 10
   AND  E.JOB NOT IN(SELECT  JOB
                       FROM  EMP
                      WHERE  DEPTNO = 30);
                      
                      
-- [4] 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는
-- 사원들의 사원정보, 급여등급 정보를 출력하기
-- (다중행 서브쿼리, 단일행 서브쿼리 사용하기)

-- 다중행 서브쿼리
SELECT  E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM  EMP E JOIN SALGRADE S ON(E.SAL BETWEEN S.LOSAL AND S.HISAL)
 WHERE  E.SAL > ALL(SELECT  SAL
                      FROM  EMP
                     WHERE  JOB = 'SALESMAN');
                     
SELECT  E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM  EMP E, SALGRADE S
 WHERE  E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND  E.SAL > ALL(SELECT  SAL
                      FROM  EMP
                     WHERE  JOB = 'SALESMAN');
                     
-- 단일행 서브쿼리
SELECT  E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM  EMP E JOIN SALGRADE S ON(E.SAL BETWEEN S.LOSAL AND S.HISAL)
 WHERE  E.SAL > (SELECT  MAX(SAL)
                   FROM  EMP
                  WHERE  JOB = 'SALESMAN');
                  
SELECT  E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM  EMP E, SALGRADE S
 WHERE  E.SAL BETWEEN S.LOSAL AND S.HISAL
   AND  E.SAL > (SELECT  MAX(SAL)
                   FROM  EMP
                  WHERE  JOB = 'SALESMAN');