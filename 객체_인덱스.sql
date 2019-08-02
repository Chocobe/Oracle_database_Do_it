--
-- 인덱스
-- 데이터 검색 성능의 향상을 위해 테이블 열에 사용하는 객체이다.
--
-- TABLE FULL SCAN 방식 : 테이블 전체를 검색하여 원하는 정보를 찾는 방식
-- INDEX SCAN 방식 : 인덱스를 통해 데이터를 찾는 방식
--
-- 인덱스 정보 조회하기
-- 인덱스도 소유자가 있기 때문에, 인덱스 정보를 조회하려면 해당 계정으로 접속해야 한다.
-- 인덱스 정보가 저장된 데이터 사전 : USER_INDEXES 또는 USER_IND_COLUMNS

-- SCOTT계정이 소유한 인덱스 정보 조회
SELECT *
  FROM USER_INDEXES;
  
SELECT *
  FROM USER_IND_COLUMNS;  
-- 인덱스는 사용자가 생성할 수 있고, 기본키나 고유키는 자동으로 생성된다.
--


--
-- 인덱스 생성
-- CREATE문을 이용하여 인덱스를 생성한다
CREATE INDEX IDX_EMP_SAL
    ON EMP(SAL ASC);
    
    
--
-- 인덱스 삭제
-- DROP명령어를 사용하여 인덱스를 삭제한다.
DROP INDEX IDX_EMP_SAL;