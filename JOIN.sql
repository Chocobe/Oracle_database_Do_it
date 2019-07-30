--
-- JOIN
-- 두개 이상의 테이블의 데이터를 가로로 연결하는 기능
--
-- 집합연산자는 세로로 연결하지만,
-- JOIN은 가로로 연결된다는 점이 차이점이다.

-- EMP 테이블의 사원정보와 DEPT테이블의 부서정보를 모두 출력하기
SELECT *
    FROM EMP, DEPT;
-- 위의 문장은 EMP테이블과 DETP테이블의 카텐션 프로덕트(교차곱)의 결과이다.

-- EMP 테이블의 사원정보와 DEPT테이블의 부서정보를 연관지어 출력하기
SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO;
    

-- 테이블 이름을 별칭으로 사용하여 EMP 테이블과 DEPT테이블의 정보를 연관지어 출력하기
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    

-- 모든 열(데이터)를 출력할지라도
-- 실무에서는 '*'보다는 직접 모든 열을 명시하여 사용한다.
-- ('*'사용시 열의 순서, 변화감지, 프로그램 수정 등이 어렵기 때문이다)
SELECT E.EMPNO, E.ENAME,
        E.JOB, E.MGR,
        E.HIREDATE, E.SAL,
        E.COMM, E.DEPTNO,
        D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    
    
-- EMP 테이블의 별칭을 E, DEPT 테이블의 별칭은 D로 하여,
-- EMP 테이블의 사원번호, DEPT 테이블의 부서이름 을 출력하기
SELECT E.EMPNO, D.DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;