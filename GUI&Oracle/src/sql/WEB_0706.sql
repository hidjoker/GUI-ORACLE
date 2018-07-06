-- ���� �� ��������
-- + ���� �� ���� ����
--	- ���� ������ ����� �� ��(2��) �̻� ��µǴ� ��������
--	- ���� �� ���� �����ڸ� ����� �� �ִ�
--	- ���� �� ������ ��� �Ұ�( = != < > ��� )
--	- IN
--		������ ������������ ����ϴ� IN�� ����
--		�����(=) �� ���� ���
--		��� �� �߿��� �ϳ��� �����ϸ� ��ȸ
--	- ANY(=SOME) : �����񱳸� ���� ���
--		���÷��� ���������� ��� �� � ���̶� ���ǿ�
--		�����ϸ� ��ȸ��(��� ��ȯ) => OR
--		col = ANY (A, B, C) : A,B,C ��� ��ȸ
--		col < ANY (A, B, C) : �ִ밪���� ���� ��� ��� ��ȸ
--		col > ANY (A, B, C) : �ּҰ����� ū ��� ��� ��ȸ
--	- ALL : �����񱳸� ���� ���
--			���÷��� ���������� ����� ��ΰ� ���ǿ�
--			�����ϸ� ��ȸ��(��� ��ȯ)
--		col = ALL(A, B, C) : �� ��ο� ���� �� ��ȸ(�ǹ̰� ������, ��ȸ�ȵ�)
--		col < ALL(A, B, C) : �ּҰ����� ���� ����� ��ȸ
--		col > ALL(A, B, C) : �ִ밪���� ū ����� ��ȸ
--	- EXISTS : ���������� ����� ���������� �����ϸ� ��ȸ

-- SALESMAN���� �޿�
SELECT DISTINCT sal FROM emp
WHERE job = 'SALESMAN'
ORDER BY sal;

-- SALESMAN ��� �޿��� ���� ���
SELECT * FROM emp
WHERE sal IN (1250, 1500, 1600);

-- SALESMAN ���� �޿��� ���� ���̸� �޴� ��� ����
-- IN
SELECT * FROM emp
WHERE sal IN (
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;

-- ANY
SELECT * FROM emp
WHERE sal = ANY ( -- 1250, 1500, 1600
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal < ANY ( -- 1250, 1500, 1600
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal > ANY ( -- 1250, 1500, 1600
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;

-- ALL
SELECT * FROM emp
WHERE sal = ALL ( -- 2450, 2850, 2975
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal < ALL ( -- 2450, 2850, 2975
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal > ALL ( -- 2450, 2850, 2975
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;

-- EXISTS
SELECT DISTINCT mgr FROM emp
ORDER BY mgr;

SELECT * FROM emp e -- 7566, 7698, 7782, 7839, 7902
WHERE EXISTS (
    SELECT empno
    FROM emp
    WHERE e.empno = mgr);
    
SELECT deptno, dname, loc
FROM dept d
WHERE EXISTS(
    SELECT * FROM emp e
    WHERE d.deptno = e.deptno)
ORDER BY deptno;

SELECT * FROM dept
WHERE deptno IN(
    SELECT DISTINCT deptno FROM emp)
ORDER BY deptno;

-- + ���տ�����
--	- �� �� �̻��� ���� ����� �ϳ��� ��ġ�� ������
--	- �÷��� ������ �̸��� ���ƾ� �Ѵ�
--	- UNION : ������
--	- UNION ALL : ������, �ߺ����
--	- INTERSECT : ������
--	- MINUS : ������

-- UNION
SELECT empno, ename, job FROM emp
WHERE job = 'SALESMAN'
UNION
SELECT empno, ename, job FROM emp
WHERE job = 'MANAGER'
ORDER BY job, empno;

-- UNION
SELECT empno, ename, sal FROM emp
WHERE sal<1000
UNION
SELECT empno, ename, sal FROM emp
WHERE sal<2000
ORDER BY sal;

-- UNION ALL
SELECT empno, ename, sal FROM emp
WHERE sal<1000
UNION ALL
SELECT empno, ename, sal FROM emp
WHERE sal<2000
ORDER BY sal;

-- INTERSECT
SELECT empno, ename, sal FROM emp
WHERE sal<1000
INTERSECT
SELECT empno, ename, sal FROM emp
WHERE sal<2000
ORDER BY sal;

-- MINUS
SELECT empno, ename, sal FROM emp
WHERE sal<2000
MINUS
SELECT empno, ename, sal FROM emp
WHERE sal<1000
ORDER BY sal;
