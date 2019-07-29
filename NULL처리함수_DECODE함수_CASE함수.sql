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