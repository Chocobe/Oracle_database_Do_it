--
-- DEFAULT
-- 열의 기본값을 설정하는 명령어
--
-- DEFAULT가 설정된 열에,
-- 입력 데이터가 없을 시, 설정된 기본값으로 저장된다.

-- 테이블 생성 시, DEFAULT 설정하기
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID        VARCHAR2(20) CONSTRAINT TBLDF_LOGINID_PK PRIMARY KEY,
    LOGIN_PWD       VARCHAR2(20) DEFAULT '1234',
    TEL             VARCHAR2(20)
);

-- 명시적으로 NULL 입력
INSERT INTO TABLE_DEFAULT(LOGIN_ID, LOGIN_PWD, TEL)
                   VALUES('TEST_ID1', NULL, '010-1234-1234');
                   
-- 암시적으로 NULL 입력
INSERT INTO TABLE_DEFAULT(LOGIN_ID, TEL)
                   VALUES('TEST_ID2', '010-1234-1234');
                   
-- 저장된 데이터 조회하기
SELECT *
  FROM TABLE_DEFAULT;
-- 명시적으로 NULL 입력 시, DEFAULT 설정이 아닌, NULL값이 입력된다.
-- 암시적으로 NULL 입력 시, DEFAULT 설정값이 입력된다.