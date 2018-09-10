-- + ������
--	- ���ӵ� ���ڸ� �������ִ� ��ü
--	- ���̺� ���� ������ ���ڸ� �ڵ����� ������ �� ���
--	- ���� �����ϴ� ����Ű ������ �����
--	(PRIMARY KEY)

-- + ������ ���� ����
--	- CREATE SEQUENCE ��������;
--	- CREATE SEQUENCE ��������
--		[START WITH n ] -- ���۰�
--		[INCREMENT BY n] -- ������
--		[MAXVALUE n | NOMAXVALUE] -- �ִ밪
--		[MINVALUE n | NOMINVALUE] -- �ּҰ�
--		[CYCLE | NOCYCLE] -- ��ȯ���� ����
--		[CACHE n | NOCACHE] --�̸� ������ ���� ����

-- SEQUENCE

CREATE SEQUENCE seq_emp;

-- ��������.currval -- ���� ��������
-- ��������.nextval -- ���� ��������

SELECT seq_emp.currval FROM dual;
SELECT seq_emp.nextval FROM dual;

INSERT INTO emp(empno, ename)
VALUES(seq_emp.nextval, 'AAAA');

SELECT * FROM emp
WHERE empno < 1000;

--+ ������ ���� ����
--	- ALTER SEQUENCE ��������
--		[INCREMENT BY n] -- ������
--		[MAXVALUE n | NOMAXVALUE] -- �ִ밪
--		[MINVALUE n | NOMINVALUE] -- �ּҰ�
--		[CYCLE | NOCYCLE] -- ��ȯ���� ����
--		[CACHE n | NOCACHE] --�̸� ������ ���� ����

-- + ������ ��� ����
--	- ��������.currval -- ���� ������ ��
--	- ��������.nextval -- ���� ������ ��
--	ex)
--		CREATE SEQUENCE seq_emp;
--		INSERT INTO emp (empno, ename)
--      VALUES (seq_emp.nextval, #{ename});

-- ������ ����
ALTER SEQUENCE seq_emp
MINVALUE 2001; -- currval �������� < MINVALUE �̹Ƿ� ����

-- + ������ ����
--	- DROP SEQUENCE ��������;

-- ������ ����
DROP SEQUENCE seq_emp;

-- ����� �������� �ٽ� ����
CREATE SEQUENCE seq_emp
START WITH 2001
MINVALUE 2001
MAXVALUE 3000
INCREMENT BY 100;

-- �������� CYCLE �ɼ� ����
ALTER SEQUENCE seq_emp
CACHE 5 -- CYCLE�� ���� �������� CACHE���� �۾ƾ���
CYCLE;

SELECT seq_emp.nextval FROM dual;

-- + ������ Ȯ�� �ڷ����
--	- SELECT * FROM USER_SEQUENCES;

-- ������ �ڷ����
SELECT * FROM user_sequences
WHERE sequence_name = upper('seq_emp');

-- ù NEXTVAL : 40, INCREMENT : 10
-- �� ������ seq_test �� ����� Ȯ��
    -- user_sequences�� Ȯ��
    -- nextval�� Ȯ�� -> 40, 50, 60 �������� Ȯ��

CREATE SEQUENCE seq_test
START WITH 40
INCREMENT BY 10;

SELECT * FROM user_sequences
WHERE sequence_name = upper('seq_test');

-- nextval Ȯ��
SELECT seq_test.nextval FROM dual;

-- + ��, View
--	- ������ ������ �����ϰ� ����Ϸ��� ������ ��ü
--	- ������ �� �ִ� �������� ������ ����ϱ� ���� ����ϱ⵵ �Ѵ�
--	(��ȸ�Ǵ� �÷��� ������ �� ����)
--	- SELECT ������ VIEW�� �����ϰ� ����
--	- VIEW�� ���̺� ó�� ��ȸ�ϸ�
--	- VIEW�� ����Ǿ��ִ� SELECT ������ �����ϰ� ����� �Ѱ���
--	- �̸��� ������ TABLE���� VIEW���� ���� �� �� ����
--	- �������̺� �����ϴ� ��ü�̴�
--	- �並 ���ؼ� ���̺� ��ȸ, ����, ����, ���� ����
--		(���� ���̺� �ڷᵵ �ݿ���)

 + �� ���� ����
--	CREATE [OR REPLACE] VIEW ���̸�
--	AS ��������
--	[ WITH CHECK OPTION [CONSTRANINT ��������]]
--	[ WITH READ ONLY]
--	CREATE : �� ����
--	CREATE OR REPLACE : �� ����, �ߺ��� ���̸��� ������ ������ �����Ͽ� �ݿ�
--	WITH CHECK OPTION : �������ǿ� �´� �����͸� ����, ��������
--	WITH READ ONLY : SELECT�� ����

-- �� ����
CREATE OR REPLACE VIEW test_view
AS (
    SELECT * FROM emp WHERE empno < 2000 
);

GRANT CREATE VIEW TO scott; -- (DBA)

SELECT * FROM test_view;

-- �並 ���� ����
INSERT INTO test_view(empno, ename)
VALUES (500,'BBB');

INSERT INTO test_view(empno, ename)
VALUES (8000,'CCC');

SELECT * FROM test_view;
SELECT * FROM emp 
WHERE empno IN(500,8000);

-- �� Ȯ�� (�ڷ����)
SELECT * FROM user_views;

CREATE OR REPLACE VIEW test_view
AS (
    SELECT * FROM emp WHERE empno < 2000 
)WITH CHECK OPTION;

INSERT INTO test_view(empno, ename)
VALUES (7000, 'DDD');

INSERT INTO test_view(empno, ename)
VALUES (600, 'EEE');

-- �ζ��� ��
SELECT * FROM(
    SELECT * FROM emp
    WHERE empno < 2000
)E;
-- ��
SELECT * FROM TEST_VIEW;

SELECT * FROM tabs;