-- + TO_CHAR( datetime )
--		DATE -> VARCHAR2
-- + TO_CHAR(��¥)
-- + TO_CHAR(��¥, ��¥���� ��������)

-- + ��¥���� ��������
--  - SCC : ����
--  - YEAR, year, Year : �⵵(����)
--  - YYYY, YY, YYY, Y : �⵵(����), Y������ �⵵ǥ�� �ڸ���
--  - MM : ��(����)
--  - MONTH, MON : ��(����)

--  - Q : �б�(1~4)

--  - DD : �� ���� ��¥
--  - D : �� ���� ��¥
--  - DDD : �� ���� ��¥
--  - DAY : ����
--  - DY : ���� ����

--  - HH : ��
--  - HH12 : ��(12�ð� ǥ���)
--  - HH24 : ��(24�ð� ǥ���)

--  - MI : ��
--  - SS : ��
--  - FF : �и���
--  - AM, PM, A.M., P.M. : ���� / ����

-- ** ���̾� ����
--  - TH : ���� ����
--  - SP : ��� ����
--  - THSP, SPTH : ���� ����
--	(�տ����� ������ UPPER, LOWER, INITCAP�� ������)
--	ex) DdSP -> Four

-- ** �и��� ����
--  - FF : �и��� ǥ��
--   (timesptamp Ÿ�Կ��� ��밡��)
--   (FF2, FF3 ó�� �ڿ� ���� �ٿ��� �ڸ��� ���� ����)

-- to_char(datetime)
SELECT
--    to_char(sysdate,'YYYY/MM/DD HH24:MI:SS DAY'),
--    to_char(sysdate,'SCC'),
--    to_char(to_date('1987/01/02'),'SCC'),

--    to_char(sysdate,'YEAR'),
--    to_char(sysdate,'year'),
--    to_char(sysdate,'Year'),
--    to_char(sysdate,'YYYY'),
--    to_char(sysdate,'YY'),
--    to_char(sysdate,'YYY'),
--    to_char(sysdate,'Y'),
--    to_char(sysdate,'YYYYY'), --YYYY Y �� �ν�

--    to_char(sysdate,'MM'),
--    to_char(sysdate,'MONTH'),
--    to_char(sysdate,'MON'),

--    to_char(sysdate,'DD'), --�� ��¥
--    to_char(sysdate,'D'), --�� ��¥(�Ͽ��Ϻ��� 1)
--    to_char(sysdate,'DDD'), --�� ��¥
    
--    to_char(sysdate,'DAY'),
--    to_char(sysdate,'DY'),

--    to_char(sysdate,'Q')"sysdate",
--    to_char(to_date('2018/01/01'),'Q')"20180101",
--    to_char(to_date('2018/04/01'),'Q')"20180401",
--    to_char(to_date('2018/07/01'),'Q')"20180701",
--    to_char(to_date('2018/10/01'),'Q')"20181001",

--    to_char(sysdate,'HH'),
--    to_char(sysdate,'HH12'),
--    to_char(sysdate,'HH24')
    
--    to_char(sysdate,'MI'),
--    to_char(sysdate,'SS'),
--    to_char(sysdate,'AM'), --'A.M.'����
--    to_char(sysdate,'PM'), --'P.M.'���� ���Ĺ��ڶ� AM,PM������� ���ؽÿ� ���� ����,���� ǥ��
    
--    to_char(sysdate,'YYYY"��" MM"��" DD"��"' || 
--        ' AM HH24"��" MI"��" ss"��" DAY'), --" "�ȿ� ���ڿ��� ǥ���� �� �� ����

--    to_char(sysdate,'HH:MI YY-MM/DD'),
--    to_char(sysdate-1,'DDth'),
--    to_char(sysdate-1,'DdSP'),
--    to_char(sysdate,'DDSPTH'),

--    to_char(sysdate,'SYYYY'),
    to_char(to_date(-500,'SYYYY'),'SYYYY'),


-- + ��¥ Ÿ��
--	- DATE : �ʱ��� ǥ�������� ��¥�ð�Ÿ��
--	- TIMESTAMP : �и��ʱ��� ǥ�������� ��¥�ð�Ÿ��
--	- sysdate : ����ð�(DATE Ÿ��)
--	- systimestamp : ����ð�(TIMESTAMP Ÿ��)

    -- timestamp ������Ÿ��
    to_char(systimestamp,'MI:SS.ff2')
