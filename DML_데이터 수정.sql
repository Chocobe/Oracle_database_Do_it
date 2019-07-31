--
-- UPDATE문
-- 특정 테이블에 저장된 데이터를 수정한다.
--

--
-- 연습 준비과정 - DEPT_TEMP2 테이블 생성하기
CREATE  TABLE DEPT_TEMP2
    AS  SELECT  *
          FROM  DEPT;
          
          
-- DEPT_TEMP2 테이블의 LOC열의 값을 SEOUL로 변경하기
UPDATE  DEPT_TEMP2
   SET  LOC = 'SEOUL';
   
-- UPDATE문 실행 취소하기 - ROLLBACK 명령어
ROLLBACK;

-- DEPT_TEMP2 테이블에서 부서이름을 DATABASE, 지역을 SEOUL로
-- 변경하기
UPDATE  DEPT_TEMP2
   SET  DNAME = 'DATABASE',
        LOC = 'SEOUL'
 WHERE  DEPTNO = 40;
 
-- EMP_TEMP 테이블의 사원들 중에서 급여가 2500이하인 사원만
-- 추가수당을 50으로 수정하기
UPDATE  EMP_TEMP
   SET  COMM = 50
 WHERE  SAL <= 2500;


-- 
-- 서브쿼리를 이용하여 여러 열을 한번에 수정하기

-- DEPT_TEMP2 테이블에서 40번 부서의 이름과 지역을
-- DEPT 테이블의 40번 부서 데이터로 수정하기
UPDATE  DEPT_TEMP2
   SET  (DNAME, LOC) = (SELECT  DNAME, LOC
                          FROM  DEPT
                         WHERE  DEPTNO = 40)
 WHERE  DEPTNO = 40;

UPDATE  DEPT_TEMP2
   SET  DNAME = (SELECT  DNAME
                   FROM  DEPT
                  WHERE  DEPTNO = 40),
        LOC   = (SELECT  LOC
                   FROM  DEPT
                  WHERE  DEPTNO = 40)
 WHERE  DEPTNO = 40;
 
-- DEPT_TEMP2 테이블에서 부서명이 OPERATIONS 인
-- 부서의 지역을 SEOUL로 수정하기
UPDATE  DEPT_TEMP2
   SET  LOC  = 'SEOUL'
 WHERE  DNAME = (SELECT  DNAME
                   FROM  DEPT_TEMP2
                  WHERE  DNAME = 'OPERATIONS');
                  

--
-- UPDATE문 (또는 DELETE문) 의 조건문 WHERE절 검사하기
-- 테이블의 데이터를 직접 수정하는 것이기 때문에, 위험성이 높은 작업이다.
-- 때문에 UPDATE문(또는 DELETE문)을 실행하기 전에는
-- 반드시 SELECT문으로 해당 WHERE절을 검사해야 한다.
UPDATE  DEPT_TEMP2
   SET  DNAME = 'DATABASE',
        LOC   = 'SEOUL'
 WHERE  DEPTNO = 40;
 
-- 위의 UPDATE문을 실행하기 전,
-- WHERE  DEPTNO = 40; 을 SELECT문에서 검사하자
SELECT  *
  FROM  DEPT_TEMP2
 WHERE  DEPTNO = 40;