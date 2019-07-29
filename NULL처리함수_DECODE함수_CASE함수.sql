--
-- NULL 처리 함수
--


-- NVL 함수 사용하기
-- EMP 테이블에서 COMM값이 NULL인 경우는 0으로 바꾸어 출력하기
SELECT EMPNO, ENAME, SAL, COMM, NVL(COMM, 0) AS NVL_FUNC
    FROM EMP;
    
    
-- NVL2 함수 사용하기
-- EMP 테이블에서 COMM값이 NULL일 경우 X, 아닐 경우 O,
-- 연봉을 출력하기
SELECT EMPNO, ENAME, 
        NVL2(COMM, 'O', 'X'), 
        NVL2(COMM, SAL * 12 + COMM, SAL * 12) AS ANNSAL
    FROM EMP;
    
    
--
-- DECODE함수
-- 검사할 대상에 대해서, 조건의 일치/불일치에 대한 결과를 다르게 출력하는 함수

-- EMP 테이블에서 직책이 MANAGER인 사람은 급여 10% 인상,
-- SALESMAN은 5%인상,
-- ANALYST는 그대로
-- 나머지는 3%인상한 급여를 DECODE함수로 출력하기
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB,
        'MANAGER', SAL * 1.1,
        'SALESMAN', SAL * 1.05,
        'ANALYST', SAL,
        SAL * 1.03
        ) AS UPSAL
    FROM EMP;
    

-- EMP 테이블에서 직책이 MANAGER인 사람은 급여 10% 인상,
-- SALESMAN은 5%인상,
-- ANALYST는 그대로
-- 나머지는 3%인상한 급여를 CASE로 출력하기
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL * 1.1
        WHEN 'SALESMAN' THEN SAL * 1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL * 1.03
    END AS UPSAL
    FROM EMP;
    
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL * 1.1
        WHEN 'SALESMAN' THEN SAL * 1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL * 1.03
    END AS UPSAL
    FROM EMP;
    
-- EMP 테이블에서 COMM이 NULL일 경우 -> '해당사항 없음'
-- 0일 경우 -> '수당없음'
-- 0보다 클 경우 -> '수당 : COMM값'
-- 으로 출력하기
SELECT EMPNO, ENAME, JOB COMM,
    CASE
        WHEN COMM IS NULL THEN '해당사항 없음'
        WHEN COMM = 0 THEN '수당 없음'
        WHEN COMM > 0 THEN '수당 : ' || COMM
    END AS "수 당 결 과"
    FROM EMP;
    
    
-- 연습문제
--[1] EMP 테이블에서
-- EMPNO 열에는 사원이름이 다섯글자 이상, 여섯글자 미만인 사원의 정보를 출력하고,
-- MASKING_EMPNO 열에는 사원번호 앞 두자리만 출력하고 나머지 뒷자리는 *로 출력하고,
-- MASKING_ENAME 열에는 사원 이름의 첫 글자만 보여주고 나머지는 글자수 만큼 *로 출력하기
SELECT EMPNO,
        RPAD(SUBSTR(EMPNO, 0, 2), 5, '*') AS MASKING_EMPNO,
        ENAME,
        RPAD(SUBSTR(ENAME, 0, 1), 5, '*') AS MASKING__ENAME
    FROM EMP
    WHERE LENGTH(ENAME) = 5;
    

-- [2] EMP 테이블에서 사원들의 월 평균 근무일 수는 21.5일이다.
-- 하루 근무 시간을 8시간으로 보았을 때,
-- 사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 출력하기
-- (하루급여 : 소수점 3자리에서 버림, 시급 : 소수점 2번째 자리 반올림)
SELECT EMPNO, ENAME, SAL,
        TRUNC(SAL / 21.5, 2) AS DAY_PAY,
        ROUND(SAL / 21.5 / 8, 1) TIME_PAY
    FROM EMP;
    
    
-- [3] EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월 지난 후
-- 첫 월요일에 정직원이 된다. 정직원이 되는 날짜(R_JOB)를
-- YYYY-MM-DD 형식으로 출력하기
-- (추가수당(COMM)이 없는 사원의 추가 수당은 'N/A'로 출력)
SELECT EMPNO, ENAME, HIREDATE,
        TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS R_JOB,
        NVL(TO_CHAR(COMM), 'N/A') AS COMM
    FROM EMP;
    

-- [4] EMP 테이블에서 직속상관 사원번호(MGR)을 대상으로 CHG_MGR에 다음을 출력하기
-- MGR이 없을 경우 : 0000 출력
-- MGR의 앞 두자리가 75인 경우 : 5555
-- MGR의 앞 두자리가 76인 경우 : 6666
-- MGR의 앞 두자리가 77인 경우 : 7777
-- MGR의 앞 두자리가 78인 경우 : 8888
-- 그 외 : 원래의 MGR을 그대로 출력
SELECT EMPNO, ENAME, MGR,
        CASE
            WHEN MGR IS NULL THEN 0000
            WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '75' THEN 5555
            WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '76' THEN 6666
            WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '77' THEN 7777
            WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '78' THEN 8888
            ELSE MGR
        END AS CHG_MGR
    FROM EMP;