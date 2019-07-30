--
-- 다중행 함수 연습문제

-- [1] EMP 테이블을 이용하여 부서번호, 평균급여, 최고급여, 최저급여, 사원수를 출력하기
-- (평균급여는 소수점을 제외하고 각 부서번호별로 출력하기)
SELECT DEPTNO,
        TRUNC(AVG(SAL)) AS AVG_SAL,
        MAX(SAL) AS MAX_SAL,
        MIN(SAL) AS MIN_SAL,
        COUNT(*) AS CNT
    FROM EMP
    GROUP BY DEPTNO;
    
    
-- [2] 같은 직책(JOB)에 종사하는 사원이 3명 이상인 직책과 인원수 출력하기
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB
    HAVING COUNT(*) >= 3;
    
    
-- [3] 사원들의 입사연도를 기준으로 부서별로 몇 명이 입사했는지 출력하기
SELECT SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM-DD'), 1, 4) AS HIRE_YEAR,
        DEPTNO,
        COUNT(*)
    FROM EMP
    GROUP BY SUBSTR(TO_CHAR(HIREDATE, 'YYYY-MM-DD'), 1, 4), 
            DEPTNO;
            
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
        DEPTNO,
        COUNT(*)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;
    
    
-- [4] 추가수당(COMM)을 받는 사원수와 받지않는 사원수를 출력하기
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
        COUNT(*) AS CNT
    FROM EMP
    GROUP BY NVL2(COMM, 'O', 'X');
    
    
-- [5] 각 부서의 입사연도별 사원수, 최고급여, 급여의 합, 평균급여를
-- 출력하고, 각 부서별 소계와 총계를 출력하기
SELECT DEPTNO,
        TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
        COUNT(*) AS CNT,
        MAX(SAL) AS MAX_SAL,
        SUM(SAL) AS SUM_SAL,
        AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));
-- 각 그룹별 결과를 출력하기 위한 ROLLUP함수