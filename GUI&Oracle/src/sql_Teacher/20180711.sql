SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_11');

SELECT * FROM cons_10;

INSERT INTO cons_10 VALUES( 11, 'A' );
INSERT INTO cons_10 VALUES( 22, 'B' );
INSERT INTO cons_10 VALUES( 33, 'C' );

INSERT INTO cons_12 VALUES( 11, 'Alice' );
INSERT INTO cons_12 VALUES( 22, 'Bob' );
INSERT INTO cons_12 VALUES( 44, 'Dave' ); --에러


DELETE cons_10
WHERE idx=11;

DELETE cons_10
WHERE idx=33;


ALTER TABLE cons_12
DROP CONSTRAINT CONS_12_FK;

ALTER TABLE cons_12
ADD CONSTRAINT CONS_12_FK
    FOREIGN KEY ( num )
    REFERENCES cons_10 ( idx )
    ON DELETE CASCADE;

-- ON UPDATE CASCADE 는 오라클에 없음

SELECT * FROM cons_10;
SELECT * FROM cons_12;

DELETE cons_10
WHERE idx=11;





-- ALTER TABLE
CREATE TABLE alter_test (
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT pk_alter_test PRIMARY KEY ( empno ) );

-- emp테이블에서 empno, ename의 모든 행을 복사
INSERT INTO alter_test
SELECT empno, ename FROM emp;

SELECT * FROM alter_test;


desc emp;
-- sal 컬럼 추가
ALTER TABLE alter_test
ADD ( sal NUMBER(7,2) );
SELECT * FROM alter_test;

-- job컬럼 추가
ALTER TABLE alter_test
ADD ( job VARCHAR2(9) );


-- emp테이블의 sal, job을 alter_test에 반영
UPDATE alter_test a
SET ( a.sal, a.job ) = (
    SELECT sal, job FROM emp e
    WHERE a.empno = e.empno );

SELECT * FROM alter_test;


desc alter_test;
desc emp;


-- 컬럼 변경
ALTER TABLE alter_test
MODIFY ( ename VARCHAR2(10) );

SELECT * FROM alter_test;


-- sal, job  -> 모두 NULL
UPDATE alter_test
SET sal=null, job=null;

-- job 컬럼 데이터타입 변경 VARCHAR2(9) -> NUMBER
-- 데이터가 하나도 없다면 데이터타입 변경 가능
ALTER TABLE alter_test
MODIFY ( job NUMBER );

--job 컬럼을 100으로 변경
UPDATE alter_test
SET job = 100;

-- ERROR
-- job컬럼에 데이터가 있는데 다른 데이터타입으로 변경시도
ALTER TABLE alter_test
MODIFY ( job VARCHAR2(9) );

-- 컬럼 삭제
ALTER TABLE alter_test
DROP COLUMN job;

-- 컬럼 비활성화 ( 복구 불가 )
ALTER TABLE alter_test
SET UNUSED ( sal );
desc alter_test;

-- 비활성화된 컬럼 삭제하기
ALTER TABLE alter_test
DROP UNUSED COLUMNS;

-- 비활성화된 컬럼들 자료사전
SELECT * FROM USER_UNUSED_COL_TABS;
ALTER TABLE alter_test
SET UNUSED ( ename );
ALTER TABLE cons_11
SET UNUSED ( data );



desc alter_test;

-- 컬럼명 변경
ALTER TABLE alter_test
RENAME COLUMN empno TO eno;

-- 테이블명 변경
ALTER TABLE alter_test
RENAME TO alter_test_tb;

SELECT * FROM alter_test_tb;

-- commit;

-- DELETE FROM
DELETE alter_test_tb;
SELECT * FROM alter_test_tb;
--rollback;


-- TRUNCATE TABLE
TRUNCATE TABLE alter_test_tb;
SELECT * FROM alter_test_tb;
--rollback;



-- DROP TABLE
DROP TABLE alter_test_tb;






-- 권한 조회
SELECT * FROM USER_SYS_PRIVS
WHERE username = UPPER('scott');

SELECT * FROM DBA_SYS_PRIVS
WHERE grantee = UPPER('scott');

SELECT * FROM USER_TAB_PRIVS
WHERE grantee = upper('scott');

SELECT * FROM DBA_TAB_PRIVS
WHERE grantee = upper('scott');



-- test 계정 생성 ( DBA login )
CREATE USER test IDENTIFIED BY 1234;

-- test계정에 DB접속권한 부여 (DBA)
GRANT CREATE SESSION
TO test;



SELECT * FROM dba_sys_privs
WHERE GRANTEE = 'SCOTT';

SELECT * FROM dba_sys_privs
WHERE grantee=UPPER('resource');

SELECT * FROM dba_role_privs
WHERE grantee=UPPER('scott');


--scott에게 CREATE USER 권한 부여하기 (DBA)
GRANT CREATE USER
TO scott
WITH ADMIN OPTION;

show user; -- ( scott )

CREATE USER test2 IDENTIFIED BY 1234;
GRANT CREATE SESSION -- (scott)
TO test2;

GRANT CREATE SESSION -- (DBA)
TO test2;

REVOKE CREATE USER
FROM scott;


SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE IN ( 'SCOTT', 'TEST', 'TEST2' );

SELECT * FROM DBA_ROLE_PRIVS
WHERE GRANTEE IN ( 'SCOTT', 'TEST', 'TEST2' );

SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE IN ( 'RESOURCE', 'CONNECT' );



SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN (
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE GRANTEE = 'SCOTT' )
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee='SCOTT';


-- 롤 생성 (DBA)
CREATE ROLE role_test;

-- 롤에 권한 부여, 권한집합 생성 (DBA)
GRANT CREATE TABLE, CREATE SESSION, CREATE VIEW
TO role_test;

-- 롤을 사용자에게 부여
GRANT role_test
TO test;

-- 모든 시스템 권한 확인하기(롤포함)
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN (
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE GRANTEE = 'TEST' )
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee='TEST';


-- test사용자에게
-- scott.emp 테이블 select 객체 권한 부여하기
GRANT SELECT
ON scott.emp
TO test;

-- test사용자에게서
-- scott.emp 테이블 select 객체 권한 회수하기
REVOKE SELECT
ON scott.emp
FROM test;



SELECT * FROM emp;





-- INDEX
SELECT * FROM user_indexes
WHERE table_name=upper('emp');

SELECT * FROM user_indexes
WHERE table_name=upper('dept');

SELECT * FROM USER_IND_COLUMNS
WHERE index_name = upper('PK_DEPT');



SELECT * FROM user_indexes
WHERE table_name=upper('salgrade');

CREATE INDEX idx_salgrade
ON salgrade( grade );

SELECT * FROM salgrade;
INSERT INTO salgrade VALUES ( 5, 7777, 8888 );

ALTER INDEX idx_salgrade REBUILD;

DELETE salgrade WHERE grade=5 AND losal=7777;
DROP INDEX idx_salgrade;



-- UNIQUE INDEX 생성
CREATE UNIQUE INDEX idx_salgrade
ON salgrade( grade );

SELECT * FROM salgrade;

-- UNIQUE 제약조건이 걸려있어 중복값 삽입 불가
INSERT INTO salgrade VALUES ( 5, 7777, 8888 );


-- COMPOSITE INDEX
SELECT * FROM user_indexes
WHERE table_name = upper('emp');

CREATE UNIQUE INDEX idx_emp
ON emp( empno, deptno );



SELECT * FROM user_indexes
WHERE table_name = upper('emp');

SELECT * FROM user_ind_columns
WHERE table_name = upper('emp')
ORDER BY index_name;