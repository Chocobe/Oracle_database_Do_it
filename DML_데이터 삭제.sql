--
-- DELETE문
-- 특정 테이블에 저장된 데이터를 삭제한다
--

-- 연습용 테이블 생성하기
CREATE  TABLE EMP_TEMP2
    AS  SELECT  *
          FROM  EMP;
          
-- EMP_TEMP2 테이블에서 직책이 MANAGER인 사원의 데이터 삭제하기
DELETE  FROM EMP_TEMP2
 WHERE  JOB = 'MANAGER';
 
-- EMP_TEMP2 테이블에서 
-- 부서번호가 30번이고, 급여등급이 3등급인 사원의 정보 삭제하기
DELETE  FROM EMP_TEMP2
 WHERE  EMPNO IN (SELECT  E.EMPNO
                    FROM  EMP_TEMP2 E, SALGRADE S
                   WHERE  E.SAL BETWEEN S.LOSAL AND S.HISAL
                     AND  S.GRADE  = 3
                     AND  E.DEPTNO = 30);
                     
-- EMP_TEMP 테이블에서 급여가 3000이상인 사원을 삭제하기
DELETE  FROM EMP_TEMP
 WHERE  SAL >= 3000;
 
-- EMP_TEMP2 테이블의 모든 데이터 삭제하기
DELETE  FROM EMP_TEMP2;