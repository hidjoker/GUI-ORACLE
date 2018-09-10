SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_10');

SELECT * FROM cons_10;
INSERT INTO cons_10 VALUES(11, 'A');
INSERT INTO cons_10 VALUES(22, 'B');
INSERT INTO cons_10 VALUES(33, 'C');

INSERT INTO cons_12 VALUES(11, 'Alice');
INSERT INTO cons_12 VALUES(22, 'Bob');
INSERT INTO cons_12 VALUES(44, 'Dave'); --����

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
    ON DELETE CASCADE; -- �����ϰ� �ִ� ����� �������� �Բ� �����
--    ON UPDATE CASCADE; --����Ŭ���� UPDATE CASCADE�� �������� ����
    
SELECT * FROM cons_10;
SELECT * FROM cons_12;

DELETE cons_10
WHERE idx=11;

--+ ���̺� ���� - ALTER

--	- ALTER TABLE
--		���̺� ����(��Ű��) �����ϱ� ���� DDL
--		���̺� ���� ���Ŀ� � ������ ������ �� Ű���尡 �޶���
--		ADD - �÷� �߰�
--		MODIFY - �÷� ����
--		DROP - �÷� ����

-- ALTER TABLE
CREATE TABLE alter_test(
    empno NUMBER(4),
    ename VARCHAR2(30),
    CONSTRAINT pk_alter_test PRIMARY KEY(empno)
);

-- emp ���̺��� empno, ename�� ��� ���� ����
INSERT INTO alter_test
SELECT empno, ename FROM emp;

SELECT * FROM alter_test;
desc emp;

--	- ALTER TABLE ~ ADD
--		~ ���̺� �� �÷� �߰�
--		������ �÷� ID�� �ο��ȴ�

-- sal �÷� �߰�
ALTER TABLE alter_test
ADD ( sal NUMBER(7,2) );
SELECT * FROM alter_test;
-- job �÷� �߰�
ALTER TABLE alter_test
ADD ( job VARCHAR2(9));

-- emp ���̺��� sal, job�� alter_test�� �ݿ�
UPDATE alter_test a
SET ( a.sal, a.job) = (
    SELECT sal, job FROM emp e
    WHERE a.empno = e.empno);

desc alter_test;
desc emp;

--	- ALTER TABLE ~ MODIFY
--		~ ���̺��� �÷� ����
--		�����Ͱ� ���� ��, ���� �� ������ �ٸ���
--		������Ÿ���� �����ϰų� ũ�⸦ ������ �� �ִ�
--			�ڷ� ����				�ڷ� ����
--	Ÿ��	���氡��				���� �Ұ�
--	ũ��	���氡��				�����ϴ� �ڷẸ�� �۰� �Ұ�
--	** ���� : CHAR�� VARCHAR2�� �ڷᰡ �־ Ÿ�Ժ��� ����

-- �÷� ����
ALTER TABLE alter_test
MODIFY (ename VARCHAR2(10) ); -- �����ϴ� �����ͺ��� ���� ũ��� ������ �� ����

SELECT * FROM alter_test;

-- sal, job -> ��� NULL
UPDATE alter_test
SET sal=null, job=null;

-- job �÷� ������Ÿ�� ���� VARCHAR2(9) -> NUMBER
-- �����Ͱ� �ϳ��� ���ٸ� ������Ÿ�� ���� ����
ALTER TABLE alter_test
MODIFY (job NUMBER); -- �����Ͱ� �����ϴ� ������Ÿ���� �ٲ� �� ����

-- job �÷��� 100���� ����
UPDATE alter_test
SET job=100;

-- ERROR
-- job�÷��� �����Ͱ� �ִµ� �ٸ� ������Ÿ������ ����õ�
ALTER TABLE alter_test
MODIFY (job VARCHAR2(9) );

--	- ALTER TABLE ~ DROP
--		�÷� ����

-- �÷� ����
ALTER TABLE alter_test
DROP COLUMN job;

--	- ALTER TABLE ~ SET UNUSED
--		������ ���������� �÷��� ��Ȱ��ȭ(���� �Ұ�)
--		DB���񽺰� �������� �� DROP �۾��� �����ϸ�
--	    	 �������ϸ� �����ϱ� ������ ��Ȱ��ȭ�� �صд�

-- �÷� ��Ȱ��ȭ (���� �Ұ�)
ALTER TABLE alter_test
SET UNUSED (sal);

desc alter_test;

--	- ALTER TABLE ~ DROP UNUSED COLUMS
--		��Ȱ��ȭ �� �÷��� ���� ����

-- ��Ȱ��ȭ�� �÷� �����ϱ�
ALTER TABLE alter_test
DROP UNUSED COLUMNS;

-- ��Ȱ��ȭ�� �÷��� �ڷ����
SELECT * FROM USER_UNUSED_COL_TABS;
ALTER TABLE alter_test
SET UNUSED (ename);
ALTER TABLE cons_11
SET UNUSED (data);

