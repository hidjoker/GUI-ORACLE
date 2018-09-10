SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_10');

SELECT * FROM cons_10;
INSERT INTO cons_10 VALUES(11, 'A');
INSERT INTO cons_10 VALUES(22, 'B');
INSERT INTO cons_10 VALUES(33, 'C');

INSERT INTO cons_12 VALUES(11, 'Alice');
INSERT INTO cons_12 VALUES(22, 'Bob');
INSERT INTO cons_12 VALUES(44, 'Dave'); --에러

DELETE cons_10
WHERE idx=11;

DELETE cons_10
WHERE idx=33;

ALTER TABLE cons_12
DROP CONSTRAINT CONS_12_FK;

ALTER TABLE cons_12
ADD CONSTRAINT CONS_12_FK
    FOREIGN KEY (num)
    REFERENCES cons_10 (idx)
    ON DELETE CASCADE; -- 참조하고 있는 대상이 지워지면 함께 지우기
--    ON UPDATE CASCADE; --오라클에선 UPDATE CASCADE를 지원하지 않음
    
SELECT * FROM cons_10;
SELECT * FROM cons_12;

DELETE cons_10
WHERE idx=11;

--+ 테이블 변경 - ALTER

--	- ALTER TABLE
--		테이블 구조(스키마) 변경하기 위한 DDL
--		테이블 지정 이후에 어떤 변경을 수행할 지 키워드가 달라짐
--		ADD - 컬럼 추가
--		MODIFY - 컬럼 수정
--		DROP - 컬럼 삭제

-- ALTER TABLE
CREATE TABLE alter_test(
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT pk_alter_test PRIMARY KEY(empno)
);

-- emp 테이블에서 empno, ename의 모든 행을 복사
INSERT INTO alter_test
SELECT empno, ename FROM emp;

SELECT * FROM alter_test;
desc emp;

--	- ALTER TABLE ~ ADD
--		~ 테이블에 새 컬럼 추가
--		마지막 컬럼 ID가 부여된다

-- sal 컬럼 추가
ALTER TABLE alter_test
ADD ( sal NUMBER(7,2) );
SELECT * FROM alter_test;
-- job 컬럼 추가
ALTER TABLE alter_test
ADD ( job VARCHAR2(9));

-- emp 테이블의 sal, job을 alter_test에 반영
UPDATE alter_test a
SET ( a.sal, a.job) = (
    SELECT sal, job FROM emp e
    WHERE a.empno = e.empno);

desc alter_test;
desc emp;

--	- ALTER TABLE ~ MODIFY
--		~ 테이블의 컬럼 변경
--		데이터가 있을 때, 없을 때 동작이 다르다
--		데이터타입을 변경하거나 크기를 변경할 수 있다
--			자료 없음				자료 있음
--	타입	변경가능				변경 불가
--	크기	변경가능				존재하는 자료보다 작게 불가
--	** 예외 : CHAR와 VARCHAR2는 자료가 있어도 타입변경 가능

-- 컬럼 변경
ALTER TABLE alter_test
MODIFY (ename VARCHAR2(10) ); -- 존재하는 데이터보다 작은 크기로 설정할 수 없다

SELECT * FROM alter_test;

-- sal, job -> 모두 NULL
UPDATE alter_test
SET sal=null, job=null;

-- job 컬럼 데이터타입 변경 VARCHAR2(9) -> NUMBER
-- 데이터가 하나도 없다면 데이터타입 변경 가능
ALTER TABLE alter_test
MODIFY (job NUMBER); -- 데이터가 존재하는 데이터타입을 바꿀 수 없다

-- job 컬럼을 100으로 변경
UPDATE alter_test
SET job=100;

-- ERROR
-- job컬럼에 데이터가 있는데 다른 데이터타입으로 변경시도
ALTER TABLE alter_test
MODIFY (job VARCHAR2(9) );

--	- ALTER TABLE ~ DROP
--		컬럼 삭제

