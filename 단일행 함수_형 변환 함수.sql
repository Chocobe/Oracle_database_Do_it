--
-- 형 변환 함수
--

-- 자동 형변환(암시적 형변환) 예)
SELECT EMPNO, ENAME, EMPNO + '500'
    FROM EMP;
    
SELECT 'ABCD' + EMPNO, EMPNO    -- 오류('ABCD'는 숫자형으로 암시적 변환을 안시켜준다)
    FROM EMP
    WHERE ENAME = 'SCOTT';


--
-- TO_CHAR함수
-- 날짜, 숫자 데이터를 문자형으로 형 변환
--

-- 현재 날짜와 시간을 문자열로 형변환 하기
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24-MI-SS')
    FROM DUAL;
    

-- 월과 요일을 다양한 형식의 문자열로 출력하기 (사용자의 언어환경에 맞게)
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'MM') AS MM,
        TO_CHAR(SYSDATE, 'MON') AS MON,
        TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
        TO_CHAR(SYSDATE, 'DD') AS DD,
        TO_CHAR(SYSDATE, 'DY') AS DY,
        TO_CHAR(SYSDATE, 'DAY') AS DAY
    FROM DUAL;
    

-- 여러 언어로 날짜(월) 출력하기
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'MM') AS MM,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS KOREAN,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS ENGLISH,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS JAPANESE,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS KOREAN,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS ENGLISH,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS JAPANESE
    FROM DUAL;
    
    
-- 여러 언어로 날짜(요일) 출력하기
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'MM') AS MM,
        TO_CHAR(SYSDATE, 'DD') AS DD,
        TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN') AS KOREAN,
        TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS ENGLISH,
        TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS JAPANESE,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN') AS KOREAN,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS ENGLISH,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS JAPANESE
    FROM DUAL;
    
    
-- 시간 형식 지정하여 출력하기
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'HH24:MI:SS') AS "HH24:MI:SS",
        TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS "HH12:MI:SS AM",
        TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS "HH:MI:SS P.M."
    FROM DUAL;
    

--
-- TO_NUMBER함수   
-- 숫자 데이터를 문자형식으로 변환하기
--

-- EMP 테이블에서 여러가지 숫자 형식을 사용하여 급여 출력하기
SELECT SAL,
        TO_CHAR(SAL, '$999,999') AS SAL_$,
        TO_CHAR(SAL, 'L999,999') AS SAL_L,
        TO_CHAR(SAL, '999,999.00') AS SAL_1,
        TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
        TO_CHAR(SAL, '000999999.99') AS SAL_3,
        TO_CHAR(SAL, '999,999,00') AS SAL_4
    FROM EMP;
    
    
-- 문자 데이터와 숫자 데이터의 암시적 형변환 예제)
SELECT 1300 - '1500',
        '1300' + 1500
    FROM DUAL;
    
-- 문자 데이터와 문자 데이터의 암시적 형변환 예제)
SELECT '1,300' - '1,500'    -- ,(쉼표)때문에 암시적 형변환이 안된다
    FROM DUAL;
    
-- 가공된 문자 데이터를 숫자형으로 명시적 형변환 시키기 예제)
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
    FROM DUAL;
    
    
--
-- TO_DATE함수
-- 문자열을 날짜 데이터로 형변환 하는 함수
--

-- TO_DATE를 이용하여 문자열을 날짜형으로 변환하기
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE_1,
    TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE_2
    FROM DUAL;
    

-- EMP 테이블에서 1981년 6월 1일 이후에 입사한 사원정보 출력하기
SELECT *
    FROM EMP
    WHERE HIREDATE > TO_DATE('1981 6 1', 'YYYY-MM-DD');