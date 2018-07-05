

SELECT * FROM emp;


-- SELF JOIN
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E, emp M
WHERE E.mgr = M.empno
ORDER BY empno;

SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E
JOIN emp M
    ON E.mgr = M.empno
ORDER BY empno;

SELECT ���.empno, ���.ename, ���.mgr, �Ŵ���.ename AS "MGRNAME"
FROM emp ���
JOIN emp �Ŵ���
    ON ���.mgr = �Ŵ���.empno
ORDER BY empno;




-- OUTER JOIN
SELECT DISTINCT deptno FROM emp ORDER BY deptno;
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
FROM emp E, emp M
WHERE E.mgr = M.empno(+)
ORDER BY empno;


SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E
LEFT OUTER JOIN emp M
    ON E.mgr = M.empno
ORDER BY empno;




SELECT empno, ename, d.deptno, dname
FROM emp e, dept d
WHERE d.deptno = e.deptno(+)
ORDER BY deptno, empno;




-- FULL OUTER JOIN --ANSI����
CREATE TABLE test1 ( no NUMBER );
CREATE TABLE test2 ( no NUMBER );
INSERT INTO test1 VALUES (10);
INSERT INTO test1 VALUES (20);
INSERT INTO test1 VALUES (30);

INSERT INTO test2 VALUES (10);
INSERT INTO test2 VALUES (20);
INSERT INTO test2 VALUES (40);

SELECT * FROM test1;
SELECT * FROM test2;
DELETE test1; -- ���̺� �� �����
DELETE test2; -- ���̺� �� �����

SELECT *
FROM test1
FULL OUTER JOIN test2
    ON test1.no = test2.no
ORDER BY test1.no;




-- CROSS JOIN
SELECT * FROM salgrade; -- 5row, 3col
SELECT * FROM dept; -- 4row, 3col

SELECT * FROM dept, salgrade;
SELECT * FROM salgrade CROSS JOIN dept;



-- NATURAL JOIN
SELECT *
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
    AND ename=UPPER('king'); --��ȸ����



-- ��ü ��� �ӱݺ��� ���� �޴� �����
SELECT empno, ename, sal
FROM emp
WHERE sal > (
    SELECT AVG(sal) FROM emp
);


-- ���� �ֱٿ� �Ի��� ��� (����)
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate = (
    SELECT MAX(hiredate) FROM emp
);


-- ��ü ��� �ӱݺ��� �μ� �� ����ӱ��� ���� �μ�
-- COLUMN : deptno, avg_sal - �μ���ȣ, �μ�������ӱ�
--  10 2916.67
--  20 2258.33
SELECT deptno, ROUND(avg(sal), 2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal) > (
    SELECT avg(sal) FROM emp )
ORDER BY deptno;



SELECT E.deptno, dept.dname, avg_sal
FROM (
    SELECT deptno, ROUND(avg(sal), 2) AS avg_sal
    FROM emp
    GROUP BY deptno
    HAVING avg(sal) > (SELECT avg(sal) FROM emp)
) E
INNER JOIN dept
    ON E.deptno = dept.deptno
ORDER BY deptno;






20	2258.33
10	2916.67

SELECT
    deptno
    ,(SELECT dname FROM dept
        WHERE emp.deptno=dept.deptno ) dname
    ,ROUND(avg(sal), 2) avg_sal
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
    ( SELECT dname FROM dept D WHERE E.deptno=D.deptno ) AS dname,
    ( SELECT loc FROM dept D WHERE E.deptno=D.deptno ) AS loc
FROM emp E
ORDER BY deptno, empno;




-- ���������� ORDER BY ���� ����ϱ�
UPDATE dept
SET dname='ZACCOUNT'
WHERE deptno=10;

SELECT empno, ename, sal, deptno
FROM emp e
ORDER BY (
    SELECT dname FROM dept d
    WHERE e.deptno = d.deptno
);
SELECT dname FROM dept ORDER BY dname;


--�μ��� �ο� ���ϱ�
--  40�� �μ��� 0���̶�� ���
--  �������� Ȱ��, ���� Ȱ��
--  deptno, dname, cnt_employee
SELECT d.deptno, dname, COUNT(e.empno) cnt_employee
FROM dept d
LEFT OUTER JOIN emp e
    ON d.deptno = e.deptno
GROUP BY d.deptno, dname
ORDER BY deptno;



SELECT d.deptno, dname, COUNT(e.empno) cnt_employee
FROM dept d, emp e
WHERE d.deptno = e.deptno(+)
GROUP BY d.deptno, dname
ORDER BY deptno;



SELECT
    deptno,
    dname,
    ( SELECT COUNT(*) FROM emp e
     WHERE e.deptno = d.deptno ) cnt_employee
FROM dept d;



-- �ζ��� ��
SELECT * FROM (
    SELECT empno, ename FROM emp
    ORDER BY empno
) E;



-- ROWNUM
SELECT rownum, emp.* FROM emp;

SELECT rownum, e.* FROM (
    SELECT * FROM emp 
) e;


SELECT rownum, emp.* FROM emp
WHERE rownum <=3
ORDER BY sal;

--  top 3
SELECT rownum rnum, e.* FROM (
    SELECT * FROM emp
    ORDER BY sal DESC
) e
WHERE rownum BETWEEN 1 AND 3;


-- comm �� ���� ���� �޴� TOP 2 �� ��ȸ
-- COLUMNS : comm_top, emp.*

SELECT * FROM (
    SELECT rownum comm_top, e.* FROM (
        SELECT * FROM emp
        ORDER BY comm DESC NULLS LAST
    ) e
    ORDER BY rownum DESC
) s
WHERE comm_top BETWEEN 1 AND 2;



-- MSSQL
SELECT top 2 comm
FROM emp
ORDER comm DESc;




-- ���� �� ��������
SELECT dname, empno, ename, sal
FROM emp
JOIN dept USING(deptno)
WHERE ( deptno, sal ) IN (
    SELECT deptno, MAX(sal) FROM emp
    GROUP BY deptno );
    