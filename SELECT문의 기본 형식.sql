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
    
    
--    
-- WHERE문
--

-- EMP 테이블에서 부서번호가 30인 데이터만 출력하기
SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
    
-- EMP 테이블에서 사원번호가 7782인 사원의 정보를 출력하기
SELECT *
    FROM EMP
    WHERE EMPNO = 7782;
    

--
-- WHERE ~ AND ~
--

-- EMP 테이블에서 부서번호가 30이고 업무가 SALESMAN데이터 출력하기
SELECT *
    FROM EMP
    WHERE DEPTNO = 30 AND JOB = 'SALESMAN';
    
    
-- EMP 테이블에서 사원번호가 7499 이고, 부서번호가 30인 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE EMPNO = 7499 AND DEPTNO = 30;
    

--
-- WHERE ~ OR ~
--

-- EMP 테이블에서 부서번호가 30이거나 업무가 CLERK인 직원정보 출력하기
SELECT *
    FROM EMP
    WHERE DEPTNO = 30 OR JOB = 'CLERK';
    
    
--
-- 산술연산자 (+, -, *, /)
--

SELECT *
    FROM EMP
    WHERE SAL * 12 = 36000;
    
    
-- EMP 테이블에서 급여가 3000 이상인 직원정보를 출력하기
SELECT *
    FROM EMP
    WHERE SAL >= 3000;
    
    
-- EMP 테이블에서 급여가 2500 이상이고 업무가 ANALYST인 직원정보 출력하기
SELECT *
    FROM EMP
    WHERE SAL >= 2500 AND JOB = 'ANALYST';
    
    
-- 사원이름의 첫 문자가 F와 같거나 뒤쪽인 것만 출력하기
SELECT *
    FROM EMP
    WHERE ENAME >= 'F';
    
    
-- 사원이름이 FORZ보다 앞쪽에 있는 사원정보를 출력하기
SELECT *
    FROM EMP
    WHERE ENAME <= 'FORZ';
    
    
--
-- 급여가 3000이 아닌 사원의 데이터를 출력하기 (4가지 방법)
-- [1]
SELECT *
    FROM EMP
    WHERE SAL != 3000;
    

-- [2]
SELECT *
    FROM EMP
    WHERE SAL <> 3000;
    
    
-- [3]
SELECT *
    FROM EMP
    WHERE SAL ^= 3000;
    
    
-- [4]
SELECT *
    FROM EMP
    WHERE NOT SAL = 3000;
    
    
--
--  WHERE ~ IN ~
--

-- EMP 테이블에서 직책이 MANAGER, SALESMAN, CLERK 인 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

SELECT *
    FROM EMP
    WHERE JOB IN('MANAGER', 'SALESMAN', 'CLERK');
    
    
-- EMP 테이블에서 직책이 MANAGER, SALESMAN, CLERK가 아닌 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE JOB != 'MANAGER' AND JOB <> 'SALESMAN' AND JOB ^= 'CLERK';
    
SELECT *
    FROM EMP
    WHERE JOB NOT IN('MANAGER', 'SALESMAN', 'CLERK');
    
    
-- EMP 테이블에서 IN연산자를 사용하여 부서번호가 10, 20번인 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE DEPTNO IN(10, 20);
    
    
--
-- WHERE ~ BETWEEN ~ AND ~
--

-- EMP 테이블에서 급여가 2000이상이고 3000이하인 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE SAL >= 2000 AND SAL <= 3000;
    
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;
    
-- EMP 테이블에서 급여가 2000원 미만이고, 3000 초과인 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE NOT SAL BETWEEN 2000 AND 3000;
    
    
--
-- LIKE 연산자
-- "일부 문자열"이 포함된 데이터를 조회하는 방법
--

-- EMP 테이블에서 이름이 S로 시작하는 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S%';
    
    
-- EMP 테이블에서 이름의 두번째 글자가 L인 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%';
    
    
-- EMP 테이블에서 이름에 AM이라는 단어를 포함하는 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%AM%';
    
    
-- EMP 테이블에서 이름에 AM이라는 단어가 포함되지 않는 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE NOT ENAME LIKE '%AM%';
    

--
-- IS NULL연산자
--

-- EMP 테이블에서 수당이 없는 사원정보를 출력하기
SELECT *
    FROM EMP
    WHERE COMM IS NULL;