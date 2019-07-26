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
    
    
--
-- SUBSTR함수
-- 문자열의 일부를 추출하는 함수
--

-- EMP 테이블에서 직책을 대상으로 첫번째 문자부터 두글자,
-- 세번째 문자부터 두글자, 5번째 문자부터 시작한 값을 출력하기
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
    FROM EMP;


-- EMP 테이블에서 모든 사원이름을 세번째 글자부터 끝까지 출력하기
SELECT SUBSTR(ENAME, 3)
    FROM EMP;
    
    
-- EMP 테이블의 JOB을 대상으로 SUBSTR 테스트하기
SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)),
        SUBSTR(JOB, -LENGTH(JOB), 2),
        SUBSTR(JOB, -3)
    FROM EMP;
    
    
--
-- INSTR함수
-- 특정 문자(문자열)의 위치값 구하기 (몇 번째인가)
--
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
        INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
        INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
    FROM DUAL;
    
    
-- INSTR함수를 LIKE연산자와 동일한 기능으로 사용해 보기
-- EMP 테이블에서 이름에 S가 들어가는 사원정보를 출력하기
SELECT *
    FROM EMP
    WHERE INSTR(ENAME, 'S') > 0;
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S%';
    
    
--
-- REPLACE함수
-- 특정 문자열을 다른 문자열로 대체하기
--

-- REPLACE 예제
SELECT '010-1234-5678' AS REPLACE_BEFORE,
        REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
        REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;
    
    
--
-- LPAD, RPAD
-- 데이터의 자릿수를 정하고, 빈 공간은 지정한 문자로 대체하는 함수
-- LPAD (Left Padding)  - 빈 공간이 좌측에 채워짐
-- RPAD (Right Padding) - 빈 공간이 우측에 채워짐
--

-- LPAD, RPAD 예제_1)
SELECT 'Oracle', 
        LPAD('Oracle', 5, '#') AS LPAD_1,
        RPAD('Oracle', 10, '*') AS RPAD_1,
        LPAD('Oracle', 10) AS LPAD_2,
        RPAD('Oracle', 10) AS RPAD_2
    FROM DUAL;
    

-- LPAD, RPAD 예제_2)
-- 주민번호, 폰번호 와 같은 개인정보의 일부만 노출 시키기
SELECT RPAD('971225-', 14, '*'),
        RPAD('010-1234-', 13, '*')
    FROM DUAL;
    
    
--
-- CONCAT함수
-- 두 문자열 데이터를 합치는 함수
--

-- EMP 테이블에서 '사원번호 : 사원명' 의 형식으로 출력하기
SELECT CONCAT(EMPNO, CONCAT(' : ', ENAME)) AS "사원번호 : 사원명"
    FROM EMP;
    

--
-- ||연산자
-- CONCAT과 동일한 기능(문자열 합치기)
--
SELECT EMPNO || ' : ' || ENAME AS "사원번호 : 사원명"
    FROM EMP;
    
    
--
-- TRIM, LTRIM, RTRIM함수
-- 특정 문자를 지우는 함수
--

-- 공백을 제거하는 예제)
SELECT '[' || TRIM(' _ _ Oracle _ _ ') || ']' AS TRIM,
        '[' || TRIM(LEADING FROM ' _ _ Oracle _ _ ') || ']' AS TRIM_LEADING,
        '[' || TRIM(TRAILING FROM ' _ _ Oracle _ _ ') || ']' AS TRIM_TRAILING,
        '[' || TRIM(BOTH FROM ' _ _ Oracle _ _ ') || ']' AS TRIM_BOTH
    FROM DUAL;
    
-- '_'를 삭제하는 예제)
SELECT '[' || TRIM('_' FROM '_ _ Oracle _ _') || ']' AS TRIM,
        '[' || TRIM(LEADING '_' FROM '_ _ Oracle _ _' || ']') AS TRIM_LEADING,
        '[' || TRIM(TRAILING '_' FROM '_ _ Oracle _ _') || ']' AS TRIM_TRAILING,
        '[' || TRIM(BOTH '_' FROM '_ _ Oracle _ _') || ']' AS TRIM_BOTH
    FROM DUAL;
    
-- TRIM, LTRIM, RTRIM 비교하기
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
        '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM_1,
        '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM_1,
        '[' || LTRIM('<_Oracle_>', '_<') || ']' LTRIM_2,
        '[' || RTRIM('<_Oracle_>', '>_') || ']' RTRIM_2
    FROM DUAL;