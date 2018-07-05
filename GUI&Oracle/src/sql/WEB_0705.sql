
-- + SELF JOIN
--	- �ϳ��� ���̺�� �ڽ����̺�� �����ϴ� ��
--	- FROM������ alias�� �ٸ��� �����Ͽ� �� ���� ���̺��� ��ó�� �νĽ��� �����Ѵ�
--	- �÷��� �ڱⰡ ���Ե� ���̺��� �÷��� �����ϴ� ��Ȳ�� ���

SELECT * FROM emp;
-- SELF JOIN
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E ,emp M
WHERE E.mgr = M.empno
ORDER BY empno;

SELECT ���.empno, ���.ename, ���.mgr, �Ŵ���.ename AS "MGRNAME"
FROM emp ��� 
INNER JOIN emp �Ŵ���
    ON ���.mgr = �Ŵ���.empno
ORDER BY empno;

-- + OUTER JOIN, �ܺ� ����
--	- ���ο� �����ϴ� �÷��� NULL�� �����ϰ� ���� �� ���
--	- ���� �÷� �� �� ���� ���� ������ ���� ���� ��
--	- (+) �����ڸ� �����Ͱ� ������(NULL) ���̺� ���� �÷����ǿ� �ٿ��� �����Ѵ�
--	- �������ǽ��� ���ʿ��� ����� �� �ִ�
--	- ANSI ��������
--		LEFT OUTER JOIN
--		RIGHT OUTER JOIN
--		FULL OUTER JOIN
--	�� �ִ�
--	- ���������� ���ʿ� (+)�� ������ RIGHT OUTER JOIN���� ��ȯ����
--	- ���������� �����ʿ� (+)�� ������ LEFT OUTER JOIN���� ��ȯ����
--	- FULL OUTER JOIN�� ANSI���� ����, �������̺� ��� NULL�� ��쿡 ����� �� �ִ�
--	- ����Ŭ �������� FULL OUTER JOIN�� �����ϴ� ������ ����

-- OUTER JOIN
SELECT DISTINCT deptno 
FROM emp 
ORDER BY deptno;

SELECT * FROM dept;

-- RIGHT OUTER JOIN
SELECT empno, ename, d.deptno, dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
ORDER BY deptno, empno;

SELECT empno, ename, d.deptno, dname
FROM emp e
RIGHT OUTER JOIN dept d
    ON e.deptno = d.deptno
ORDER BY deptno, empno;

-- LEFT OUTER JOIN
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E ,emp M
WHERE E.mgr = M.empno(+)
ORDER BY empno;

SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E
LEFT OUTER JOIN emp M
    ON E.mgr = M.empno
ORDER BY empno;

-- FULL OUTER JOIN -- ANSI ����
CREATE TABLE test1(no NUMBER);
CREATE TABLE test2(no NUMBER);
INSERT INTO test1 VALUES(10);
INSERT INTO test1 VALUES(20);
INSERT INTO test1 VALUES(30);

INSERT INTO test2 VALUES(10);
INSERT INTO test2 VALUES(20);
INSERT INTO test2 VALUES(40);

SELECT * FROM test1;
SELECT * FROM test2;
DELETE test1; -- ���̺�1 �� �����
DELETE test2; -- ���̺�2 �� �����

SELECT *
FROM test1
FULL OUTER JOIN test2
    ON test1.no = test2.no
ORDER BY test1.no;
	
-- + CROSS JOIN
--	- ī�׽þ� ���� ���� �� ����Ѵ�
--	- �׽�Ʈ�� dummy ���̺��� ���� �� ����� �� �ִ�
--	** ī�׽þ� ��, Cartesian Product
--		�� ���� ���̺��� ��ȸ������ ��� ����� ���� ����ϴ� ��
--		��� �÷�
--		��� ���� ����
--		ex) 4���� �÷��� 3���� ���� ������ TABLE_1
--			7���� �÷��� 5���� ���� ������ TABLE_2
--			���� �� ���̺�� ī�׽þ� ���� �����
--			11���� �÷�, 15���� ������ ��� ������ �����

-- CROSS JOIN
SELECT * FROM salgrade; -- 5row, 3col
SELECT * FROM dept; -- 4row, 3col

SELECT * FROM dept, salgrade;
SELECT * FROM salgrade CROSS JOIN dept;

-- + NATURAL JOIN
--	- WHERE ���������� ���� EQUI JOIN�� �����Ѵ�
--	- ���������� �Ǵ� �÷��� �ڵ����� �����Ѵ�
--	- ���������� �����ϴ� ������� �ִ�
--		-> JOIN~USING(col) ���� �ذ� ����

-- NATURAL JOIN
SELECT empno, ename, deptno, dname
FROM emp
NATURAL JOIN dept
ORDER BY deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp
INNER JOIN dept
    ON emp.deptno = dept.deptno
ORDER BY deptno;

-- INNER JOIN�� �̿��� NATURAL JOIN
SELECT *
FROM emp
JOIN dept
    USING(deptno)
ORDER BY deptno;

-- + ��������, subquery
--	- SQL ���忡 ���Ե� �� �ٸ� SQL��
--	- ���������� ��������(��������)�� ��Ī�Ѵ�
--	- ���������� ( )�� ��� ǥ���Ѵ�

