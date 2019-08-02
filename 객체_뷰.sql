--
-- 뷰(VIEW)
-- 가상 테이블이며, 하나 이상의 테이블을 조회하는 SELECT문을 "저장한" 객체이다.
--
-- 편리성 : 뷰를 SELECT절의 FROM에 사용하면, 서브쿼리를 사용한 것과 동일한 결과를 얻을 수 있다.
--
-- 보안성 : 뷰를 사용하여, 노출하고 싶지 않은 열을 빼고 제공할 수 있다.


--
-- SCOTT계정에 VIEW생성 권한 부여하기 (SYS계정으로 수행)
GRANT CREATE VIEW TO SCOTT;


--
-- VIEW 생성하기
CREATE VIEW VW_EMP20
    AS SELECT EMPNO, ENAME, JOB, DEPTNO
         FROM EMP
        WHERE DEPTNO = 20;
        
SELECT *
  FROM VW_EMP20;
  
-- 부서번호가 30인 사원정보의 모든 열을 출력하는 VIEW 생성하기
CREATE VIEW VW_EMP30
    AS SELECT *
         FROM EMP
        WHERE DEPTNO = 30;
        
SELECT *
  FROM VW_EMP30;
  

--
-- VIEW 삭제하기
DROP VIEW VW_EMP20;

SELECT *
  FROM USER_VIEWS;
  
  
--
-- ROWNUM(의사열(PSEUDO COLUMN) 중 하나)
-- 의사열 이란?
-- 테이블에 실제로 존재하지는 않지만,
-- 특정 목적을 위해 테이블에 저장된 것 처럼 사용가능한 열을 말한다.
SELECT ROWNUM, E.*
  FROM EMP E
 ORDER BY E.SAL DESC;
 
 
--
-- 인라인뷰(서브쿼리 사용)
SELECT ROWNUM, E.*
  FROM (SELECT *
          FROM EMP
         ORDER BY SAL DESC) E;
         
-- 인라인뷰(WITH절 사용)
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
  FROM E;
  
-- 인라인뷰 를 사용한 TOP-N 추출하기 (서브쿼리 사용)
SELECT ROWNUM, E.*
  FROM (SELECT *
          FROM EMP
         ORDER BY SAL DESC) E
 WHERE ROWNUM <= 3;
 
-- 인라인뷰 를 사용한 TOP-N 추출하기 (WITH절 사용)
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
  FROM E
 WHERE ROWNUM <= 3;