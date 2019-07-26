--
-- 날짜 함수

--
-- SYSDATE함수
-- OS(운영체제)의 현재 날짜, 시간을 출력하는 함수
--

-- SYSDATE함수 예제)
SELECT SYSDATE AS NOW,
        SYSDATE - 1 AS YESTERDAY,
        SYSDATE + 1 AS TOMORROW
    FROM DUAL;
    

--
-- ADD_MONTHS함수
-- 특정 날짜에 지정한 개월수 이후의 날짜를 출력하는 함수
--
-- (그냥 정수를 더할 경우는 날짜를 더한 것이었고,
-- (ADD_MONTHS함수를 사용할 경우는 월을 더하는 것이다)
--

-- ADD_MONTHS함수 예제)
SELECT SYSDATE AS NOW,
        ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;
    
    
-- EMP 테이블에서 입사 10주년이 되는 사원들 데이터 출력하기
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;
    
    
-- EMP 테이블에서 입사한지 33년이 되지 않은 사원의 정보를 출력하기
SELECT EMPNO, ENAME, HIREDATE, SYSDATE
    FROM EMP
    WHERE ADD_MONTHS(HIREDATE, 12 * 33) > SYSDATE;
    
    
-- 현재 날짜와 6개월 후 날짜를 출력하기
SELECT SYSDATE AS NOW,
        ADD_MONTHS(SYSDATE, 6) AS AFTER6MONTHS
    FROM DUAL;
    
    
--
-- MONTHS_BETWEEN함수
-- 두 날짜 데이터의 개월수를 구하는 함수
--

-- HIREDATE와 SYSDATE 사이의 개월 수를 MONTHS_BETWEEN함수로 출력하기
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
        MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS_1,
        MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS_2,
        TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS_3
    FROM EMP;
    
SELECT SYSDATE AS NOW, 
        ADD_MONTHS(SYSDATE, 10) AS AFTER,
        MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 10), SYSDATE) AS RESULT
    FROM DUAL;
    
    
--
-- NEXT_DAY, LAST_DAY
--
-- NEXT_DAY : 돌아오는 해당요일의 날짜를 구하는 함수
-- LAST_DAY : 해당 날짜가 포함된 달의 마지막 날을 구하는 함수
--

-- NEXT_DAY, LAST_DAY 예제
SELECT SYSDATE,
        NEXT_DAY(SYSDATE, '월요일'),
        LAST_DAY(SYSDATE)
    FROM DUAL;
    
    
--
-- 날짜 데이터의 ROUND, TRUNC함수
--
-- ROUND : 날짜 데이터의 반올림 함수
-- TRUNC : 날짜 데이터의 버림 함수
--

-- 날짜 데이터의 ROUND함수 예제)
SELECT SYSDATE,
        ROUND(SYSDATE, 'CC') AS FORMAT_CC,
        ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
        ROUND(SYSDATE, 'Q') AS FORMAT_Q,
        ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
        ROUND(SYSDATE, 'HH') AS FORMAT_HH
    FROM DUAL;
    

-- 날짜 데이터의 TRUNC함수 예제)
SELECT SYSDATE,
        TRUNC(SYSDATE, 'CC') AS FORMAT_CC,
        TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
        TRUNC(SYSDATE, 'Q') AS FORMAT_Q,
        TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD,
        TRUNC(SYSDATE, 'HH') AS FORMAT_HH
    FROM DUAL;