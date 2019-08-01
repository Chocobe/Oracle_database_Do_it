--
-- RENAME 명령어
-- 테이블의 이름을 변경할 때 사용한다.
RENAME EMP_ALTER TO EMP_RENAME;

SELECT *
  FROM EMP_RENAME;
  
  
--
-- TRUNCATE 명령어
-- 테이블의 모든 데이터 삭제
--
-- DELETE문에 WHERE절을 명시하지 않은 것과 동일하지만,
-- 다른점은, TRUNCATE는 데이터 정의어 이기때문에 ROLLBACK이 되지 않는다.
-- (TRUNCATE는 복구 불가)

-- EMP_RENAME의 모든 데이터 삭제하기
TRUNCATE TABLE EMP_RENAME;


--
-- DROP 명령어
-- 데이터베이스 객체를 삭제한다
--
-- (FLASHBACK기능을 통해서만 복구할 수 있다.)
DROP TABLE EMP_RENAME;