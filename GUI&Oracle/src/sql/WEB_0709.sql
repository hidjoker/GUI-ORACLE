-- + DML, Data Manipulation Language, ������ ���۾�
--	- INSERT
--	���̺� ���ο� ���� �߰��� �� ����ϴ� SQL
--	[����]
--	INSERT INTO table_name(col1, col2, ...)
--	VALUES(data1 , data2, ...)

--	INSERT INTO table_name
--	VALUES(data1, data2, ...)
--		-> COLUMN_ID �� �°� ������� �����͸� �����Ѵ�
--		-> ��� �÷��� �����͸� �־�� �Ѵ�

--	INSERT INTO table_name(col1, col2, ...)
--	SELECT ��

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

-- 2���� ������ �����Ͻÿ�
-- ��� 1011
-- �̸� EDWARD
-- ���� MANAGER

-- �纯 1015
-- �̸� richard
-- �޿� 2000

INSERT INTO emp(empno, ename, job)
VALUES(1011, 'EDWARD', 'MANAGER');

INSERT INTO emp(empno, ename, sal)
VALUES(1015, 'richard', 2000);

--commit; -- �����ݿ�
--rollback; -- �ǵ�����

-- ���̺� ����
CREATE TABLE emp_research
AS
SELECT * FROM emp;

SELECT * FROM emp_research;

-- ���̺� ����
DROP TABLE emp_research;

CREATE TABLE emp_research
AS
SELECT * FROM emp WHERE deptno=20;

CREATE TABLE emp_research
AS
SELECT * FROM emp WHERE 1=0;

SELECT * FROM emp_research;

desc emp_research;

-- 20�� �μ��� ��� �����͸� INSERT
INSERT INTO emp_research
SELECT * FROM emp WHERE deptno=20;

-- 30�� �μ��� empno, ename �����͸� INSERT
INSERT INTO emp_research(empno,ename)
SELECT empno, ename FROM emp WHERE deptno=30;
SELECT * FROM emp_research;
-- ������ ����
DELETE FROM emp_research; --��� �� ����

--	- INSERT ALL
--		[����]
--		INSERT ALL
--		WHEN ������
--			THEN INTO table_name(columns)
--			VALUES(datalist)
--		[WHEN�� �ݺ�]
--		SELECT�� :
--		** THEN INTO���� �÷���, VALUES ���� ����
--		** ���� �ÿ��� ��ȸ�� ��� �÷��� �ش��ϴ� ���� ����
--		SELECT ���� ����� ���ǿ� ���� INSERT�ϴ� ����
--		�������� INSERT������ �ϳ��� ��ĥ �� �ִ�

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
-- �Ի����� '1981/06/01' ������ ���
-- emp_sal
-- �޿��� 2000���� ���� ���
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
--		���̺��� ���� �����ϴ� ����
--		[����]
--		UPDATE table_name
--		SET col1 = ���氪1, co2 = ���氪2, ...
--		WHERE ����;

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
--		���̺��� ���� ������ �� ����ϴ� ����
--		[����]
--		DELETE [FROM] table_name
--		WHERE ����;

SELECT * FROM emp
-- DELETE emp
WHERE empno = 1002;
-- rollback;

SELECT * FROM emp_sal;
-- DELETE emp_sal;
-- commit;


--	- MERGE
--		���ǿ� ����
--		����� ������ ��� UPDATE(or DELETE)
--		����� �������� ���� ��� INSERT ��
--		�����ϵ��� �ϴ� �ϳ��� �������� �ۼ��ϴ� ��
--		[����]
--		MERGE INTO table_name
--		USING(
--				SELECT ��
--		)
--		ON(������)
--		WHEN MATCHED
--				THEN ����
--		WHEN NOT MATCHED
--				THEN ����;
--		-> INTO : ����, ����, ���� �� �̷������ ���̺�
--		-> USING : ���� �ҽ����̺� or ��������(�ζ��κ�)
--		-> ON : WHEN������ ������ ����
--		-> WHEN MATCHED : ON���� ������ ������ �����ϴ� ����� ������ ��
--		-> WHEN NOT MATCHED : ON���� ������ ���ǿ� ������ ����� ���� ��
--		** WHEN MATCHED ������ UPDATE or DELETE
--		** WHEN NOT MATCHED ������ INSERT