-- 컬럼 삭제
ALTER TABLE alter_test
DROP COLUMN job;

--	- ALTER TABLE ~ SET UNUSED
--		삭제는 하지않지만 컬럼을 비활성화(복구 불가)
--		DB서비스가 동작중일 때 DROP 작업을 수행하면
--	    	 성능저하를 유발하기 떄문에 비활성화만 해둔다

-- 컬럼 비활성화 (복구 불가)
ALTER TABLE alter_test
SET UNUSED (sal);

desc alter_test;

--	- ALTER TABLE ~ DROP UNUSED COLUMS
--		비활성화 된 컬럼들 실제 삭제

-- 비활성화된 컬럼 삭제하기
ALTER TABLE alter_test
DROP UNUSED COLUMNS;

-- 비활성화된 컬럼들 자료사전
SELECT * FROM USER_UNUSED_COL_TABS;
ALTER TABLE alter_test
SET UNUSED (ename);
ALTER TABLE cons_11
SET UNUSED (data);

desc alter_test;

--	- ALTER TABLE ~ RENAME
--		이름 수정
--		테이블명 또는 컬럼명 변경할 때 사용
--		- 컬럼명 변경
--		ALTER TABLE ~ RENAME COLUMN 기존 col TO 새 col
--		- 테이블명 변경
--		ALTER TABLE ~ RENAME TO 새테이블명

-- 컬럼명 변경
ALTER TABLE alter_test
RENAME COLUMN empno TO eno;

-- 테이블명 변경
ALTER TABLE alter_test
RENAME TO alter_test_tb;

SELECT * FROM alter_test_tb;

-- + 테이블 삭제
--	- DROP TABLE table_name (DDL)
--		테이블을 삭제함
--		테이블 스키마까지 삭제

--	- TRUNCATE TABLE table_name (DDL)
--		테이블 내용 지우기
--		스키마 유지

--	- DELETE table_name (DML)
--		테이블 내용 지우기
--		스키마 유지

--	- TRUNCATE VS DELETE
--		TRUNCATE는 차지하고 있던 공간도 없애줌 -- 용량이 줄어듬
--		DELETE는 차지하고 있던 공간을 빈 공간으로 만듦 -- 용량유지
--commit;

--DELETE FROM
DELETE alter_test_tb;
SELECT * FROM alter_test_tb;
--rollback;

--TRUNCATE
TRUNCATE TABLE alter_test_tb;
SELECT * FROM alter_test_tb;
--rollback;

--DROP TABLE
DROP TABLE alter_test_tb;

--+ DCL, Data Control Language, 데이터 제어어
--	- 권한 또는 트랜잭션을 관리하는 SQL

--	- TCL, Transaction Control Language
--		COMMIT : 트랜잭션 반영
--		ROLLBACK : 트랜잭션 미반영

--	- 권한 구문
--		GRANT : 권한 부여
--		REVOKE : 권한 회수
-- + 권한
--	- 테이블에 접근 또는 사용할 수 있는 SQL문에 제한을 두는 것
--	- 사용자마다 다른 권한을 부여해 보안성을 확보할 수 있다
--	- 시스템 권한, 객체 권한이 있다

-- + 시스템 권한
--	- 데이터베이스 작업에 대한 권한
--	- 사용자 생성, 제거
--	- DB접근
--	- 객체 생성
--	- DBA 계정에 주로 부여한다
--	- SYSTEM
--	- SYS
-- + 객체 권한
--	- 데이터베이스의 객체(테이블, 뷰, 함수, 프로시저 등등)에
--	특정 작업을 수행할 수 있는 권한
--	- 객체의 소유자는 객체에 대한 모든 권한을 자동으로 부여받음

-- + 시스템 권한
--	- 대표적인 시스템 권한
--		CREATE SESSION : DB 접속 권한
--		CREATE VIEW : DB VIEW 객체 생성 권한
--		CREATE ROLE : DB ROLE 객체 생성 권한
--		CREATE USER : 사용자 생성 권한
--		ALTER USER : 사용자 정의 변경 권한
--		DROP USER : 사용자 삭제 권한
--		CREATE(ALTER, DROP) TABLE : 테이블 객체 권한
--		CREATE(ALTER, DROP) SEQUENCE : 시퀀스 객체 권한

