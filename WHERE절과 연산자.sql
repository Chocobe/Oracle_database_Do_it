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
    
    
-- EMP 테이블에서 직속상사가 있는 사원정보를 출력하기
SELECT *
    FROM EMP
    WHERE MGR IS NOT NULL;
    
    
--
-- UNION 집합연산자
--

-- EMP 테이블에서 부서번호가 10 또는 20인 사원의 직원번호, 이름, 급여, 부서번호를 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;
    
    
-- 동일한 결과를 UNION연산자 사용하기
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
-- 동일한 결과를 UNION ALL연산자 사용하기
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
    
--
-- MINUS연산자
--

-- EMP 테이블에서 부서번호가 10이 아닌 사원의
-- 직원번호, 이름, 급여, 부서번호를 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
    
--
-- INTERSECT연산자
--

-- EMP 테이블에서 부서번호가 10인 사원의
-- 사원번호, 이름, 급여, 부서번호를 출력하기
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10;
    
    
-- 연습문제
-- [1] EMP 테이블을 사용하여 다음과 같이 사원 이름(ENAME)이 S로 끝나는
-- 사원 데이터를 모두 출력하시오
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S';
    
    
-- [2] EMP 테이블에서 30번 부서에서 근무하고 있는 사원 중, 직책이
-- SALESMAN인 사원의 사원번호, 이름, 직책, 급여, 부서번호를 출력하시오
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30 AND JOB = 'SALESMAN';
    
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE JOB = 'SALESMAN';
    
    
-- [3] EMP 테이블에서 20번, 30번 부서에 근무하고 있는 사원 중,
-- 급여가 2000초과인 사원을 다음 두가지 방식의 SELECT문을 사용하여
-- 사원번호, 이름, 급여, 부서번호를 출력하시오

-- [3 - 1] 집합 연산자를 사용하지 않은 방식
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN(20, 30) AND SAL > 2000;
    
-- [3 - 2] 집합 연산자를 사용한 방식
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN(20, 30)
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE SAL > 2000;
    
-- [4] NOT BETWEEN A AND B연산자를 쓰지 않고,
-- 급여 열 값이 2000 이상, 3000이하 범위 이회의 값을
-- 가진 데이터만 출력하시오
SELECT *
    FROM EMP
    WHERE NOT (SAL >= 2000 AND SAL <= 3000);
    
-- [5] 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중
-- 급여가 1000 ~ 2000 사이가 아닌 사원의
-- 이름, 사원번호, 급여, 부서번호를 출력하시오
SELECT ENAME, EMPNO, SAL, DEPTNO
    FROM EMP
    WHERE NOT (SAL BETWEEN 1000 AND 2000) AND
        ENAME LIKE '%E%' AND
        DEPTNO = 30;
        
-- [6] 추가수당이 존재하지 않고 상급자가 있고
-- 직책이 MANAGER, CLERK인 사원 중에서
-- 사원 이름의 두번째 글자가 L이 아닌 사원의 정보를 출력하시오
SELECT *
    FROM EMP
    WHERE COMM IS NULL
INTERSECT
SELECT *
    FROM EMP
    WHERE JOB IN('MANAGER', 'CLERK')
INTERSECT
SELECT *
    FROM EMP
    WHERE NOT (ENAME LIKE '_L%');