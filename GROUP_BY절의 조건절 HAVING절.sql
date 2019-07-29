--
-- GROUP BY절의 조건절 HAVING절
-- SELECT절에서 GROUP BY절을 사용한 경우만 HAVING절을 쓸 수 있다.
-- HAVING절은 GROUP BY절의 결과값의 범위를 제한하는 기능을 한다.

-- EMP 테이블에서 각 부서의 직책별 평균 급여를 구하되,
-- 평균급여가 2000이상인 그룹만 출력하기
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000;
    
SELECT DEPTNO AS DEP, JOB AS JJ, AVG(SAL) AS AAA
    FROM EMP
    GROUP BY DEPTNO, JOB;
    
-- 에러 문장
-- GROUP BY절의 조건은 HAVING을 써야 한다.
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    WHERE AVG(SAL) >= 2000
    GROUP BY DEPTNO, JOB;
    
    
-- GROUP BY절 또는 HAVING절 이후에는 WHERE절을 사용할 수 없다.
-- GROUP BY, HAVING 이전에는 WHERE절 사용 가능
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000;
    
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    WHERE SAL <= 3000
    GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000;
    
-- HAVING절을 사용하여 EMP 테이블에서 부서별 직책의 평균급여가 500이상인
-- 사원들의 부서번호, 직책, 부서별 직책의 평균급여 를 출력하기
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 500
    ORDER BY DEPTNO, JOB; 