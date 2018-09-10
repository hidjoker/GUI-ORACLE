-- + DML, Data Manipulation Language, 데이터 조작어
--	- INSERT
--	테이블에 새로운 행을 추가할 때 사용하는 SQL
--	[문법]
--	INSERT INTO table_name(col1, col2, ...)
--	VALUES(data1 , data2, ...)

--	INSERT INTO table_name
--	VALUES(data1, data2, ...)
--		-> COLUMN_ID 에 맞게 순서대로 데이터를 기입한다
--		-> 모든 컬럼에 데이터를 넣어야 한다

--	INSERT INTO table_name(col1, col2, ...)
--	SELECT 절

-- INSERT
desc emp;

INSERT INTO emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(1001, 'ALICE', 'CLERK', 1003, '17/01/08', 800, NULL, 30);

SELECT * FROM emp
WHERE empno=1002;

desc emp;
INSERT INTO emp
VALUES(1002,'MORRIS','CLERK',1003,'17/01/08',800,NULL,30);

SELECT * FROM emp WHERE empno<2000;

INSERT INTO emp
SELECT 1003, 'MATHEW', 'SALESMAN', NULL, sysdate, 1500, 100, 30 FROM dual;

INSERT INTO emp(empno, ename)
VALUES(1010,'BOB');

-- 2명의 정보를 삽입하시오
-- 사번 1011
-- 이름 EDWARD
-- 직무 MANAGER

-- 사변 1015
-- 이름 richard
-- 급여 2000

INSERT INTO emp(empno, ename, job)
VALUES(1011, 'EDWARD', 'MANAGER');

INSERT INTO emp(empno, ename, sal)
VALUES(1015, 'richard', 2000);

--commit; -- 영구반영
--rollback; -- 되돌리기

-- 테이블 생성
CREATE TABLE emp_research
AS
SELECT * FROM emp;

SELECT * FROM emp_research;

-- 테이블 삭제
DROP TABLE emp_research;

CREATE TABLE emp_research
AS
SELECT * FROM emp WHERE deptno=20;

CREATE TABLE emp_research
AS
SELECT * FROM emp WHERE 1=0;

SELECT * FROM emp_research;

desc emp_research;

-- 20번 부서의 모든 데이터를 INSERT
INSERT INTO emp_research
SELECT * FROM emp WHERE deptno=20;

-- 30번 부서의 empno, ename 데이터를 INSERT
INSERT INTO emp_research(empno,ename)
SELECT empno, ename FROM emp WHERE deptno=30;
SELECT * FROM emp_research;
-- 데이터 삭제
DELETE FROM emp_research; --모든 행 삭제

--	- INSERT ALL
--		[구문]
--		INSERT ALL
--		WHEN 조건절
--			THEN INTO table_name(columns)
--			VALUES(datalist)
--		[WHEN절 반복]
--		SELECT절 :
--		** THEN INTO절의 컬럼명, VALUES 생략 가능
--		** 생략 시에는 조회된 모든 컬럼에 해당하는 값을 삽입
--		SELECT 문의 결과를 조건에 따라 INSERT하는 구문
--		여러개의 INSERT구문을 하나로 합칠 수 있다

-- INSERT ALL

INSERT ALL
WHEN deptno=20
    THEN INTO emp_research
WHEN deptno=30
    THEN INTO emp_research(empno, ename)
    VALUES(empno, ename)    
SELECT * FROM emp;

SELECT * FROM emp_research;

CREATE TABLE emp_hire
AS SELECT empno, ename, hiredate
    FROM emp WHERE 1=0;
desc emp_hire;

CREATE TABLE emp_sal
AS SELECT empno, ename, sal
    FROM emp WHERE 1=0;
desc emp_sal;

-- emp_hire
-- 입사일이 '1981/06/01' 이전인 사람
-- emp_sal
-- 급여가 2000보다 많은 사람
SELECT * FROM emp;

INSERT ALL
WHEN hiredate <= to_date('1981/06/01') 
    THEN INTO emp_hire(empno,ename,hiredate)
    VALUES(empno,ename,hiredate)