FROM dual;


-- + ��Ÿ ��ȯ�Լ�
--	- NVL
--		NULL���� �Ǵ��Ͽ� ���ϴ� ������ ��ȯ�ϴ� �Լ�
--		NVL(�÷�, ���ϴ� ��)
--	- NVL2
--		NULL���� �ƴ��� �Ǵ��Ͽ� ���ϴ� ������ ��ȯ�ϴ� �Լ�
--		NVL2(�÷�, NULL�� �ƴ� ��� ��, NULL�� ��� ��)
--	- NULLIF
--		�� ���� ���� ������ ���Ͽ� ������ NULL ��ȯ
--		�ٸ��� ù��° �Ű����� ��ȯ
--		NULLIF(ù������, �ι�����)
--	- DECODE
--		�񱳰��� ���� �� �����Ͽ� �񱳰���� ��ȯ�ϴ� �Լ�
--		DECODE( ���ذ�,
--					�񱳰�1, ��ȯ��1,
--					�񱳰�2, ��ȯ��2,
--					...
--					�񱳰�3, ��ȯ��3,
--					default�� );


-- NVL
SELECT
    empno, ename, NVL(comm, 0)
FROM emp;

-- NVL2
SELECT
    empno, ename, NVL2(comm, sal+comm, sal) PAY
FROM emp;

-- NULLIF
SELECT
    NULLIF(10,20),
    NULLIF(20,10),
    NULLIF(20,20)
FROM dual;

-- DECODE
SELECT
    empno,
    ename,
    deptno,
    DECODE(deptno,
        10, 'ȸ����',
        20, '������',
        30, '������',
        40, '���',
        '�μ�����')dname
FROM emp;

--+ CASE ����
-- - DECODE�Լ��� ����� ������ �ϴ� ���ǹ�
-- - CASE ~ WHEN THEN ~ END�� ����
-- - WHEN THEN�� �������� ELSE �߰� ����

-- CASE��
SELECT
    empno, ename, deptno,
    CASE deptno
        WHEN 10 THEN 'ȸ����'
        WHEN 20 THEN '������'
        WHEN 30 THEN '������'
        WHEN 40 THEN '���'
        ELSE '�μ�����'
    END dname
FROM emp;

SELECT
    empno, ename, deptno,
    CASE 
        WHEN job='PRESIDENT' THEN '����'
        WHEN deptno=10 THEN 'ȸ����'
        WHEN deptno=20 THEN '������'
        WHEN deptno=30 THEN '������'
        WHEN deptno=40 THEN '���'
        ELSE '�μ�����'
    END dname
FROM emp;


--+ �׷��Լ�
--  - ��� ���� �׷�ȭ�Ͽ� �ϳ��� ����� �����ϴ� �Լ�

--  - COUNT(n)
--		�����͸� �������ִ� ���� ���� ��ȯ
--		NULL�� ����
--		count(1) vs count(*) �̽��� ������ �Ȱ����ϱ� �ϲ��� ����

--  - SUM : �հ�
--  - AVG : ���

--  - MAX : �ְ�
--  - MIN : �ּҰ�

-- + GROUP BY ��
--	- �����͵��� ���ϴ´�� �׷�ȭ�� �� ����ϴ� ��
--	- �׷��Լ��� �Բ� ����Ѵ�
--	- GROUP BY [�÷�]

-- �׷��Լ�

-- COUNT(n)
SELECT count(*) FROM emp; --12
SELECT count(empno) FROM emp; --12
SELECT count(mgr) FROM emp; --11
SELECT count(comm) FROM emp; --4

SELECT * FROM emp;
SELECT count(*) FROM emp;

SELECT 1 FROM emp;
SELECT count(1) FROM emp;

--sum
SELECT sum(sal) tot_sal FROM emp;

--avg
SELECT avg(sal) avg_sal FROM emp;

--max
SELECT max(sal) max_sal FROM emp;
SELECT max(hiredate) last_emp FROM emp;
--min
SELECT min(sal) min_sal FROM emp;
SELECT min(hiredate) oldest_emp FROM emp;

SELECT 
    min(sal)min_sal
FROM emp
WHERE deptno=10;