-- emp���̺��� 10,20�μ��� �ο� ���� -> emp_merge
-- emp���̺��� 20,30�μ��� ��ȸ
-- emp_merge�� �����ϴ� ����̸� sal 10%�λ�
-- emp_merge�� �������� ������ ���� ����

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

--+ Ʈ�����, Transaction
-- - �����͸� ó���ϴ� �Ϸ��� �۾� ����
-- - ������ �۾�����
-- - �Ϸ��� �۾����� ���� or ���и� �������� ����
-- - ���� �� -> DB ���� �ݿ� -> commit
-- - ���� �� -> Ʈ����� ���� �̹ݿ� -> rollback
-- - Ʈ����� �߻� SQL
--	INSERT, UPDATE, DELETE

--+ Ʈ������� ���� ��ȭ
-- - Ʈ������� ����
--	���� ������ SQL������ ����� ��
--	INSERT, UPDATE, DELETE
-- - Ʈ������� ����
--	COMMIT �Ǵ� ROLLBACK�� ����
--	DDL�̳� DCL ���� ����
--	��� ��� �Ǵ� �ý��� �浹
--	������� �������� DB ����
-- - Auto Commit(�ڵ� �ݿ�) ��Ȳ
--	DDL, DCL�� �Ϸ�Ǵ� ����
--	SQL*Plus�� ���� ����
-- - Auto Rollback(�ڵ� �̹ݿ�) ��Ȳ
--	�ý����� ���������� ����
--	SQL*Plus�� ������ ����

-- **Commit, Rollback
--	DCL(Data Control Language)�� ���Ե�
--	TCL(Transaction Control Language)�̶�� �θ�

--+ LOCK, ��
-- - ROW LOCK
-- - TABLE LOCK
-- - DB LOCK
-- - Ư�� ����ڿ��Ը� �ش� LOCK������ ���� ������ ����ϴ� ��

-- - LOCK ������ �������� ����ڰ� ������ �� ���� ����ڴ� LOCK������ �����Ϳ� ���� �� �� ����(SELECT�� �ȵ�)
-- - LOCK�� ������ ���� ���� ����
-- - Ʈ������� ����� �࿡ ROW LOCK�� �ɸ��� Ʈ������� �Ϸ�ǰ� LOCK�� Ǯ����

-- + DDL, Data Definition Language, ������ ���Ǿ�
-- - DB��ü(���̺�, ��, ���)�� ����, ����, ������ �� �ִ� SQL
-- - ����
--	CREATE - ����
--	ALTER   - ����
--	DROP    - ����
-- - CREATE TABLE ����
--	CREATE TABLE table_name(
--		�÷���1 �ڷ���1,
--		�÷���2 �ڷ���2,
--		...
--	);
--	CREATE TABLE table_name
--	AS
--	SELECT ����

--	�÷��� �ߺ� �Ұ�
--	�÷��� �ݵ�� �ڷ����� ��õǾ����

-- + ���̺�, TABLE, TB
--  - �����ͺ��̽��� ������ ���� �⺻����
--  - ��(row, ���ڵ�)�� ��(column, col, �÷�)���� ������
--  - �������ִ� �����ͳ��� ���������� �����Ѵ�

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

-- 38���� ��ȿ���ڸ� ���� �������� 0���� ä����
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
VALUES('���̻�����ĥ�ȱ���');

INSERT INTO type_test_02
VALUES('���̻�');

SELECT * FROM type_test_02;

CREATE TABLE type_test_03(
    data1 VARCHAR2(10 BYTE),
    data2 VARCHAR2(10 CHAR)
);
desc type_test_03;

INSERT INTO type_test_03(data1, data2)
VALUES('1234567890','1234567890');
INSERT INTO type_test_03(data1)
VALUES('���̻�');
INSERT INTO type_test_03(data2)
VALUES('���̻�����ĥ�ȱ���');
SELECT * FROM type_test_03;
