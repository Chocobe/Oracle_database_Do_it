--
-- FOREIGN KEY
-- 외래키, 외부키
-- 서로 다른 테이블 간의 관계를 정의하는데 사용하는 제약조건
-- 다른 테이블의 PRIMARY KEY 열을, 다른 테이블에서 참조하는 방법

-- EMP 테이블과 DEPT 테이블의 제약조건 뷰 조회하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME IN ('EMP', 'DEPT');
 
 -- FOREIGN KEY가 참조하는 열에, 존재하지 않는 값 입력 테스트 하기
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
         VALUES(9999, '홍길동', 'CLERK', '7788', TO_DATE('2017/04/30', 'YYYY-MM-DD'),
                1200, NULL, 50);
                
-- FOREIGN KEY 에서
-- 부모 테이블 : 참조의 대상이 되는 테이블
-- 자식 테이블 : 참조하는 테이블


-- 연습용 테이블 생성하기 : 부모 테이블 DEPT_FK
CREATE TABLE DEPT_FK(
    DEPTNO      NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME       VARCHAR2(14),
    LOC         VARCHAR2(13)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'DEPT_FK';
 
-- 연습용 테이블 생성하기 : 자식 테이블 EMP_FK
CREATE TABLE EMP_FK(
    EMPNO       NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME       VARCHAR(10),
    JOB         VARCHAR(9),
    MGR         NUMBER(4),
    HIREDATE    DATE,
    SAL         NUMBER(7, 2),
    COMM        NUMBER(7, 2),
    DEPTNO      NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'EMP_FK';
 

-- EMP_FK 테이블에 데이터 입력하기 (DEPT 테이블에 데이터가 없는 경우)
INSERT INTO EMP_FK(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(9999, 'TEST_ENAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY-MM-DD'),
                   3000, NULL, 10);
-- 데이터 입력 불가
-- 외래키가 참조하는 DEPT 테이블에 아무런 데이터가 없기 때문에 입력불가
-- (DEPT 테이블의 DEPTNO에 10이라는 값이 있다면 입력 할 수 있게된다)

INSERT INTO DEPT_FK(DEPTNO, DNAME, LOC)
             VALUES(10, 'TEST_DNAME', 'TEST_LOC');
             
-- 입력한 데이터 조회
SELECT *
  FROM DEPT_FK;
  
-- 다시 EMP_FK에서 DEPTNO = 10 인 데이터 입력해 보기
INSERT INTO EMP_FK(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(9999, 'TEST_ENAME', 'TEST_JOB', NULL,
                   TO_DATE('2001/01/01', 'YYYY-MM-DD'),
                   3000, NULL, 10);
                   

-- 부모 테이블을 참조하는 자식 테이블이 있을 때, 부모 테이블의 값 제거하기
DELETE FROM DEPT_FK
 WHERE DEPTNO = 10;
-- 삭제 하려는 열을 참조하는 자식 테이블이 있을 경우, 삭제할 수 없다.
-- 자식 테이블에서 외래키 지정 시, 옵션 선택으로 해결할 수 있다.

-- 부모 테이블의 참조열이 삭제 될 때, 자식 테이블의 해당 열도 같이 삭제하기
-- ON DELETE CASCADE 옵션
--
-- EMP_FK의 DEPTNO 의 FOREIGN KEY 제약조건 수정하기
-- 1. 변경할 제약조건을 삭제한다.
-- 2. 새로운 제약조건을 지정한다.
ALTER TABLE EMP_FK
DROP CONSTRAINT EMPFK_DEPTNO_FK;

ALTER TABLE EMP_FK
MODIFY(DEPTNO CONSTRAINT CASCADE_TEST_CONSTRAINT REFERENCES DEPT(DEPTNO) ON DELETE CASCADE);

-- 수정한 제약조건을 제약조건 뷰에서 조회하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'EMP_FK';
 
-- 외래키 옵션인 ON DELETE CASCADE 테스트 하기 (DEPT 테이블의 DEPTNO = 10인 열 삭제)
DELETE FROM DEPT_FK
 WHERE DEPTNO = 10;
 
INSERT INTO DEPT_FK(DEPTNO, DNAME, LOC)
             VALUES(10, 'TEST_DNAME', 'TEST_LOC');
             
             
-- 부모 테이블의 참조열이 삭제 될때, 자식 테이블의 해당 외래키값을 NULL로 수정하게 만들기
-- ON DELETE SET NULL
--
-- 자식 테이블(EMP_FK)의 외래키 제약조건 수정하기
-- 1. 해당 제약조건 삭제
-- 2. ON DELETE SET NULL 옵션의 외래키 제약조건 설정
ALTER TABLE EMP_FK
DROP CONSTRAINT EMPFK_DEPTNO_FK;

ALTER TABLE EMP_FK
MODIFY(DEPTNO CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO) ON DELETE SET NULL);

INSERT INTO DEPT_FK(DEPTNO, DNAME, LOC)
          VALUES(10, 'TEST_DNAME', 'TEST_LOC');
          
INSERT INTO EMP_FK(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(9999, 'TEST_ENAME', 'TEST_JOB', NULL,
                   TO_DATE('2001/01/01', 'YYYY-MM-DD'),
                   3000, NULL, 10);
                   
DELETE FROM DEPT_FK
 WHERE DEPTNO = 10;
 
SELECT *
  FROM EMP_FK;
-- 부모테이블(DEPT_FK)의 DEPTNO = 10번 열을 삭제 시,
-- 자식 테이블(EMP_FK)의 DEPTNO = 10번 열의 값이 NULL로 수정되었다.