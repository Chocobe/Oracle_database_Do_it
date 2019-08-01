--
-- 세션
--
-- 세션1 : scott계정을 SQL Developer로 접속
-- 세션2 : scott계정을 CMD로 접속

SELECT *
  FROM DEPT_TCL;
  
-- 세션1에서 50번 부서번호를 삭제
DELETE FROM DEPT_TCL
 WHERE DEPTNO = 50;

-- DEPT_TEMP 데이터 확인
SELECT *
  FROM DEPT_TCL;
-- 세션1에서만 DELETE내용이 확인 되고
-- 그 외 세션(세션2)에서는 변경 전 데이터 상태가 출력됨을 확인할 수 있다.

-- 데이터베이스에 변경사항 반영하기(COMMIT)
COMMIT;

-- 커밋 후, 데이터 상태 확인
SELECT *
  FROM DEPT_TCL;