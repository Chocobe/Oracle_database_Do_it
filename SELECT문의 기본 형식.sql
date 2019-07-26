-- EMP 테이블 전체 조회하기
SELECT * FROM EMP;


-- EMP 테이블의 사원번호, 이름, 부서번호 출력하기
SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;

    
--   
-- DISTINCT문 을 사용하여, 열 한개의 중복 제거하기
--

SELECT DISTINCT DEPTNO
    FROM EMP;
    

-- DISTINCT문 을 사용하여, 열 두개의 중복 제거하기
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
  
    
--
-- ALL문 을 사용하여, 중복까지 모두 출력하기
--

-- SELECT문 은 기본값이 ALL이기 때문에, ALL을 쓰지 않았을 때와 동일하다.
SELECT ALL JOB, DEPTNO
    FROM EMP;
    
    
-- 사원의 이름, 급여, 연간 총 수입, 추가수당 출력하기
SELECT ENAME, SAL, SAL * 12 + COMM, COMM
    FROM EMP;
    

-- 위와 동일하되, 연간 총 수입을 덧셈으로 연산하여 출력하기
SELECT ENAME, SAL, SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + SAL + COMM, COMM
    FROM EMP;


--
-- 위의 문제를 별칭(ALIAS)사용법 4가지로 출력하기
--

-- [1] ALIAS 사용_1
SELECT ENAME, SAL, SAL * 12 + COMM ANNSAL, COMM
    FROM EMP;
    
-- [2] ALIAS 사용_2
SELECT ENAME, SAL, SAL * 12 + COMM "ANNSAL", COMM
    FROM EMP;
    
-- [3] ALIAS 사용_3
SELECT ENAME, SAL, SAL * 12 + COMM AS ANNSAL, COMM
    FROM EMP;
    
-- [4] ALIAS 사용_4
SELECT ENAME, SAL, SAL * 12 + COMM AS "ANNSAL", COMM
    FROM EMP;


--
-- ORDER BY 사용하기
--

-- EMP 테이블에서 급여 기준으로 오름차순 정렬하기
SELECT *
    FROM EMP
    ORDER BY SAL ASC;
    

-- EMP 테이블에서 사원번호 기준으로 오름차순 정렬하기
SELECT *
    FROM EMP
    ORDER BY EMPNO ASC;
    
    
-- EMP 테이블에서 급여를 기준으로 내림차순 정렬하기
SELECT *
    FROM EMP
    ORDER BY SAL DESC;
    
    
-- EMP 테이블에서 사원번호를 기준으로 내림차순 정렬하기
SELECT *
    FROM EMP
    ORDER BY EMPNO DESC;
    
    
--
-- 다중 정렬 하기
--

-- EMP 테이블에서 부서번호를 기준으로 오름차순 하고,
-- 같은 부서일 경우, 급여를 기준으로 내림차순 출력하기
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;
    
    
-- EMP 테이블의 모든 열을 출력하되,
-- EMPNO -> EMPLOYEE_NO
-- ENAME -> EMPLOYEE_NAME
-- MGR -> MANAGER
-- SAL -> SALARY
-- COMM -> COMMISSION
-- DEPTNO -> DEPARTMENT_NO
-- (부서번호를 기준으로 내림차순, 부서번호가 같으면 사원 이름을 기준으로 오름차순 출력하기)
SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, MGR AS MANAGER,
        SAL AS SALARY, COMM AS COMMISSION, DEPTNO AS DEPARTMENT_NO
    FROM EMP
    ORDER BY DEPTNO DESC, ENAME ASC;