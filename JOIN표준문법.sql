--
-- SQL-99 표준 문법으로 배우는 JOIN

--
-- NATURAL JOIN
-- JOIN의 대상이 되는 두 테이블에서 이름과 자료형이 동일한 열을 찾은 후,
-- 그 열을 기준으로 등가조인 하는 방법

-- EMP 테이블의 사원정보를 DEPT 테이블과 연관지어 출력하기
-- (NATURAL JOIN 사용)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        DEPTNO, D.DNAME, D.LOC
    FROM EMP E NATURAL JOIN DEPT D;
    

--
-- JOIN ~ USING
-- NATURAL JOIN과 동일한 등가조인 방식이지만, USING키워드에 기준열을 명시하여 사용한다

-- 급여가 3000이상인 사원 중에서 
-- EMP 테이블의 사원정보를 DEPT 테이블과 연관지어 출력하기
-- (JOIN ~ USING 사용)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
        DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D USING(DEPTNO)
    WHERE E.SAL >= 3000;
    
    
--
-- JOIN ~ ON
-- 급여가 3000이하인 사원 중에서
-- EMP 테이블의 사원정보를 DEPT 테이블과 연관지어 출력하기
-- (JOIN ~ ON 사용)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        E.DEPTNO, D.DNAME
    FROM EMP E JOIN DEPT D
            ON E.DEPTNO = D.DEPTNO
    WHERE SAL <= 3000;
    
    
--
-- OUTER JOIN
-- 외부 조인 방법
--
-- 왼쪽 외부 조인     : LEFT OUTER JOIN
-- 오른쪽 외부 조인   : RIGHT OUTER JOIN
-- 전체 외부 조인     : FULL OUTER JOIN

-- EMP 테이블에서 사원의 정보와 상사의 정보 출력하기
-- (LEFT OUTER JOIN 사용)
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
    FROM EMP E1 LEFT OUTER JOIN EMP E2
        ON E1.MGR = E2.EMPNO;
        
-- EMP 테이블에서 사원의 정보와 상사의 정보 출력하기
-- (RIGHT OUTER JOIN 사용)
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
    FROM EMP E1 RIGHT OUTER JOIN EMP E2
    ON E1.MGR = E2.EMPNO
    ORDER BY E1.DEPTNO, MGR_EMPNO;
    
-- EMP 테이블에서 사원의 정보와 상사의 정보 출력하기
-- (FULL OUTER JOIN 사용)
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
    FROM EMP E1 FULL OUTER JOIN EMP E2
    ON E1.MGR = E2.EMPNO
    ORDER BY E1.EMPNO, MGR_EMPNO;
    

--
-- 3개 이상의 JOIN

-- EMP 테이블에서 사원의 정보와 부서이름, 상사의 정보를 출력하기
SELECT E1.EMPNO, E1.ENAME, E1.MGR, 
        D.DNAME,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
    FROM EMP E1 JOIN DEPT D ON E1.DEPTNO = D.DEPTNO
            JOIN EMP E2 ON E1.MGR = E2.EMPNO;
            

-- [조건1] EMP 테이블과 DEPT 테이블의 조인 조건은 부서번호가 같은 때
-- [조건2] 급여는 3000 이상이며 직속상관이 반드시 있어야 할것
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D USING(DEPTNO)
    WHERE E.SAL >= 3000 AND E.MGR IS NOT NULL;