--	 - 부여된 권한 확인하기
--		SELECT * FROM DBA_SYS_PRIVS; - DBA의 시스템권한 확인
--		SELECT * FROM USER_SYS_PRIVS; - 사용자 시스템권한 확인
--	 - 시스템 권한 부여 문법
--		GRANT 권한종류
--		TO 사용자
--	 [ WITH ADMIN OPTION ]
--  	 - WITH ADMIN OPTION
--		부여받은 권한을 다른 사용자에게 부여할 수 있는
--		권한을 허용하는 설정
--   	 - 시스템 권한 회수 문법
--	 	REVOKE 권한종류
--		FROM 사용자
-- + 객체 권한
--	- 대표적인 객체 권한
--		SELECT : 객체 조회 권한
--		INSERT : 삽입 권한
--		UPDATE : 갱신 권한
--		DELETE : 삭제 권한
--		ALTER : 객체 스키마 변경 권한
--		RENAME : 이름 변경 권한
--		GRANT : GRANT(권한부여) 권한
--		INDEX : 인덱싱 권한
--		EXECUTE : 프로시저 실행 권한
--	- 객체 권한 확인하기
--		SELECT * FROM DBA_TAB_PRIVS; -- DBA의 객체권한
--		SELECT * FROM USER_TAB_PRIVS; -- USER의 객체권한
--	- 객체 권한 부여 문법
--		GRANT 객체권한
--		ON 객체
--		TO 사용자
--		ex)
--		GRANT SELECT
--		ON scott.emp
--	- 객체 권한 회수 문법
--		REVOKE 객체권한
--		ON 객체
--		FROM 사용자
--		TO test

-- 권한 조회
SELECT * FROM USER_SYS_PRIVS;
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee = UPPER('scott');

SELECT * FROM USER_TAB_PRIVS
WHERE grantee = UPPER('scott');
SELECT * FROM DBA_TAB_PRIVS;

-- test 계정 생성( DBA login )
CREATE USER test IDENTIFIED BY 1234;

-- test 계정에 DB 접속권한 부여(DBA)
GRANT CREATE SESSION to test;

-- scott에게 CREATE USER 권한 부여하기 (DBA)
GRANT CREATE USER TO scott WITH ADMIN OPTION;--(DBA)
show user; --(scott)
CREATE USER test2 IDENTIFIED BY 1234;
GRANT CREATE SESSION TO test2; --(scott)
GRANT CREATE SESSION TO test2; --(DBA)

REVOKE CREATE USER FROM scott;
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE IN('SCOTT','TEST','TEST2');

SELECT * FROM DBA_ROLE_PRIVS
WHERE GRANTEE IN('SCOTT','TEST','TEST2');

SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE IN('RESOURCE','CONNECT');

-- 모든 시스템 권한 확인하기(롤포함)
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN(
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE GRANTEE = 'scott')
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee='scott';

-- + 롤, Role
--	- 권한 집합
--	- 여러 개의 권한을 한번에 부여하거나 회수할 수 있게 해준다
--	- CREATE ROLE 권한이 있어야 생성할 수 있음
--	- 권한을 사용자에게 부여하는 것처럼 롤에 부여하고
--	  롤을 사용자에게 부여하는 식으로 사용한다
--	  (롤을 롤에 부여하는 것도 가능)

-- 롤 생성 (DBA)
CREATE ROLE role_test;

-- 롤에 권한 부여, 권한집합 생성 (DBA)
GRANT CREATE TABLE, CREATE SESSION, CREATE VIEW
TO role_test;

-- 롤을 사용자에게 부여
GRANT role_test to TEST;

-- test 사용자에게
-- scott.emp 테이블 select 객체 권한 부여하기
GRANT SELECT ON scott.emp TO test;