WHEN sal >2000 
    THEN INTO emp_sal(empno,ename,sal)
    VALUES(empno,ename,sal)
SELECT * FROM emp;

SELECT*FROM emp_hire;
SELECT*FROM emp_sal;

--	- UPDATE
--		테이블의 행을 수정하는 구문
--		[구문]
--		UPDATE table_name
--		SET col1 = 변경값1, co2 = 변경값2, ...
--		WHERE 조건;

-- UPDATE
SELECT * FROM emp
--UPDATE emp SET ename = 'MATT'
WHERE empno = 1003;

--Commit;
--rollback;

SELECT * FROM emp
--UPDATE emp SET ename='Burger',job='King'
WHERE empno = 1001;

SELECT * FROM emp_hire;
-- UPDATE emp_hire SET hiredate=sysdate;
--commit;

--	- DELETE
--		테이블의 행을 삭제할 때 사용하는 구문
--		[구문]
--		DELETE [FROM] table_name
--		WHERE 조건;

SELECT * FROM emp
-- DELETE emp
WHERE empno = 1002;
-- rollback;

SELECT * FROM emp_sal;
-- DELETE emp_sal;
-- commit;


--	- MERGE
--		조건에 따라서
--		결과가 존재할 경우 UPDATE(or DELETE)
--		결과가 존재하지 않을 경우 INSERT 를
--		수행하도록 하는 하나의 구문으로 작성하는 것
--		[구문]
--		MERGE INTO table_name
--		USING(
--				SELECT 절
--		)
--		ON(조건절)
--		WHEN MATCHED
--				THEN 구문
--		WHEN NOT MATCHED
--				THEN 구문;
--		-> INTO : 삽입, 갱신, 삭제 가 이루어지는 테이블
--		-> USING : 비교할 소스테이블 or 서브쿼리(인라인뷰)
--		-> ON : WHEN절에서 반응할 조건
--		-> WHEN MATCHED : ON에서 지정한 조건을 만족하는 결과가 존재할 떄
--		-> WHEN NOT MATCHED : ON에서 지정한 조건에 만족한 결과가 없을 떄
--		** WHEN MATCHED 구문에 UPDATE or DELETE
--		** WHEN NOT MATCHED 구문에 INSERT

-- emp테이블에서 10,20부서인 인원 복사 -> emp_merge
-- emp테이블에서 20,30부서를 조회
-- emp_merge에 존재하는 사원이면 sal 10%인상
-- emp_merge에 존재하지 않으면 원본 삽입

CREATE TABLE emp_merge
AS
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN(10,20);

SELECT * FROM emp_merge ORDER BY deptno, empno;

MERGE INTO emp_merge m
USING(
    SELECT empno, ename, deptno, sal
    FROM emp
    WHERE deptno IN(20,30)
)E
ON( e.empno = m.empno)
WHEN MATCHED THEN
    UPDATE SET m.sal = ROUND(m.sal*1.1)
--    WHERE e.sal > 1500
WHEN NOT MATCHED THEN
    INSERT(m.empno, m.ename, m.sal, m.deptno)
    VALUES(e.empno, e.ename, e.sal, e.deptno);
--    WHERE e.sal >1000;

SELECT * FROM emp_merge ORDER BY deptno, empno;
-- DELETE emp_merge;
-- DROP TABLE emp_merge;

--+ 트랜잭션, Transaction
-- - 데이터를 처리하는 일련의 작업 단위
-- - 논리적인 작업단위
-- - 일련의 작업들의 성공 or 실패를 결정짓는 단위
-- - 성공 시 -> DB 영구 반영 -> commit
-- - 실패 시 -> 트랜잭션 전부 미반영 -> rollback
-- - 트랜잭션 발생 SQL
--	INSERT, UPDATE, DELETE

--+ 트랜잭션의 상태 변화
-- - 트랜잭션의 시작
--	실행 가능한 SQL문장이 수행될 때
--	INSERT, UPDATE, DELETE
-- - 트랜잭션의 종료
--	COMMIT 또는 ROLLBACK을 수행
--	DDL이나 DCL 문장 수행
--	기계 장애 또는 시스템 충돌
--	사용자의 정상적인 DB 종료
-- - Auto Commit(자동 반영) 상황
--	DDL, DCL이 완료되는 시점
--	SQL*Plus의 정상 종료
-- - Auto Rollback(자동 미반영) 상황
--	시스템의 비정상적인 종료
--	SQL*Plus의 비정상 종료

