--
-- GROUP BY 절
-- 여러 데이터들을 하나의 의미있는 결과로 묶어서 출력하는 방법
-- 데이터의 "그룹화"

-- EMP 테이블에서 부서별 평균 급여를 GROUP BY로 출력하기
SELECT DEPTNO AS DEPT, AVG(SAL) AS AVG
    FROM EMP
    GROUP BY DEPTNO;
    
-- EMP 테이블에서 부서번호 및 직책별 평균급여 정렬하여 출력하기
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
    
-- EMP 테이블에서 GROUP BY절을 사용하여 부서번호별 평균 추가수당을 출력하기
SELECT DEPTNO, AVG(COMM)
    FROM EMP
    GROUP BY DEPTNO;
    
-- GROUP BY절을 사용한 SELECT절에는 그룹화된 열 이외의 일반 열을 사용할 수 없다.
SELECT ENAME, DEPTNO, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO;