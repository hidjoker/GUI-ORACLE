

SELECT * FROM emp;
SELECT * FROM dept;

SELECT * FROM emp, dept; -- CROSS JOIN

SELECT * FROM emp NATURAL JOIN dept;

desc emp;

INSERT INTO emp ( empno, deptno )
VALUES( 9999, 50 ); -- FK �������� ����, dept.deptno�� 50�� ����






-- EQUI JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- ��������
    AND empno > 7500 -- ��ȸ����
ORDER BY deptno, empno;


-- INNER JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno --��������
WHERE empno > 7500; --��ȸ����



-- NON-EQUI JOIN
SELECT * FROM emp;
SELECT * FROM salgrade;

SELECT ename, sal, grade
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal AND S.hisal;

-- ANSI ǥ�ع������� ����
-- ( JOIN Ű���� ��� )
SELECT ename, sal, grade
FROM emp E
JOIN salgrade S
    ON E.sal BETWEEN S.losal AND S.hisal;