-- + GROUP BY ��
--	- �����͵��� ���ϴ´�� �׷�ȭ�� �� ����ϴ� ��
--	- �׷��Լ��� �Բ� ����Ѵ�
--	- GROUP BY [�÷�]

-- GROUP BY ��
SELECT
    deptno,
    SUM(sal) dept_tot_sal
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT
    deptno, count(empno)
FROM emp
GROUP BY deptno
ORDER BY deptno;

-- ��ȸ �÷�
-- deptno, dname, cnt, tot_sal, avg_sal

-- dname -> �ѱ۷�
-- cnt, tot_sal, avg_sal -> �μ��� ���
-- avg_sal -> �Ҽ��� 2�ڸ�����


ELECT
    deptno, 
    CASE deptno
        WHEN 10 THEN 'ȸ����'
        WHEN 20 THEN '������'
        WHEN 30 THEN '������'
        WHEN 40 THEN '���'
        ELSE '�μ�����'
    END dname,
    count(*) cnt, 
    sum(sal) tot_sal, 
    round(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING AVG(sal) > 2000 --�׷��Լ��� ������(WHERE)
ORDER BY deptno;

-- + HAVING ��
--	- GROUP BY ���� �Բ� ���̴� ������
--	- �׷��Լ��� ����� ���ǽ����� ����ϰ� ���� �� ����Ѵ�
--	- WHERE���� ����� �����Ѵ�
--	(��, WHERE���� �׷��Լ��� ����� �� ����)





-- + ����, JOIN
--	- �� �� �̻��� ���̺��� �ѹ��� SELECT�ϴ� ���
--	- Primary Key(PK, ��Ű, �⺻Ű)�� Foreign Key(FK, ����Ű, �ܷ�Ű)�� �̿��Ͽ�
--  	  ���̺��� �����Ѵ�
--	** Primary Key
--		���̺��� �� ���� �����ϱ� ���� �ĺ������� ���̴� �÷�
		--- �⺻Ű ���Ἲ -----
--		�ش� ���̺��� �÷��߿��� ������ �� - UNIQUE
--		NULL�� �� ���� - NOT NULL
		-------------------------
--		ex) dept.deptno
--	** Foreign Key
--		�ٸ� ���̺��� �÷� �����ϰ� �ִ� �÷�
--		Primary Key�� �����Ѵ�
		--- �ܷ�Ű ���Ἲ -----
--		������� �̿��� �����͸� ���� �� ����
--		ex) emp.deptno
-- + ���� ���� ����
--	- ����Ŭ ���� ����
--	- ANSI ���� ����(ǥ��)
-- + ANSI : �̱� ���� ǥ�� ��ȸ
--		ISO �ⱸ�� ��������
-- + ISO : ���� ǥ��ȭ �ⱸ
--		International Standard Organization
-- + IEEE : ���� ���� ����� ��ȸ




SELECT * FROM emp;
SELECT * FROM dept;


SELECT * FROM emp, dept; -- CROSS JOIN

SELECT * FROM emp NATURAL JOIN dept;

desc emp;

-- + EQUI JOIN, � ����
--	- ���� ��� ���̺���� ���뵥���͸� ������ �÷��� �̿���
--	- �ش� �÷��� ���� ���� ���� �� ��ȸ�ǵ��� WHERE ���� ����
--	- ���� ���� ����
--	- ����Ŭ ���� ����

-- + INNER JOIN, ���� ����
--	- EQUI JOIN�� ���� ��ȸ ����� ���� �� �ִ�
--	- FROM ���δ�����̺� INNER JOIN �������̺�� ON ��������
--	- EQUI JOIN�� ���������� WHERE ��� ON���� ����Ѵ�
--	- ���� : �Ϲ����ǰ� ���������� �и��ؼ� �� �� �ִ�
--	- INNERŰ���� �����ϰ� JOINŰ���常 ����ص� ��

-- + NON-EQUI JOIN, �� ����
--	- �⺻ ������ EQUI JOIN�� ����
--	- ���������� �����ڰ� '='(equal)�� �ƴ� ����

-- EQUI JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno --��������
    AND empno > 7500 --��ȸ����
ORDER BY deptno, empno;

-- INNER JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno --��������
WHERE empno > 7500 --��ȸ����
ORDER BY deptno, empno;

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
INNER JOIN salgrade S
    ON E.sal BETWEEN s.losal AND s.hisal;
