--
-- ALTER명령어
-- 이미 생성된 객체를 변경할 때 사용
--
-- 새 열 추가, 삭제
-- 열의 자료형 변경
-- 열의 데이터 길이 변경
-- 등의 테이블 구조를 변경할 수 있다.

-- 연습용 테이블 생성
CREATE TABLE EMP_ALTER
    AS SELECT *
         FROM EMP;
   
-- 열 추가하기  
-- 이름이 HP이고 자료형이 VARCHAR2(20)인 열 추가하기
ALTER TABLE EMP_ALTER
  ADD HP VARCHAR2(20);
  
-- 열 이름 변경하기
-- HP열을 TEL로 변경하기
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;
    
-- 열 자료형 또는 길이 변경하기
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5);
    
-- 테이블의 특정 열 삭제하기
ALTER TABLE EMP_ALTER
    DROP COLUMN TEL;