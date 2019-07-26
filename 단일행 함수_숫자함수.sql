--
-- 오라클 함수 - 숫자 함수

-- ROUND함수
-- 반올림 함수

-- ROUND 함수를 사용하여 반올림된 숫자 출력하기
SELECT ROUND(1234.5678) AS ROUND,
        ROUND(1234.5678, 0) AS ROUND_0,
        ROUND(1234.5678, 1) AS ROUND_1,
        ROUND(1234.5678, 2) AS ROUND_2,
        ROUND(1234.5678, -1) AS ROUND_MINUS_1,
        ROUND(1234.5678, -2) AS ROUND_MINUS_2
    FROM DUAL;
    
    
--
-- TRUNC함수
-- 버림 함수
--

-- TRUNC 함수를 사용하여 버림된 숫자 출력하기
SELECT TRUNC(1234.5678) AS TRUNC,
        TRUNC(1234.5678, 0) AS TRUNC_0,
        TRUNC(1234.5678, 1) AS TRUNC_1,
        TRUNC(1234.5678, 2) AS TRUNC_2,
        TRUNC(1234.5678, -1) AS TRUNC_MINUS_1,
        TRUNC(1234.5678, -2) AS TRUNC_MINUS_2
    FROM DUAL;
    
-- TRUNC 함수 예제)
SELECT TRUNC(1539.125023, 4) AS TRUNC_EX1,
        TRUNC(4586.89453, 2) AS TRUNC_EX2,
        TRUNC(2560.48522, -1) AS TRUNC_EX3
    FROM DUAL;
    
    
--
-- CEIL, FLOOR함수
-- 지정한 숫자와 가장 가까운 정수를 찾는 함수
--
-- CEIL     : 지정된 숫자와 가장 가까운 큰 정수
-- FLOOR    : 지정된 숫자와 가장 가까운 작은 정수
--

-- CEIL, FLOOR함수 예제)
SELECT CEIL(3.14),
        FLOOR(3.14),
        CEIL(-3.14),
        FLOOR(-3.14)
    FROM DUAL;
    

--
-- MOD함수
-- 나머지 함수
--

-- MOD함수 예제
SELECT MOD(15, 6),
        MOD(10, 2),
        MOD(11, 2)
    FROM DUAL;