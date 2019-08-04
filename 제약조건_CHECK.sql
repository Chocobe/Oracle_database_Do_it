--
-- CHECK 제약조건
-- 지정한 열에 저장할 수 있는 데이터의 범위 또는 패턴 을 정의한다.

-- 테이블 생성시, CHECK제약조건 설정하여 생성하기
-- (비밀번호의 길이가 3자리를 넘도록 할 것)
CREATE TABLE TABLE_CHECK(
    LOGIN_ID        VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD       VARCHAR2(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK(LENGTH(LOGIN_PWD) > 3),
    TEL             VARCHAR2(20)
);

-- 생성한 테이블의 제약조건 뷰 조회하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'TABLE_CHECK';
 
-- 비밀번호가 3자리인 데이터 입력해 보기
INSERT INTO TABLE_CHECK(LOGIN_ID, LOGIN_PWD, TEL)
                 VALUES('TEST_ID', '123', '010-1234-1234');
-- CHECK 제약조건에 의해, 데이터 입력에 오류가 발생한다.

-- 비밀번호가 4자리인 데이터 입력하기
INSERT INTO TABLE_CHECK(LOGIN_ID, LOGIN_PWD, TEL)
                 VALUES('TEST_ID', '1234', '010-1234-1234');
                 
-- 입력한 데이터 조회하기
SELECT *
  FROM TABLE_CHECK;