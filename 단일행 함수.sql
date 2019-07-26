--
-- 오라클 함수 - 단일행 함수

--
-- 문자 데이터 가공 함수
-- UPPER, LOWER, INITCAP
--

-- EMP 테이블에서 사원이름을 원본, 대문자, 소문자, 첫글자만 대문자
-- 형식으로 출력하기
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
    

-- EMP 테이블에서 이름이 SCOTT인 사원을 검색하되
-- 대, 소문자 상관없이 검색되도록 하기
SELECT *
    FROM EMP
    WHERE UPPER('SCOTT') = UPPER(ENAME);
    
SELECT *
    FROM EMP
    WHERE LOWER('SCOTT') = LOWER(ENAME);
    
    
-- EMP 테이블에서 사원이름을 대문자로 출력하기
SELECT UPPER(ENAME)
    FROM EMP;
    
    
--
-- 문자열 길이를 구하는 함수
-- LENGTH함수
--

-- EMP 테이블에서 모든 사원의 이름과 이름의 길이를 출력하기
SELECT ENAME, LENGTH(ENAME)
    FROM EMP;
    
    
-- EMP 테이블에서 사원이름의 길이가 5이상인 정보를 출력하기
SELECT *
    FROM EMP
    WHERE LENGTH(ENAME) >= 5;
    
    
--
-- 문자열의 BYTE 수를 구하는 함수
-- LENGTHB
--
-- DUAL 테이블(= 더미 테이블)
-- 데이터 저장공간이 아닌, 임시연산 또는 함수의 결과만 확인하는 용도
--

-- '한글'을 사용하여 LENGTH함수와 LENGTHB함수 사용하기
SELECT LENGTH('한글'), LENGTHB('한글')
    FROM DUAL;