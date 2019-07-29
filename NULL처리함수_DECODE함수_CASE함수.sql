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
-- 나머지는 3%인상한 급여를 출력하기
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB,
        'MANAGER', SAL * 1.1,
        'SALESMAN', SAL * 1.05,
        'ANALYST', SAL,
        SAL * 1.03
        ) AS UPSAL
    FROM EMP;
    