-- + ���������� ���� : ���� ��ġ�� ����
--	1. ��Į�� �������� : SELECT ���� �÷����� ���
--	2. �������� : WHERE ���� �������� ���
--	3. �ζ��� �� : FROM ���� ��ȸ���̺�� ���

-- + ���������� ���� : ������������� �� ���� ����
--	1. ���� �� ���� ����
--		- �������� ����� �ϳ��� ������ ��ȸ�Ǵ� ��
--		= ,<, >, <=, <> ,>=
--	2. ���� �� ���� ����
--		- �������� ����� ���� ���� ������ ��ȸ�Ǵ� ��
--		- ���� �� ������������ ����ϴ� ������ ���Ұ�
--		- ���� ������
--		IN, NOT, ANY(=SOME), ALL, EXISTS
--	3. ���� �� ���� ���� -> WHERE������ �ַ� ���
--		- �������� ����� �÷��� ���� ���� ��
--		- WHERE ���� �÷��� ( , , , )�� ��� ǥ���Ѵ�
--		ex)
--				WHERE(empno, ename) = (SELECT empno, ename ... )


-- ��������
SELECT *
FROM dept
WHERE deptno = 10;

SELECT deptno FROM emp WHERE ename=UPPER('king');

SELECT *
FROM dept
WHERE deptno = (
    SELECT deptno 
    FROM emp 
    WHERE ename=UPPER('king')
);

SELECT d.*
FROM dept d, emp e
WHERE d.deptno = e.deptno -- ��������
AND ename=UPPER('king'); -- ��ȸ����

-- ��ü ��� �ӱݺ��� ���� �޴� �����
SELECT empno, ename, sal
FROM emp
WHERE sal > (
    SELECT AVG(sal)
    FROM emp
);

-- ���� �ֱٿ� �Ի��� ���(����)
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate = (
    SELECT MAX(hiredate) FROM emp
);

-- ��ü ��� �ӱݺ��� �μ� �� ����ӱ��� ���� �μ�
-- COLUMN : deptno, avg_sal - �μ���ȣ, �μ�������ӱ�

-- HAVING ���� �� ��������
SELECT deptno, ROUND(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal) >(
    SELECT avg(sal) FROM emp
) 
ORDER BY deptno;

-- �ζ��� ��
SELECT E.deptno, dept.dname, avg_sal
FROM(
    SELECT deptno, ROUND(avg(sal),2) AS avg_sal
    FROM emp
    GROUP BY deptno
    HAVING avg(sal) > (SELECT avg(sal) FROM emp)
)E
INNER JOIN dept
    ON E.deptno = dept.deptno
ORDER BY deptno;

-- ��Į�� ��������
SELECT
    deptno
    ,(SELECT dname FROM dept
        WHERE emp.deptno = dept.deptno) dname
    ,ROUND(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal) > (
    SELECT avg(sal) FROM emp)
ORDER BY deptno;


-- ��Į�� ��������
SELECT
    empno,
    ename,
    deptno,
    (SELECT dname FROM dept D WHERE E.deptno = D.deptno) AS dname,
    (SELECT loc FROM dept D WHERE E.deptno = D.deptno) AS loc
FROM emp E
ORDER BY deptno, empno;

-- ���������� ORDER BY���� ����ϱ�
UPDATE dept
SET dname='ZACCOUNT'
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
FROM emp e
ORDER BY(
    SELECT dname FROM dept d
    WHERE e.deptno = d.deptno
);
SELECT * FROM dept;

-- �μ��� �ο� ���ϱ�
-- 40�� �μ��� 0���̶�� ���
-- �������� Ȱ��, ���� Ȱ��
-- deptno, dname, cnt_employee


-- ��Į�� ��������
SELECT D.deptno, D.dname
    ,(SELECT Count(E.empno) 
        FROM emp E 
        WHERE E.deptno = D.deptno) "COUNT"
FROM dept D
ORDER BY D.deptno;
    
-- ���� 
SELECT 
    D.deptno, 
    COUNT(E.empno) cnt_employee
FROM emp E
RIGHT OUTER JOIN dept D
    ON E.deptno = D.deptno
GROUP BY D.deptno
ORDER BY deptno;

-- �ζ��� ��
SELECT * FROM(
    SELECT empno, ename FROM emp
    ORDER BY empno
)
ORDER BY empno;

-- ROWNUM
SELECT rownum, emp.* FROM emp;

SELECT rownum, e.* FROM (
    SELECT * FROM emp
)e;

-- top 3
SELECT rownum,e.* FROM (
    SELECT * FROM emp
    ORDER BY sal
)e
WHERE rownum BETWEEN 1 AND 3;

-- comm �� ���� ���� �޴� top2�� ��ȸ
-- COLUMNS : comm_top, emp.*


SELECT rownum comm_top, e.* FROM(
    SELECT * FROM emp
    ORDER BY comm DESC NULLS LAST
)e
WHERE rownum BETWEEN 1 AND 2;

-- MSSQL���� ���ϴ� ����
--SELECT top 2 comm
--FROM emp
--ORDER comm DESC;

-- ���� �� ��������
SELECT dname, empno, ename, sal
FROM emp
JOIN dept USING(deptno)
WHERE (deptno, sal) = (
    SELECT deptno, MAX(sal)
    FROM emp
    WHERE deptno = 10
    GROUP BY deptno
);
