--
-- DDL(Data Definition Language) : 데이터 정의어
-- 데이터베이스의 데이터를 관리하기 위한 여러 객체를 생성, 변경, 삭제 기능
--
-- DDL을 사용하면, 실행한 시점에 COMMIT효과가 적용된다.
-- 즉, DDL은 ROLLBACK이 불가능 하다는 뜻이다. (실행 즉시 DB에 즉시 반영됨)

--
-- CREATE문
-- Oracle Database 객체를 생성하는 명령어

-- 각 열의 자료형을 정의하여 새 테이블 생성하기
CREATE TABLE EMP_DDL(
    EMPNO       NUMBER(4),
    ENAME       VARCHAR2(10),
    JOB         VARCHAR2(9),
    MGR         NUMBER(4),
    HIREDATE    DATE,
    SAL         NUMBER(7, 2),
    COMM        NUMBER(7, 2),
    DEPTNO      NUMBER(2)
);

-- 기존 테이블의 열 구조와 데이터를 복사하여 새 테이블 생성하기
CREATE TABLE DEPT_DDL
    AS SELECT *
         FROM DEPT;
         
-- 기존 테이블의 열 구조와 일부 데이터만 복사하여 새 테이블 생성하기
CREATE TABLE EMP_DDL_30
    AS SELECT *
         FROM EMP
        WHERE DEPTNO = 30;
        
SELECT *
  FROM EMP_DDL_30;
  
-- 기존 테이블의 열 구조만 복사하여 새 테이블 생성하기
CREATE TABLE EMPDEPT_DDL
    AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
              E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
         FROM EMP E, DEPT D
        WHERE 1 <> 1;
        
SELECT *
  FROM EMPDEPT_DDL;