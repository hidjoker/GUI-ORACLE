SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_11');

SELECT * FROM cons_10;

INSERT INTO cons_10 VALUES( 11, 'A' );
INSERT INTO cons_10 VALUES( 22, 'B' );
INSERT INTO cons_10 VALUES( 33, 'C' );

INSERT INTO cons_12 VALUES( 11, 'Alice' );
INSERT INTO cons_12 VALUES( 22, 'Bob' );
INSERT INTO cons_12 VALUES( 44, 'Dave' ); --����


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

-- ON UPDATE CASCADE �� ����Ŭ�� ����

SELECT * FROM cons_10;
SELECT * FROM cons_12;

DELETE cons_10
WHERE idx=11;





-- ALTER TABLE
CREATE TABLE alter_test (
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT pk_alter_test PRIMARY KEY ( empno ) );

-- emp���̺��� empno, ename�� ��� ���� ����
INSERT INTO alter_test
SELECT empno, ename FROM emp;

SELECT * FROM alter_test;


desc emp;
-- sal �÷� �߰�
ALTER TABLE alter_test
ADD ( sal NUMBER(7,2) );
SELECT * FROM alter_test;

-- job�÷� �߰�
ALTER TABLE alter_test
ADD ( job VARCHAR2(9) );


-- emp���̺��� sal, job�� alter_test�� �ݿ�
UPDATE alter_test a
SET ( a.sal, a.job ) = (
    SELECT sal, job FROM emp e
    WHERE a.empno = e.empno );

SELECT * FROM alter_test;


desc alter_test;
desc emp;


-- �÷� ����
ALTER TABLE alter_test
MODIFY ( ename VARCHAR2(10) );

SELECT * FROM alter_test;


-- sal, job  -> ��� NULL
UPDATE alter_test
SET sal=null, job=null;

-- job �÷� ������Ÿ�� ���� VARCHAR2(9) -> NUMBER
-- �����Ͱ� �ϳ��� ���ٸ� ������Ÿ�� ���� ����
ALTER TABLE alter_test
MODIFY ( job NUMBER );

--job �÷��� 100���� ����
UPDATE alter_test
SET job = 100;

-- ERROR
-- job�÷��� �����Ͱ� �ִµ� �ٸ� ������Ÿ������ ����õ�
ALTER TABLE alter_test
MODIFY ( job VARCHAR2(9) );

-- �÷� ����
ALTER TABLE alter_test
DROP COLUMN job;

-- �÷� ��Ȱ��ȭ ( ���� �Ұ� )
ALTER TABLE alter_test
SET UNUSED ( sal );
desc alter_test;

-- ��Ȱ��ȭ�� �÷� �����ϱ�
ALTER TABLE alter_test
DROP UNUSED COLUMNS;

-- ��Ȱ��ȭ�� �÷��� �ڷ����
SELECT * FROM USER_UNUSED_COL_TABS;
ALTER TABLE alter_test
SET UNUSED ( ename );
ALTER TABLE cons_11
SET UNUSED ( data );



desc alter_test;

-- �÷��� ����
ALTER TABLE alter_test
RENAME COLUMN empno TO eno;

-- ���̺�� ����
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






-- ���� ��ȸ
SELECT * FROM USER_SYS_PRIVS
WHERE username = UPPER('scott');

SELECT * FROM DBA_SYS_PRIVS
WHERE grantee = UPPER('scott');

SELECT * FROM USER_TAB_PRIVS
WHERE grantee = upper('scott');

SELECT * FROM DBA_TAB_PRIVS
WHERE grantee = upper('scott');



-- test ���� ���� ( DBA login )
CREATE USER test IDENTIFIED BY 1234;

-- test������ DB���ӱ��� �ο� (DBA)
GRANT CREATE SESSION
TO test;



SELECT * FROM dba_sys_privs
WHERE GRANTEE = 'SCOTT';

SELECT * FROM dba_sys_privs
WHERE grantee=UPPER('resource');

SELECT * FROM dba_role_privs
WHERE grantee=UPPER('scott');


--scott���� CREATE USER ���� �ο��ϱ� (DBA)
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


-- �� ���� (DBA)
CREATE ROLE role_test;

-- �ѿ� ���� �ο�, �������� ���� (DBA)
GRANT CREATE TABLE, CREATE SESSION, CREATE VIEW
TO role_test;

-- ���� ����ڿ��� �ο�
GRANT role_test
TO test;

-- ��� �ý��� ���� Ȯ���ϱ�(������)
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN (
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE GRANTEE = 'TEST' )
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee='TEST';


-- test����ڿ���
-- scott.emp ���̺� select ��ü ���� �ο��ϱ�
GRANT SELECT
ON scott.emp
TO test;

-- test����ڿ��Լ�
-- scott.emp ���̺� select ��ü ���� ȸ���ϱ�
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



-- UNIQUE INDEX ����
CREATE UNIQUE INDEX idx_salgrade
ON salgrade( grade );

SELECT * FROM salgrade;

-- UNIQUE ���������� �ɷ��־� �ߺ��� ���� �Ұ�
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