desc alter_test;

--	- ALTER TABLE ~ RENAME
--		�̸� ����
--		���̺�� �Ǵ� �÷��� ������ �� ���
--		- �÷��� ����
--		ALTER TABLE ~ RENAME COLUMN ���� col TO �� col
--		- ���̺�� ����
--		ALTER TABLE ~ RENAME TO �����̺��

-- �÷��� ����
ALTER TABLE alter_test
RENAME COLUMN empno TO eno;

-- ���̺�� ����
ALTER TABLE alter_test
RENAME TO alter_test_tb;

SELECT * FROM alter_test_tb;

-- + ���̺� ����
--	- DROP TABLE table_name (DDL)
--		���̺��� ������
--		���̺� ��Ű������ ����

--	- TRUNCATE TABLE table_name (DDL)
--		���̺� ���� �����
--		��Ű�� ����

--	- DELETE table_name (DML)
--		���̺� ���� �����
--		��Ű�� ����

--	- TRUNCATE VS DELETE
--		TRUNCATE�� �����ϰ� �ִ� ������ ������ -- �뷮�� �پ��
--		DELETE�� �����ϰ� �ִ� ������ �� �������� ���� -- �뷮����
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

--+ DCL, Data Control Language, ������ �����
--	- ���� �Ǵ� Ʈ������� �����ϴ� SQL

--	- TCL, Transaction Control Language
--		COMMIT : Ʈ����� �ݿ�
--		ROLLBACK : Ʈ����� �̹ݿ�

--	- ���� ����
--		GRANT : ���� �ο�
--		REVOKE : ���� ȸ��
-- + ����
--	- ���̺� ���� �Ǵ� ����� �� �ִ� SQL���� ������ �δ� ��
--	- ����ڸ��� �ٸ� ������ �ο��� ���ȼ��� Ȯ���� �� �ִ�
--	- �ý��� ����, ��ü ������ �ִ�

-- + �ý��� ����
--	- �����ͺ��̽� �۾��� ���� ����
--	- ����� ����, ����
--	- DB����
--	- ��ü ����
--	- DBA ������ �ַ� �ο��Ѵ�
--	- SYSTEM
--	- SYS
-- + ��ü ����
--	- �����ͺ��̽��� ��ü(���̺�, ��, �Լ�, ���ν��� ���)��
--	Ư�� �۾��� ������ �� �ִ� ����
--	- ��ü�� �����ڴ� ��ü�� ���� ��� ������ �ڵ����� �ο�����

-- + �ý��� ����
--	- ��ǥ���� �ý��� ����
--		CREATE SESSION : DB ���� ����
--		CREATE VIEW : DB VIEW ��ü ���� ����
--		CREATE ROLE : DB ROLE ��ü ���� ����
--		CREATE USER : ����� ���� ����
--		ALTER USER : ����� ���� ���� ����
--		DROP USER : ����� ���� ����
--		CREATE(ALTER, DROP) TABLE : ���̺� ��ü ����
--		CREATE(ALTER, DROP) SEQUENCE : ������ ��ü ����

--	 - �ο��� ���� Ȯ���ϱ�
--		SELECT * FROM DBA_SYS_PRIVS; - DBA�� �ý��۱��� Ȯ��
--		SELECT * FROM USER_SYS_PRIVS; - ����� �ý��۱��� Ȯ��
--	 - �ý��� ���� �ο� ����
--		GRANT ��������
--		TO �����
--	 [ WITH ADMIN OPTION ]
--  	 - WITH ADMIN OPTION
--		�ο����� ������ �ٸ� ����ڿ��� �ο��� �� �ִ�
--		������ ����ϴ� ����
--   	 - �ý��� ���� ȸ�� ����
--	 	REVOKE ��������
--		FROM �����
-- + ��ü ����
--	- ��ǥ���� ��ü ����
--		SELECT : ��ü ��ȸ ����
--		INSERT : ���� ����
--		UPDATE : ���� ����
--		DELETE : ���� ����
--		ALTER : ��ü ��Ű�� ���� ����
--		RENAME : �̸� ���� ����
--		GRANT : GRANT(���Ѻο�) ����
--		INDEX : �ε��� ����
--		EXECUTE : ���ν��� ���� ����
--	- ��ü ���� Ȯ���ϱ�
--		SELECT * FROM DBA_TAB_PRIVS; -- DBA�� ��ü����
--		SELECT * FROM USER_TAB_PRIVS; -- USER�� ��ü����
--	- ��ü ���� �ο� ����
--		GRANT ��ü����
--		ON ��ü
--		TO �����
--		ex)
--		GRANT SELECT
--		ON scott.emp
--	- ��ü ���� ȸ�� ����
--		REVOKE ��ü����
--		ON ��ü
--		FROM �����
--		TO test

-- ���� ��ȸ
SELECT * FROM USER_SYS_PRIVS;
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee = UPPER('scott');

