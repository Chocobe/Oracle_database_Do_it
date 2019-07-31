-- 
-- DML 연습 준비
-- 연습용 임시 테이블 생성하기
CREATE  TABLE DEPT_TEMP
    AS  SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;


--
-- INSERT문
-- 특정 테이블에 데이터를 입력하는데 사용한다.

-- DEPT_TEMP 테이블에 부서번호 50, 부서이름 DATABASE, 지역 SEOUL
-- 을 입력하기
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
               VALUES(50, 'DATABASE', 'SEOUL');


-- INSERT문에 열 지정 없이 데이터 추가하기
INSERT INTO DEPT_TEMP
               VALUES(60, 'NETWORK', 'BUSAN');
               
               
-- INSERT문으로 데이터 입력시, NULL입력하기
-- NULL의 명시적 입력
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
               VALUES(70    , 'WEB', NULL);

-- 공백 문자열로 NULL 입력하기
-- 입력할 열의 자료형이 문자형, 날짜형 일 경우,
-- 빈 문자 '' 를 입력하면 NULL이 입력된다.
INSERT INTO DEPT_TEMP(DEPTNO, DNAME,   LOC)
               VALUES(80    , 'MOBILE', '');

-- NULL의 암시적 입력
-- NULL을 입력하고자 하는 열을 아예 지정하지 않을 경우, NULL이 입력된다.
INSERT INTO DEPT_TEMP(DEPTNO, LOC)
               VALUES(90    , 'INCHEON');
               
SELECT  *
  FROM  DEPT_TEMP;
  

  
--
-- 연습용 EMP 테이블의 임시 복사본 만들기
-- WHERE 1 <> 1 : EMP테이블의 열 구조만 복사
CREATE  TABLE EMP_TEMP
    AS  SELECT * FROM EMP
 WHERE  1 <> 1;

--
-- INSERT문으로 날짜형 입력하기

-- 날짜 사이에 / 입력
INSERT INTO EMP_TEMP(EMPNO, ENAME,   JOB,         MGR,  HIREDATE,     SAL,  COMM, DEPTNO)
              VALUES(9999,  '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
              
-- 날짜 사이에 - 입력
INSERT INTO EMP_TEMP(EMPNO, ENAME,   JOB,       MGR,  HIREDATE,     SAL, COMM,  DEPTNO)
              VALUES(1111,  '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);
              
-- 위의 날짜 데이터 입력에는 문자열을 사용했는데,
-- 이는 날짜형식이나, 년,월,일 순서가 틀릴 경우 오류가 발생한다.
-- 때문에 날짜데이터를 입력할 때는 TO_DATE함수로 입력하는것을 권장한다.
INSERT INTO EMP_TEMP(EMPNO, ENAME,   JOB,       MGR,  HIREDATE,                           SAL,  COMM, DEPTNO)
              VALUES(2111,  '이순신', 'MANAGER', 9999, TO_DATE('07-01-2001', 'DD-MM-YYYY'), 4000, NULL, 20);
              
-- SYSDATE로 날짜 데이터 입력하기
-- SYSDATE로 입력 시, 입력하는 시점을 정확히 할 수 있다.
INSERT INTO EMP_TEMP(EMPNO, ENAME,   JOB,       MGR,  HIREDATE, SAL, COMM, DEPTNO)
              VALUES(3111,  '심청이', 'MANAGER', 9999, SYSDATE,  4000, NULL, 30);
              

--
-- 서브쿼리를 사용하여 INSERT문 한번에 여러 데이터 추가하기
-- EMP 테이블에서 급여 등급이 1인 사원만 EMP_TEMP 테이블에 삽입하기
INSERT INTO  EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     SELECT  E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
       FROM  EMP E, SALGRADE S
      WHERE  E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND  S.GRADE = 1;
        
SELECT  *
  FROM  EMP_TEMP;