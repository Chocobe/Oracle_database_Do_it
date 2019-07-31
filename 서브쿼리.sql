--
-- 서브쿼리
-- SQL문을 실행하는데 필요한 데이터를
-- 추가로 조회하기 위해 SQL문 내부에 추가로 사용하는 SELECT문

-- EMP 테이블에서 JONES의 급여보다 많이 받는 사원의 정보 출력하기
-- [1] JONES의 급여 출력
SELECT  SAL
  FROM  EMP
 WHERE  ENAME = 'JONES';

-- [2] JONES의 급여(2975)보다 많이 받는 사원 출력하기
SELECT  *
  FROM  EMP
 WHERE  SAL > 2975;
 
-- 위의 [1], [2]의 과정을 서브쿼리를 이용하여 하나로 만들기
SELECT  *
  FROM  EMP
 WHERE  SAL > (SELECT  SAL
                 FROM  EMP
                WHERE  ENAME = 'JONES');
                
                
-- 서브쿼리를 사용하여 EMP 테이블의 사원정보 중에서
-- 사원이름이 ALLEN인 사원의 추가수당 보다 많은 추가수당을 받는
-- 사원정보를 출력하기
SELECT  *
  FROM  EMP
 WHERE  COMM > (SELECT  COMM
                  FROM  EMP
                 WHERE  ENAME = 'ALLEN');
                 
                 
--
-- 단일행 서브쿼리
-- 실행결과가 단 하나의 행으로 나오는 서브쿼리를 말한다

-- EMP 테이블에서 SCOTT보다 빨리 입사한 사원정보 출력하기
SELECT  *
  FROM  EMP
 WHERE  HIREDATE < (SELECT  HIREDATE
                      FROM  EMP
                     WHERE  ENAME = 'SCOTT');
                     
                     
-- EMP 테이블에서 20번 부서에 속한 사원 중
-- 전체 사원의 평균급여보다 높은 급여를 받는 사원의
-- 사원정보와 부서정보 출력하기
SELECT  E.EMPNO, E.ENAME, E.JOB, E.SAL,
        DEPTNO, D.DNAME, D.LOC
  FROM  EMP E JOIN DEPT D USING(DEPTNO)
 WHERE  DEPTNO = 20
   AND  E.SAL > (SELECT  AVG(SAL)
                 FROM  EMP);

SELECT  E.EMPNO, E.ENAME, E.JOB, E.SAL,
        D.DEPTNO, D.DNAME, D.LOC
  FROM  EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
 WHERE  E.DEPTNO = 20
   AND  E.SAL > (SELECT  AVG(SAL)
                   FROM  EMP);
                   
SELECT  E.EMPNO, E.ENAME, E.JOB, E.SAL,
        D.DEPTNO, D.DNAME, D.LOC
  FROM  EMP E, DEPT D
 WHERE  E.DEPTNO = D.DEPTNO
   AND  E.DEPTNO = 20
   AND  SAL > (SELECT  AVG(SAL)
                 FROM  EMP);
                 
                 
-- 서브쿼리를 사용하여 EMP 테이블에서 전체 사원의 평균급여보다
-- 작거나 같은 급여를 받고 있는 20번부서의
-- 사원정보, 부서정보 를 출력하기
SELECT  E.EMPNO, E.ENAME, E.JOB, E.SAL,
        D.DEPTNO, D.DNAME, D.LOC
  FROM  EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
 WHERE  E.DEPTNO = 20
   AND  SAL <= (SELECT  AVG(SAL)
                  FROM  EMP);
                  
SELECT  E.EMPNO, E.ENAME, E.JOB, E.SAL,
        DEPTNO, D.DNAME, D.LOC
  FROM  EMP E JOIN DEPT D USING(DEPTNO)
 WHERE  DEPTNO = 20
   AND  SAL <= (SELECT  AVG(SAL)
                  FROM  EMP);
                  
SELECT  E.EMPNO, E.ENAME, E.JOB, E.SAL,
        D.DEPTNO, D.DNAME, D.LOC
  FROM  EMP E, DEPT D
 WHERE  E.DEPTNO = D.DEPTNO
   AND  E.DEPTNO = 20
   AND  SAL <= (SELECT  AVG(SAL)
                  FROM  EMP);
                  
                  
--
-- 다중행 서브쿼리
-- 실행결과가 여러개의 행으로 나오는 서브쿼리

-- IN연산자

-- 각 부서별 최고 급여를 받는 사원정보 출력하기
SELECT  *
  FROM  EMP E
 WHERE  SAL IN(SELECT  MAX(SAL)
                 FROM  EMP
                GROUP BY  DEPTNO);
  
--              
-- ANY, SOME연산자
-- 서브쿼리가 반환한 여러 결과값 중,
-- 메인쿼리와 조건식을 사용한 결과가 하나라도 TRUE이면,
-- 메인쿼리 조건식을 TRUE로 반환하는 연산자
--

-- EMP 테이블에서 30번 부서 사원들의 최대급여보다
-- 적은 급여를 받는 사원정보 출력하기
-- (ANY연산자 사용)
SELECT  *
  FROM  EMP
 WHERE  SAL < ANY(SELECT  SAL
                    FROM  EMP
                   WHERE  DEPTNO = 30);
                   
