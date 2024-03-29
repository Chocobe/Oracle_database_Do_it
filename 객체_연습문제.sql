--
-- 객체 연습문제

-- [1-1] EMP 테이블과 같은 구조의 데이터를 저장하는
-- EMPIDX 테이블 만들기
CREATE TABLE EMPIDX
    AS SELECT *
         FROM EMP;

-- [1-2] EMPIDX 테이블의 EMPNO열에
-- IDX_EMPIDX_EMPNO 인덱스를 생성하기
CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX(EMPNO);
    
-- [1-3] IDX_EMPIDX_EMPNO 를 데이터 사전 뷰에서 조회하기
SELECT *
  FROM USER_INDEXES;
  

-- [2] EMPIDX 테이블의 데이터 중 급여(SAL)이 1500 초과인 사원들만
-- 출력하는 EMPIDX_OVER15K 뷰를 생성하기
-- (EMPIDX_OVER15K 뷰는 사원번호, 사원이름, 직책, 부서번호, 급여, 추가수당
-- 열을 가지며, 추가 수당 열의 경우에 추가수당이 존재하면 O, 없으면 X로 출력하기)
CREATE OR REPLACE VIEW EMPIDX_OVER15K
    AS SELECT E.EMPNO,  E.ENAME, E.JOB, 
              E.DEPTNO, E.SAL,   NVL2(E.COMM, 'O', 'X') AS COMM
         FROM EMPIDX E
        WHERE SAL > 1500;
        
SELECT *
  FROM EMPIDX_OVER15K;
  

-- [3-1] DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블 생성하기
CREATE TABLE DEPTSEQ
    AS SELECT *
       FROM DEPT;
       
-- [3-2] 생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스 생성하기
CREATE SEQUENCE DEPTSEQ_SEQUENCE
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99
    MINVALUE 1
    NOCYCLE
    NOCACHE;
    
-- [3-3] 생성한 DEPTSEQ_SEQUENCE 시퀀스를 이용하여 데이터 입력하기
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC)
VALUES(DEPTSEQ_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC)
VALUES(DEPTSEQ_SEQUENCE.NEXTVAL, 'WEB', 'BUSAN');

INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC)
VALUES(DEPTSEQ_SEQUENCE.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT *
  FROM DEPTSEQ;