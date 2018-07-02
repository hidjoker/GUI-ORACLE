SELECT * FROM emp; --��� ���̺�
SELECT * FROM dept; --�μ� ���̺�
SELECT * FROM bonus; --���ʽ� ���̺�
SELECT * FROM salgrade; --�޿����̺� ���̺�

SELECT * FROM tabs; --��ü ���̺� ��ȸ
SELECT table_name FROM tabs; --��ü ���̺�� ��ȸ

SELECT * FROM emp;

desc emp; -- emp ���̺� ��Ű�� ����

-- INSERT���� �׽�Ʈ
--�����͸� ���̺� ������ �� ���
-- ctrl + / : ���� �ּ�
desc dept;
INSERT INTO dept VALUES (90, '', '');
INSERT INTO dept 
VALUES (91, null, null);
SELECT * FROM dept;

-- UPDATE TEST
UPDATE dept
SET loc = 'SEOUL';

--DELETE TEST
DELETE dept
WHERE deptno = 40; --�μ���ȣ�� 40�� �� ����
SELECT * FROM dept;

SELECT * FROM emp;
DELETE emp; --��ü����

--commit; --Ŀ��, ����� ������ �����ݿ��ϱ�(�ǵ��� �� ����)
--rollback; --�ѹ�, ����� ������ �ݿ����� �ʱ�(�ǵ�����)



-- DDL �⺻ �׽�Ʈ
CREATE TABLE test ( -- test���̺� ����
    test1 NUMBER, -- ���ڵ����� �÷�
    test2 VARCHAR2(10) -- ���ڿ������� �÷�
);
desc test; -- ���̺� ����(�÷�,�ο���,������Ÿ��) Ȯ��

SELECT * FROM tabs; --���̺�Ű�� �� �����ͻ��� tabs
SELECT * FROM tab; --���̺�Ű�� ���� �����ͻ��� tab

DROP TABLE test; -- ���̺� ����

-- recyclebin : ����Ŭ���� �����ϴ� ������
SHOW recyclebin; -- ������ Ȯ��
FLASHBACK TABLE test TO BEFORE DROP; --�����뿡�� ����
SELECT * FROM tabs;
PURGE recyclebin; -- ������ ����

DROP TABLE test PURGE; -- �����뿡 �����ʰ� ����
SELECT * FROM tab;





-- SELECT ����
SELECT * FROM emp; -- ��ü��ȸ
SELECT empno, ename FROM emp; -- empno,ename�÷��� ��ȸ

SELECT
    empno AS ���,
    ename AS ����̸�
FROM emp;






-- WHERE ��

-- ���迬����
SELECT empno, ename, deptno
FROM emp
--WHERE deptno=10; --�μ���ȣ�� 10���� ����
--WHERE deptno>20; --�μ���ȣ�� 20������ ū ����
WHERE deptno<>20; --�μ���ȣ�� 20�� �ƴ� ����


-- �� ������
-- �μ���ȣ�� 30�̰�, job�� 'SALESMAN'�� ��� ��ȸ
SELECT empno, ename, deptno
FROM emp
WHERE deptno=30
    AND job='SALESMAN';
    
-- �μ���ȣ�� 30�̰� ������ ������ �ƴ� ���
SELECT empno, ename, deptno
FROM emp
WHERE deptno=30
    AND NOT(job='SALESMAN');
    
-- �μ���ȣ�� 30�� �ƴϰ� ������ ������ �ƴ� ���
SELECT empno, ename, deptno, job
FROM emp
WHERE NOT(deptno=30
    OR job='SALESMAN');
-- WHERE deptno!=30 AND job!='SALESMAN'   




-- ��Ÿ ������

-- BETWEEN a AND b
SELECT empno, ename FROM emp
WHERE empno BETWEEN 7700 AND 7900;
--WHERE empno>=7700 AND empno<=7900;

-- NOT BETWEEN a AND b
SELECT empno, ename FROM emp
WHERE empno NOT BETWEEN 7700 AND 7900;


-- IN(list)
SELECT empno, ename FROM emp
WHERE empno IN ( 7369, 7521, 7654, 7777, 8888 );
--WHERE empno=7369
--    OR empno=7521
--    OR empno=7654
--    OR empno=7777
--    OR empno=8888;

SELECT empno, ename FROM emp
WHERE empno NOT IN ( 7369, 7521, 7654, 7777, 8888 );



-- LIKE
SELECT empno, ename FROM emp
--WHERE ename LIKE '%R%'; --�̸��� R�� �����ϴ� ��� ���
--WHERE ename LIKE '_A%'; --�̸��� �ι�°�� A�� ���
--WHERE ename LIKE '%RD'; --�̸��� �������� RD�� ���
WHERE ename NOT LIKE '%R%'; --�̸��� R�� ���� ���

SELECT empno, ename FROM emp
--WHERE ename LIKE 'KING'; --�ϸ� �ȵ�
WHERE ename = 'KING';



-- IS NULL
SELECT empno, ename FROM emp
--WHERE mgr IS NULL;
--WHERE mgr = null; --����ȵ�
WHERE mgr IS NOT NULL;



-- WHERE ����
-- SELECT empno, ename, deptno FROM emp
-- WHERE
-- ������ �̿��Ͽ� �ذ��� ��

 -- �μ���ȣ�� 30�̰� ������ ������ ��� ��ȸ
SELECT empno, ename, deptno FROM emp
WHERE deptno = 30 AND job = 'SALESMAN';

 -- �μ���ȣ�� 30�̰� ������ ������ �ƴ� ��� ��ȸ
SELECT empno, ename, deptno FROM emp
WHERE deptno = 30 AND job <> 'SALESMAN';

 -- �μ���ȣ�� 30�� �ƴϰ� ������ ������ �ƴ� ��� ��ȸ
SELECT empno, ename, deptno FROM emp
WHERE deptno <> 30 AND job <> 'SALESMAN';

 -- �����ȣ�� 7782���� 7900 ������ ��� ��ȸ
SELECT empno, ename, deptno FROM emp
WHERE empno BETWEEN 7782 AND 7900;

 -- ������� 'A'���� 'C'�� �����ϴ� ��� ��ȸ
SELECT empno, ename, deptno FROM emp
WHERE ename>='A' AND ename<'D';
--WHERE ename BETWEEN 'A' AND 'D';
--WHERE ename LIKE 'A%' OR ename LIKE 'B%' OR ename LIKE 'C%';

 -- �μ���ȣ�� 10 �Ǵ� 30�� ��� ��ȸ (IN ���)
SELECT empno, ename, deptno FROM emp
WHERE deptno IN (10,30);






-- ORDER BY ��
SELECT * FROM emp
--ORDER BY empno; --��� ��������
--ORDER BY ename; -- �̸� ��������
ORDER BY ename DESC; -- �̸� ��������


-- deptno�������� ���� �� �׷� ������ empno�� ����
SELECT * FROM emp
ORDER BY deptno DESC, empno ASC;

-- NULL �����͸� �ڷ� ������
SELECT * FROM emp
ORDER BY comm DESC NULLS LAST;

-- NULL �����͸� ������ ������
SELECT * FROM emp
ORDER BY comm NULLS FIRST;


-- NULLS ������ ������ ���ı���(�÷�)�� ����ȴ�
SELECT * FROM emp
ORDER BY comm ASC NULLS FIRST, sal DESC;


SELECT * FROM emp
WHERE deptno = 10
ORDER BY sal DESC;

SELECT * FROM emp;

SELECT empno, comm FROM emp
WHERE comm>=0;