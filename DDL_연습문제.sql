--
-- DDL 연습문제
--

-- [1] 테이블 생성하기
CREATE TABLE EMP_HW(
    EMPNO       NUMBER(4),
    ENAME       VARCHAR2(10),
    JOB         VARCHAR(9),
    MGR         NUMBER(4),
    HIREDATE    DATE,
    SAL         NUMBER(7, 2),
    COMM        NUMBER(7, 2),
    DEPTNO      NUMBER(2)
);


-- [2] EMP_HW 테이블에 BIGO열 추가하기
-- BIGO : 가변문자열, 길이 20
ALTER TABLE EMP_HW
  ADD BIGO VARCHAR(20);
  

-- [3] EMP_HW 테이블의 BIGO 열 크기를 30으로 변경하기
ALTER TABLE EMP_HW
MODIFY BIGO VARCHAR(30);


-- [4] EMP_HW 테이블의 BIGO열의 이름을 REMARK로 변경하기
ALTER TABLE EMP_HW
RENAME COLUMN BIGO TO REMARK;


-- [5] EMP_HW 테이블에 EMP 테이블의 데이터를 모두 저장하기
-- (REMARK는 NULL로 저장)
INSERT INTO EMP_HW(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, REMARK)
            SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
              FROM EMP;
         

-- [6] EMP_HW 테이블 삭제하기
DROP TABLE EMP_HW;