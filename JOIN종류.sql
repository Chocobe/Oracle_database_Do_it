--
-- JOIN종류

-- 등가조인 (= 내부조인, 단순조인)
-- 두 테이블의 특정 열값이 일치한 데이터를 기준으로 출력행을 선정하는 방식
--
-- 등가조인을 WHERE 조건식으로 사용시, 데카르트곱(= 카텐셜 프로덕트)현상이 일어나지 않도록
-- 하기위한 최소한의 WHERE 조건식 개수는, "조인하는 테이블 수 - 1" 개가 반드시 필요하다.

-- 등가조인 예)
-- 사원정보와 부서정보를 연관지어 출력하기
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    
-- 급여가 3000이상인 사원정보와 부서정보를 연관지어 출력하기
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND
        SAL >= 3000;
        
-- EMP 테이블 별칭을 E, DEPT 테이블의 별칭을 D로 하고 등가조인을 했을 때,
-- 급여가 2500이하이고, 사원번호가 9999인 사원의 정보를 출력하기
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND
        E.SAL <= 2500 AND
        E.EMPNO = 9999;
        
        
--
-- 비등가조인
-- 등가조인 이외의 모든 조인방식을 말한다

-- EMP 테이블의 사원정보를 SALGRADE 테이블의 범위에 맞게 출력하기
SELECT *
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
    
    
--
-- 자체조인
-- 자기 자신을 조인하는 방식
-- FROM절에 동일한 테이블을 명시하되, 별칭을 다르게 지정하여 조인한다

-- EMP 테이블에서 상사가 있는 직원의 정보와 상사의 정보 출력하기
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO;
    
    
--
-- 외부조인
-- 만족하는 조건이 없는 열도 출력하는 방식의 조인
--
-- 외부조인 종류
-- 왼쪽 외부 조인(LEFT OUTER JOIN)
--      WHERE TABLE_1.COL = TABLE_2.COL(+)
-- 오른쪽 외부 조인(RIGHT OUTER JOIN)
--      WHERE TABLE_1.COL(+) = TABLE_2.COL

-- EMP 테이블에서 사원의 정보와 상사의 정보를 출력하기 
-- (LEFT OUTER JOIN 사용)
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO(+);
    
-- (RIGHT OUTER JOIN 사용)
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
        E2.EMPNO AS MGR_EMPNO,
        E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
    WHERE E1.MGR(+) = E2.EMPNO;