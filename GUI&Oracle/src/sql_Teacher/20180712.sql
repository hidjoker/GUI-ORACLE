

-- SEQUENCE

CREATE SEQUENCE seq_emp;

-- ��������.currval --���� ��������
-- ��������.nextval --���� ��������

SELECT seq_emp.currval FROM dual;
SELECT seq_emp.nextval FROM dual;

INSERT INTO emp (empno, ename)
VALUES ( seq_emp.nextval, 'AAAA' );

SELECT * FROM emp
WHERE empno < 1000;


-- ������ ����
ALTER SEQUENCE seq_emp
MINVALUE 2001;

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
CACHE 5 --CYCLE�� ���� �������� CACHE ���� �۾ƾ���
CYCLE;

SELECT seq_emp.nextval FROM dual;

-- ������ �ڷ����
SELECT * FROM user_sequences
WHERE sequence_name = upper('seq_emp');



--  ù NEXTVAL : 40, INCREMENT : 10
-- �� ������ seq_test �� ����� Ȯ��
  -- user_sequences�� Ȯ��
  -- nextval �� Ȯ�� -> 40, 50, 60 �������� Ȯ��

-- ������ ����
CREATE SEQUENCE seq_test
START WITH 40
INCREMENT BY 10;

-- ������ Ȯ��
SELECT * FROM user_sequences
WHERE sequence_name = upper('seq_test');

-- nextval Ȯ��
SELECT seq_test.nextval FROM dual;




-- �� ����
CREATE OR REPLACE VIEW test_view -- (SCOTT)
AS (
    SELECT * FROM emp WHERE empno < 2000 
);

GRANT CREATE VIEW   -- ( DBA )
TO scott;


-- �ý��� ���� ��ȸ
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN (
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE GRANTEE = 'SCOTT' )
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee='SCOTT';


SELECT * FROM test_view;


-- �並 ���� ����
INSERT INTO test_view (empno, ename)
VALUES ( 500, 'BBB' );

INSERT INTO test_view (empno, ename)
VALUES ( 8000, 'CCC' );

SELECT * FROM test_view;

SELECT * FROM emp WHERE empno IN (500, 8000);

-- �� Ȯ�� (�ڷ����)
SELECT * FROM user_views;

TEST_VIEW

"(
    SELECT "EMPNO","ENAME","JOB","MGR",
        "HIREDATE","SAL","COMM","DEPTNO"
    FROM emp WHERE empno < 2000 
)"



CREATE OR REPLACE VIEW test_view -- (SCOTT)
AS ( SELECT * FROM emp WHERE empno < 2000 )
WITH CHECK OPTION;

INSERT INTO test_view (empno, ename)
VALUES ( 7000, 'DDD');

INSERT INTO test_view (empno, ename)
VALUES ( 600, 'EEE');


-- �ζ��� ��
SELECT * FROM (
    SELECT * FROM emp
    WHERE empno < 2000
) E;

-- ��
SELECT * FROM TEST_VIEW;