SELECT * FROM USER_TAB_PRIVS
WHERE grantee = UPPER('scott');
SELECT * FROM DBA_TAB_PRIVS;

-- test ���� ����( DBA login )
CREATE USER test IDENTIFIED BY 1234;

-- test ������ DB ���ӱ��� �ο�(DBA)
GRANT CREATE SESSION to test;

-- scott���� CREATE USER ���� �ο��ϱ� (DBA)
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

-- ��� �ý��� ���� Ȯ���ϱ�(������)
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN(
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE GRANTEE = 'scott')
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee='scott';

-- + ��, Role
--	- ���� ����
--	- ���� ���� ������ �ѹ��� �ο��ϰų� ȸ���� �� �ְ� ���ش�
--	- CREATE ROLE ������ �־�� ������ �� ����
--	- ������ ����ڿ��� �ο��ϴ� ��ó�� �ѿ� �ο��ϰ�
--	  ���� ����ڿ��� �ο��ϴ� ������ ����Ѵ�
--	  (���� �ѿ� �ο��ϴ� �͵� ����)

-- �� ���� (DBA)
CREATE ROLE role_test;

-- �ѿ� ���� �ο�, �������� ���� (DBA)
GRANT CREATE TABLE, CREATE SESSION, CREATE VIEW
TO role_test;

-- ���� ����ڿ��� �ο�
GRANT role_test to TEST;

-- test ����ڿ���
-- scott.emp ���̺� select ��ü ���� �ο��ϱ�
GRANT SELECT ON scott.emp TO test;

-- test ����ڿ��� 
-- scott.emp ���̺� select ��ü ���� ȸ���ϱ�
REVOKE SELECT ON scott.emp FROM test;

SELECT * FROM scott.emp;

--+ �ε���, Index
--	- ����
--	- ���̺� �˻� �ӵ� ����� ���� ������Ʈ
--	- ���̺��� �÷� ����ȴ�
--	- ���̺�� ���������� ���������� ���̺��� �÷��� ������
--	- UNIQUE KEY(UK, ����Ű) ���� ������ �ɸ� �÷��� �ڵ����� ����
-- + �ε��� ����
--	- �˻� �ӵ��� ���ȴ�
--	- ���̺��� ��ü��ȸ�� �� �߻��� �� �ִ� �ý��� ���� ���ϸ� �ٿ��ش�
-- + �ε��� ����
--	- �ε��� ��ü�� �����ϴµ� �ð��� �ʿ��ϴ�
--	- �ε����� ���� ������ ������ �ʿ��ϴ�
--	- �˻� ��������� ������ �߰�, ����, �������� ������ ���� �ʴ´�
--	- ���̺� �߰�, ����, ������ �߻��ϸ� �ε����� �ٽ� �����ؾ��Ѵ�
-- + �ε��� ������ �ʿ��� ���
--	- �����Ͱ� ���� �� ( �� 1000�� �̻� )
--	- WHERE �������� �������� Ư�� �÷��� ���� ���� ��
--	- JOIN ���������� Ư�� �÷��� ���� ���� ��
-- + �ε��� ������ ���ʿ��� ���
--	- �����Ͱ� ���� �� (��õ�� �̸�)
--	- SELECT ���� INSERT, UPDATE, DELETE�� ����� ���
--	- ��ȸ ����� ��ü �� ���� ���κ��� �����ϴ� ���(�� 15%)
-- + �ε��� ���� �� ���� ����
--	- NON-UNIQUE INDEX : �ߺ��� ����ϴ� �ε���
--		CREATE INDEX �ε����� ON ���̺��( �÷��� );
--	- UNIQUE INDEX : �ߺ��� ������� �ʴ� �ε���
--		CREATE UNIQUE INDEX �ε����� ON ���̺��( �÷��� );
--	- COMPOSITE INDEX : ���� �÷� �ε���
--		CREATE INDEX �ε����� ON ���̺��( �÷�1, �÷�2, ... );
-- + �ε��� �����
--	ALTER INDEX �ε����� REBUILD;
-- + �ε��� ���� ����
--	DROP INDEX �ε�����;
-- + �ε��� ��ȸ
--	SELECT * FROM USER_INDEXES; -- �ε��� ��ȸ
--	SELECT * FROM USER_IND_COLUMNS; -- �ε��� �÷���ȸ
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

-- UNIQUE INDEX ����
CREATE UNIQUE INDEX idx_salgrade
ON salgrade( grade );

-- UNIQUE ���������� �ɷ��־� �ߺ��� ���� �Ұ�
INSERT INTO salgrade VALUES( 5 , 7777 , 8888 );

-- COMPOSITE INDEX
SELECT * FROM user_indexes
WHERE table_name = upper('emp');

CREATE UNIQUE INDEX idx_emp
ON emp( empno, deptno );

SELECT * FROM user_ind_columns
WHERE table_name = upper('emp')
ORDER BY index_name;