-- EMP 테이블에서 30번 부서 사원들의 최소급여보다
-- 많은 급여를 받는 사원정보 출력하기
-- (SOME연산자 사용)
SELECT  *
  FROM  EMP
 WHERE  SAL > SOME(SELECT  SAL
                     FROM  EMP
                    WHERE  DEPTNO = 30);
                    
                    
--
-- ALL연산자
-- 서브쿼리의 모든 결과값이 조건에 만족해야 TRUE 반환
--
                    
                    
-- EMP 테이블에서 30번 부서 사원들의 최소급여보다
-- 적은 급여를 받는 사원정보 출력하기
-- (ALL연산자 사용)
SELECT  *
  FROM  EMP
 WHERE  SAL < ALL(SELECT  SAL
                    FROM  EMP
                   WHERE  DEPTNO = 30);
                   
-- EMP 테이블에서 30번 부서 사원들의 최대급여보다
-- 많은 급여를 받는 사원정보 출력하기
-- (ALL연산자 사용)
SELECT  *
  FROM  EMP
 WHERE  SAL > ALL(SELECT  SAL
                    FROM  EMP
                   WHERE  DEPTNO = 30);
                   

--
-- EXISTS연산자
-- 서브쿼리에 결과값이 하나라도 있으면 TRUE 반환
--

-- EMP테이블에서 부서번호가 10번인 사원정보 출력하기
-- (EXISTS연산자 사용)
SELECT  *
  FROM  EMP
 WHERE  EXISTS(SELECT  *
                 FROM  EMP
                WHERE  DEPTNO = 10);
                
-- EMP 테이블에서 부서번호가 40번인 사원정보 출력하기
-- (EXISTS연산자 사용)
SELECT  *
  FROM  EMP
 WHERE  EXISTS(SELECT  *
                 FROM  EMP
                WHERE  DEPTNO = 40);
                
                
-- 서브쿼리를 사용하여 EMP 테이블의 사원 중에 10번부서에 속한
-- 모든 사원들보다 일찍 입사한 사원정보 출력하기
SELECT  *
  FROM  EMP
 WHERE  HIREDATE < ALL(SELECT  HIREDATE
                         FROM  EMP
                        WHERE  DEPTNO = 10);
                        
                        
--
-- 다중열 서브쿼리
-- 서브쿼리의 SELECT절에 비교할 열(데이터)를 여러개 지정하는 방식
-- 여러개의 열을 지정할 때는 괄호()를 사용한다
--

-- 다중열 서브쿼리를 이용하여 각 부서별 최고 급여 출력하기
SELECT  DEPTNO, SAL
  FROM  EMP
 WHERE  (DEPTNO, SAL) IN(SELECT  DEPTNO, MAX(SAL)
                           FROM  EMP
                          GROUP BY DEPTNO);
                          
                          
--
-- 인라인 뷰
-- FROM절에 사용한 서브쿼리(SELECT)문
--
-- 테이블 내 규모가 큰 경우,
-- 현재 작업에 불필요한 열이 너무 많을 경우 유용
--
-- 가독성이 떨어지고, 성능저하가 발생한다.
--

-- EMP 테이블에서 부서번호가 10번인 사원들의 사원정보, 부서정보 출력하기
-- (인라인 뷰 사용)
SELECT  E10.EMPNO, E10.ENAME, E10.DEPTNO,
        D.DNAME, D.LOC
  FROM  (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
        (SELECT * FROM DEPT) D
 WHERE  E10.DEPTNO = D.DEPTNO;
 

--
-- WITH절
-- 인라인 뷰에서 지정한 서브쿼리와 별칭을
-- 메인쿼리 시작 직전에 지정하여 사용하는 방법
--
-- 서브쿼리가 몇 십, 몇 백줄 이상 넘어가는 큰 규모에서
-- 메인쿼리와 서브쿼리를 분리하는데 유용하다.
--

-- EMP 테이블에서 부서번호가 10번인 사원들의 사원정보, 부서정보 출력하기
-- (WITH절 사용)
  WITH  E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
        D   AS (SELECT * FROM DEPT)
SELECT  E10.EMPNO, E10.ENAME, E10.DEPTNO,
        D.DNAME, D.LOC
  FROM  E10, D
 WHERE  E10.DEPTNO = D.DEPTNO;
 
 
--
-- 스칼라 서브쿼리
-- 메인쿼리의 SELECT문에 사용하는 서브쿼리(SELECT문)이다
-- 메인쿼리의 열 하나로써 서브쿼리를 사용하는 방법인데,
-- 주의할 점은 스칼라 서브쿼리의 결과는 반드시 하나의 결과를 반환하도록 해야 한다
--

-- EMP 테이블에서 모든 사원의 사원정보, 부서정보, 급여등급 을 출력하기
-- (스칼라 서브쿼리 사용)
SELECT  E.EMPNO, E.ENAME, E.JOB, E.SAL,
        (SELECT  GRADE
           FROM  SALGRADE
          WHERE  E.SAL BETWEEN LOSAL AND HISAL) AS GRADE,
        E.DEPTNO,
        (SELECT  DNAME
           FROM  DEPT
          WHERE  E.DEPTNO = DEPT.DEPTNO) AS DNAME
  FROM  EMP E;