-- **Commit, Rollback
--	DCL(Data Control Language)에 포함됨
--	TCL(Transaction Control Language)이라고도 부름

--+ LOCK, 락
-- - ROW LOCK
-- - TABLE LOCK
-- - DB LOCK
-- - 특정 사용자에게만 해당 LOCK영역에 대한 접근을 허용하는 것

-- - LOCK 영역에 접근중인 사용자가 있으면 그 외의 사용자는 LOCK영역에 데이터에 접근 할 수 없다(SELECT도 안됨)
-- - LOCK이 해제된 이후 접근 가능
-- - 트랜잭션은 변경된 행에 ROW LOCK이 걸리고 트랜잭션이 완료되고 LOCK이 풀린다

-- + DDL, Data Definition Language, 데이터 정의어
-- - DB객체(테이블, 뷰, 등등)을 생성, 변경, 삭제할 수 있는 SQL
-- - 구문
--	CREATE - 생성
--	ALTER   - 변경
--	DROP    - 삭제
-- - CREATE TABLE 구문
--	CREATE TABLE table_name(
--		컬럼명1 자료형1,
--		컬럼명2 자료형2,
--		...
--	);
--	CREATE TABLE table_name
--	AS
--	SELECT 구문

--	컬럼명 중복 불가
--	컬럼은 반드시 자료형이 명시되어야함

-- + 테이블, TABLE, TB
--  - 데이터베이스의 데이터 저장 기본단위
--  - 행(row, 레코드)과 열(column, col, 컬럼)으로 구성됨
--  - 연관성있는 데이터끼리 독립적으로 구성한다

-- CREATE TABLE
CREATE TABLE type_test_01 (
    data1 NUMBER,
    data2 NUMBER(10),
    data3 NUMBER(5,2),
    data4 NUMBER(4,5)
);
desc type_test_01;

-- data1 NUMBER
INSERT INTO type_test_01 (data1)
VALUES(1238981293081092480912421);
SELECT * FROM type_test_01;

-- 38개의 유효숫자만 남고 나머지는 0으로 채워짐
INSERT INTO type_test_01 (data1)
VALUES(1231849239849823490821034809238409231840982111);
SELECT * FROM type_test_01;

DELETE type_test_01;

-- data2 NUMBER(10)
INSERT INTO type_test_01(data2)
VALUES(123.6567);
SELECT * FROM type_test_01;

-- data3 NUMBER(5,2)
INSERT INTO type_test_01(data3)
VALUES(23.65);
INSERT INTO type_test_01(data3)
VALUES(23.6567);
INSERT INTO type_test_01(data3)
VALUES(1123.6567);
SELECT * FROM type_test_01;

-- data4 NUMBER(4,5)
INSERT INTO type_test_01(data4)
VALUES(1234);
INSERT INTO type_test_01(data4)
VALUES(0.12300);
INSERT INTO type_test_01(data4)
VALUES(0.01234);
SELECT * FROM type_test_01;

-- VARCHAR2(10)
CREATE TABLE type_test_02 (
    data VARCHAR2(10)
);
INSERT INTO type_test_02
VALUES('1234567890');

INSERT INTO type_test_02
VALUES('123456789012345');

INSERT INTO type_test_02
VALUES('일이삼사오육칠팔구십');

INSERT INTO type_test_02
VALUES('일이삼');

SELECT * FROM type_test_02;

CREATE TABLE type_test_03(
    data1 VARCHAR2(10 BYTE),
    data2 VARCHAR2(10 CHAR)
);
desc type_test_03;

INSERT INTO type_test_03(data1, data2)
VALUES('1234567890','1234567890');
INSERT INTO type_test_03(data1)
VALUES('일이삼');
INSERT INTO type_test_03(data2)
VALUES('일이삼사오육칠팔구십');
SELECT * FROM type_test_03;