-- test 사용자에게 
-- scott.emp 테이블 select 객체 권한 회수하기
REVOKE SELECT ON scott.emp FROM test;

SELECT * FROM scott.emp;

--+ 인덱스, Index
--	- 색인
--	- 테이블 검색 속도 향상을 위한 오브젝트
--	- 테이블의 컬럼 적용된다
--	- 테이블과 독립적으로 생성되지만 테이블의 컬럼에 의존적
--	- UNIQUE KEY(UK, 유일키) 제약 사항이 걸린 컬럼은 자동으로 생성
-- + 인덱스 장점
--	- 검색 속도가 향상된다
--	- 테이블을 전체조회할 때 발생할 수 있는 시스템 성능 저하를 줄여준다
-- + 인덱스 단점
--	- 인덱스 객체를 생성하는데 시간이 필요하다
--	- 인덱스를 위한 별도의 공간이 필요하다
--	- 검색 성능향상이 있지만 추가, 수정, 삭제에는 도움이 되지 않는다
--	- 테이블에 추가, 삭제, 수정이 발생하면 인덱싱을 다시 수행해야한다
-- + 인덱스 생성이 필요한 경우
--	- 데이터가 많을 때 ( 약 1000건 이상 )
--	- WHERE 구문에서 조건으로 특정 컬럼이 많이 사용될 때
--	- JOIN 조건절에서 특정 컬럼이 많이 사용될 때
-- + 인덱스 생성이 불필요한 경우
--	- 데이터가 적을 때 (수천건 미만)
--	- SELECT 보다 INSERT, UPDATE, DELETE가 빈번한 경우
--	- 조회 결과가 전체 행 수의 상당부분을 차지하는 경우(약 15%)
-- + 인덱스 종류 및 생성 구문
--	- NON-UNIQUE INDEX : 중복을 허용하는 인덱스
--		CREATE INDEX 인덱스명 ON 테이블명( 컬럼명 );
--	- UNIQUE INDEX : 중복을 허용하지 않는 인덱스
--		CREATE UNIQUE INDEX 인덱스명 ON 테이블명( 컬럼명 );
--	- COMPOSITE INDEX : 복합 컬럼 인덱스
--		CREATE INDEX 인덱스명 ON 테이블명( 컬럼1, 컬럼2, ... );
-- + 인덱스 재생성
--	ALTER INDEX 인덱스명 REBUILD;
-- + 인덱스 제거 구문
--	DROP INDEX 인덱스명;
-- + 인덱스 조회
--	SELECT * FROM USER_INDEXES; -- 인덱스 조회
--	SELECT * FROM USER_IND_COLUMNS; -- 인덱싱 컬럼조회
-- INDEX
SELECT * FROM user_indexes
WHERE table_name = upper('emp');

SELECT * FROM user_indexes
WHERE table_name = upper('dept');

SELECT * FROM USER_IND_COLUMNS
WHERE index_name = upper('PK_DEPT');

SELECT * FROM user_indexes
WHERE table_name = upper('salgrade');

CREATE INDEX idx_salgrade
ON salgrade( grade );

SELECT * FROM salgrade;
INSERT INTO salgrade VALUES (5, 7777, 8888);

ALTER INDEX idx_salgrade REBUILD;

DELETE salgrade WHERE grade=5 AND losal=7777;
DROP INDEX idx_salgrade;

-- UNIQUE INDEX 생성
CREATE UNIQUE INDEX idx_salgrade
ON salgrade( grade );

-- UNIQUE 제약조건이 걸려있어 중복값 삽입 불가
INSERT INTO salgrade VALUES( 5 , 7777 , 8888 );

-- COMPOSITE INDEX
SELECT * FROM user_indexes
WHERE table_name = upper('emp');

CREATE UNIQUE INDEX idx_emp
ON emp( empno, deptno );

SELECT * FROM user_ind_columns
WHERE table_name = upper('emp')
ORDER BY index_name;