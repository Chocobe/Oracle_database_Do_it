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