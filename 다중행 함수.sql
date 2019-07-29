--
-- 하나의 열에 출력 결과를 담는 다중행 함수

-- SUM함수
-- 데이터의 합을 구하는 함수
-- SUM함수는 자동으로 NULL값은 제외하고 연산해 준다.
-- (+ 연산자를 사용하면 NULL값이 있을 경우, NULL이 반환된다)
SELECT SUM(SAL)
    FROM EMP;
    
SELECT SUM(COMM)
    FROM EMP;
    

-- SUM함수 옵션 "DISTINCT", "ALL"
-- "DISTINCT" : 중복값은 제거하여 연산
-- "ALL" : 중복값 상관없이 연산
SELECT SUM(DISTINCT SAL),
        SUM(ALL SAL),
        SUM(SAL)
    FROM EMP;
-- 위 쿼리의 경고는 그룹을 묶지 않았기 때문


-- EMP 테이블의 모든 사원들에 대하여 급여와 추가수당의 합계를 구하기
SELECT SUM(SAL), SUM(COMM)
    FROM EMP;
    
    
--
-- COUNT함수 (데이터의 개수 구하는 함수)
-- 옵션 : DISTINCT, ALL
-- 옵션 생략 시, 기본옵션 : ALL

-- EMP 테이블에서 사원수를 출력하기
SELECT COUNT(*) 
    FROM EMP;
    
-- EMP 테이블에서 부서번호가 30번인 직원의 수 출력하기
SELECT COUNT(*)
    FROM EMP
    WHERE DEPTNO = 30;
    
-- EMP 테이블에서 급여 개수 출력하기
SELECT COUNT(DISTINCT SAL),
        COUNT(ALL SAL),
        COUNT(SAL)
    FROM EMP;
    
-- EMP 테이블에서 추가수당(COMM) 개수 출력하기
-- COUNT함수 역시, "NULL"값은 출력 개수에서 제외된다.
SELECT COUNT(COMM)
    FROM EMP;
    
SELECT COUNT(COMM)
    FROM EMP
    WHERE COMM IS NOT NULL;
    
    
--
-- MAX함수 (데이터의 최대값 구하기)

-- EMP 테이블에서 부서번호가 10번인 사원들의 최대급여 출력하기
SELECT MAX(SAL)
    FROM EMP
    WHERE DEPTNO = 10;
    

--    
-- MIN함수 (데이터의 최소값 구하기)

-- EMP 테이블에서 부서번호가 10번인 사원들의 최소급여 출력하기
SELECT MIN(SAL)
    FROM EMP
    WHERE DEPTNO = 10;
    

--
-- MAX함수, MIN함수는 문자, 날짜에도 사용가능하다.

-- EMP 테이블에서 부서번호가 20번인 사원들 중, 제일 최근 입사일 출력하기
SELECT MAX(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;
    
-- EMP 테이블에서 부서번호가 20번인 사원들 중, 제일 오래된 입사일 출력하기
SELECT MIN(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;
    
    
--
-- AVG함수 (데이터의 평균을 구하는 함수)
-- 옵션 : DISTINCT, ALL
-- 기본옵션 : ALL

-- EMP 테이블에서 부서번호가 30번인 사원들의 평균 급여 출력하기
SELECT AVG(SAL)
    FROM EMP
    WHERE DEPTNO = 30;
        
-- EMP 테이블에서 부서번호가 30번인 사원들의 중복을 제거한 급여의 평균값 출력하기
SELECT AVG(DISTINCT SAL)
    FROM EMP
    WHERE DEPTNO = 30;
    
-- EMP 테이블에서 부서번호가 30번인 사원들의 평균 추가수당을 출력하기
SELECT AVG(COMM)
    FROM EMP
    WHERE DEPTNO = 30;