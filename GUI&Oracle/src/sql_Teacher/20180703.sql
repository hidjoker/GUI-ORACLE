

-- DISTINCT : �ߺ��� ����

-- ȸ�翡 �����ϴ� �μ���
SELECT DISTINCT
    deptno
FROM emp
ORDER BY deptno;

-- �� �μ��� �����ϴ� ������
SELECT DISTINCT
    deptno, job
FROM emp
ORDER BY deptno;

-- �߸��� ���� (��� �÷��� ��ġ�ؾ��Ѵ�)
SELECT DISTINCT
    *
FROM emp;





-- || ���ڿ� ���� ������
SELECT
    ename || ' is ' || job AS "EMPLOYEE"
FROM emp;

SELECT
    ename || '''s job is ' || job AS "EMPLOYEE"
FROM emp;



-- ������ �Լ� �׽�Ʈ
SELECT
    ename, length(ename)
FROM emp;

-- �׷��Լ� �׽�Ʈ
SELECT
    SUM(sal)
FROM emp;


-- DUAL ���̺�
SELECT 'Apple' FROM dual;

SELECT 10+20 FROM dual;
desc dual;





-- ���� �Լ�
SELECT abs(-445) FROM dual; --���밪

-- 12.523 -> �Ҽ������� �ݿø�
-- -12.723 -> �Ҽ������� �ݿø�
-- 12.567 -> �Ҽ��� 3°�ڸ����� �ݿø�
-- 12345 -> 1�� �ڸ����� �ݿø�
-- 56789 -> 10�� �ڸ����� �ݿø�

-- 12.456 -> �Ҽ������� ����
-- 12.456 -> �Ҽ��� 3°�ڸ����� ����
-- 12345 -> 1���ڸ����� ����
-- 56789 -> 10���ڸ����� ����

-- 13�� 8�� ���� ������

-- 12.345 �ø� -> 13
-- -12.567 �ø� -> -12

-- 12.567 ���� -> 12
-- 12.123 ���� -> 12
-- -12.567 ���� -> -13
-- -12.123 ���� -> -13

-- 3�� 4���� -> 81
-- 3�� -1 ���� -> 0.33333333333

-- 9�� ������ -> 3
-- 11�� ������ -> 3.3166...

--------------------------------------------------------
-- 12.523 -> �Ҽ������� �ݿø�
SELECT round(12.523) FROM dual;
-- -12.723 -> �Ҽ������� �ݿø�
SELECT round(-12.723) FROM dual;
-- 12.567 -> �Ҽ��� 3°�ڸ����� �ݿø�
SELECT round(12.567, 2) FROM dual;
-- 12345 -> 1�� �ڸ����� �ݿø�
SELECT round(12345, -1) FROM dual;
-- 56789 -> 10�� �ڸ����� �ݿø�
SELECT round(56789, -2) FROM dual;

-- 12.456 -> �Ҽ������� ����
SELECT trunc(12.456) FROM dual;
-- 12.456 -> �Ҽ��� 3°�ڸ����� ����
SELECT trunc(12.456, 2) FROM dual;
-- 12345 -> 1���ڸ����� ����
SELECT trunc(12345, -1) FROM dual;
-- 56789 -> 10���ڸ����� ����
SELECT trunc(56789, -2) FROM dual;

-- 13�� 8�� ���� ������
SELECT mod(13, 8) FROM dual;

-- 12.345 �ø� -> 13
SELECT ceil(12.345) FROM dual;
-- -12.567 �ø� -> -12
SELECT ceil(-12.567) FROM dual;


-- 12.567 ���� -> 12
SELECT floor(12.567) FROM dual;
-- 12.123 ���� -> 12
SELECT floor(12.123) FROM dual;
-- -12.567 ���� -> -13
SELECT floor(-12.567) FROM dual;
-- -12.123 ���� -> -13
SELECT floor(-12.123) FROM dual;

-- 3�� 4���� -> 81
SELECT power(3, 4) FROM dual;
-- 3�� -1 ���� -> 0.33333333333
SELECT power(3, -1) FROM dual;

-- 9�� ������ -> 3
SELECT sqrt(9) FROM dual;
-- 11�� ������ -> 3.3166...
SELECT sqrt(11) FROM dual;


-- ���� �Լ�

-- length()
SELECT length(ename) FROM emp;
SELECT length('Apple') FROM dual;
SELECT length('�ȳ�') FROM dual;

-- lengthb()
SELECT lengthb('Apple') FROM dual;
SELECT lengthb0('�ȳ�') FROM dual;


-- substr()
SELECT substr('Hello Oracle', 3) FROM dual;





-- 'hELlo' ��� �빮�ڷ� ��ȯ -> HELLO
-- 'hELlo' ��� �ҹ��ڷ� ��ȯ -> hello
-- 'hELlo' �̴ϼ�(ù����) �빮�� -> Hello

-- 'Alice Bob'�� ���ڿ� ���� -> 9
-- '�ȳ��ϼ���'�� ���ڿ� ���� -> 5

-- 'Alice Bob' ���ڿ� ����Ʈ �� -> 9
-- 'ACE �ȳ��ϼ���'���ڿ� ����Ʈ �� -> 19
-- (����Ŭ�� �ѱ� ���ڵ��� UTF-8�� �⺻���� �ϸ�
--  UTF-8�� �ѱ� �ѱ��ڿ� 3����Ʈ�� �ʿ��ϴ�)

-- 'ABCDEFGHI'���� 'D' �� ��ġ -> 4
-- 'ABCDEFGHI'���� 'DEF'���ڿ��� ��ġ ->4
-- 'ABCDEFGHI'���� 'DF'���ڿ��� ��ġ -> 0
-- '�ȳ��ϼ���'���� '��'���ڿ��� ��ġ -> 3
-- 'ABCABCDDD'���� 'C'���ڿ��� ��ġ -> 3

--'Oracle SQL Developer'���� 5��° �ε��� ������ ���ڿ��� �ڸ���
--'Oracle SQL Developer'���� 5��° �ε������� 5���ڷ� �ڸ���
--'����Ŭ SQL'���� 2��° �ε������� 5���ڷ� �ڸ���
--'�ȳ��ϼ������Ŭ'���� 3��° ���� �ڸ���


-----------------------------------------------

-- 'hELlo' ��� �빮�ڷ� ��ȯ -> HELLO
SELECT UPPER('hELlo') FROM dual;

SELECT * FROM emp
WHERE ename = UPPER('smith');

-- 'hELlo' ��� �ҹ��ڷ� ��ȯ -> hello
SELECT LOWER('hELlo') FROM dual;

-- 'hELlo' �̴ϼ�(ù����) �빮�� -> Hello
SELECT INITCAP('hELlo') FROM dual;


-- 'Alice Bob'�� ���ڿ� ���� -> 9
SELECT length('Alice Bob') FROM dual;
-- '�ȳ��ϼ���'�� ���ڿ� ���� -> 5
SELECT length('�ȳ��ϼ���') FROM dual;

-- 'Alice Bob' ���ڿ� ����Ʈ �� -> 9
SELECT lengthb('Alice Bob') FROM dual;

-- 'ACE �ȳ��ϼ���'���ڿ� ����Ʈ �� -> 19
SELECT lengthb('ACE �ȳ��ϼ���') FROM dual;
-- (����Ŭ�� �ѱ� ���ڵ��� UTF-8�� �⺻���� �ϸ�
--  UTF-8�� �ѱ� �ѱ��ڿ� 3����Ʈ�� �ʿ��ϴ�)

-- 'ABCDEFGHI'���� 'D' �� ��ġ -> 4
SELECT instr('ABCDEFGHI', 'D') FROM dual;
-- 'ABCDEFGHI'���� 'DEF'���ڿ��� ��ġ ->4
SELECT instr('ABCDEFGHI', 'DEF') FROM dual;
-- 'ABCDEFGHI'���� 'DF'���ڿ��� ��ġ -> 0
SELECT instr('ABCDEFGHI', 'DF') FROM dual;
-- '�ȳ��ϼ���'���� '��'���ڿ��� ��ġ -> 3
SELECT instr('�ȳ��ϼ���', '��') FROM dual;
SELECT instrb('�ȳ��ϼ���', '��') FROM dual;
-- 'ABCABCDDD'���� 'C'���ڿ��� ��ġ -> 3
SELECT instrb('ABCABCDDD', 'C') FROM dual;


--'Oracle SQL Developer'����
--5��° �ε��� ������ ���ڿ��� �ڸ���
SELECT substr('Oracle SQL Developer', 6) FROM dual;

--'Oracle SQL Developer'����
--5��° �ε������� 5���ڷ� �ڸ���
SELECT substr('Oracle SQL Developer', 6, 5) FROM dual;

--'����Ŭ SQL'���� 2��° �ε������� 5���ڷ� �ڸ���
SELECT substr('����Ŭ SQL', 2, 5) FROM dual;
SELECT substrb('����Ŭ SQL', 2, 5) FROM dual;

--'�ȳ��ϼ������Ŭ'���� 3��° ���� �ڸ���
SELECT substr('�ȳ��ϼ������Ŭ', 3) FROM dual;
SELECT substrb('�ȳ��ϼ������Ŭ', 3) FROM dual;


SELECT empno+1000, initcap(ename)
FROM emp
WHERE ename = 'SMITH';


-- LEFT PADDING
--  ���ڿ��� ���� ������ Ȯ���ϰ� ������� ������ ���ڷ� ä���
SELECT lpad('SQL', 5, '*') FROM dual;
SELECT lpad('SQL', 10, '*-') FROM dual;
SELECT lpad('SQL', 5) FROM dual;
SELECT lpad('SQL', 5, ' ') FROM dual;

SELECT lpad('ABCDEFGHI', 5, '*') FROM dual;


-- RIGHT PADDING
SELECT rpad('SQL', 5, '*') FROM dual;



-- TRIM
SELECT '  SQL   ',
    LTRIM('  SQL   ') AS "-",
    RTRIM('  SQL   ') AS "-",
    TRIM('  SQL   ') AS "-",
    LTRIM(RTRIM('  SQL   ')) "-"
FROM dual;


SELECT TRIM(TRAILING '*' FROM '**SQL***') AS "-" FROM dual;

SELECT TRIM(LEADING FROM '  SQL    ') AS "-" FROM dual;

SELECT TRIM('A' FROM 'AAASQLAAAA') AS "-" FROM dual;

SELECT TRIM('  SQL   ') AS "-" FROM dual;





-- ��¥ �Լ�
SELECT sysdate FROM dual;

SELECT
    TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOW
FROM dual;


-- months_between : �� datetime ������ ���� �� ���� ���
SELECT
    MONTHS_BETWEEN('18-01-01', '18/02/01') "1",
    MONTHS_BETWEEN('18/01/01', '18/02/15') "2",
    ROUND(MONTHS_BETWEEN('18/01/01', '18/02/15'), 2)"3"
FROM dual;

-- ��������� ��ȸ
SELECT
    ename,
    months_between(sysdate, hiredate) "diff"
FROM emp;

select * from emp;


-- datetime �� �����ϱ�
SELECT
    sysdate + 100
FROM dual;



-- last_day : ������ datetime�� �ش� �� ������ �� ��ȯ
SELECT
    last_day(sysdate),
    last_day('16/2/7')
FROM dual;


-- next_day
SELECT
    next_day(sysdate, '��')
FROM dual;

-- date Ÿ�԰� timestamp Ÿ���� ���� datetime
SELECT
    sysdate,
    systimestamp
FROM dual;



SELECT
    TO_CHAR(TRUNC(sysdate), 'YYYY/MM/DD HH24:MI:SS') NOW
FROM dual;





-- to_number
SELECT
    '123123' + 111111,
    to_number('123123') + 111111
FROM dual;



-- to_date
SELECT
    '17/10/9', -- + 5  ����Ÿ���̹Ƿ� + ���� �Ұ�
    to_date('17/10/9') + 5
FROM dual;


SELECT
    to_date('12 1 11'),
    to_date('12 1 11', 'dd mm yy')
FROM dual;



-- to_char(number)
SELECT
    to_char(12345) "1",
    to_char(12345, '99') "2",
    to_char(12345, '9999999999') "3",
    to_char(12345, '0000000000') "4",
    to_char(12345, '9900000000') "5"
FROM dual;


SELECT
    to_char(12345, '$999999') "1",
    to_char(12345, '$99999') "2",
    to_char(12345, '$9999') "3",
    to_char(12345, 'L999999') "4" -- �ѱ���ȭ \�� ǥ��
FROM dual;


SELECT
    to_char(12345.6789) "1",
    to_char(12345.6789, '99999.99') "2",
    to_char(12345.6789, '9,999,999.99') "3",
    to_char(12345.6, '99,999.99') "3"
FROM dual;



CREATE TABLE test (
    num NUMBER(7,2)
);
INSERT INTO test VALUES ( 1.123 );
INSERT INTO test VALUES ( 1.5 );
INSERT INTO test VALUES ( 1.1578 );
INSERT INTO test VALUES ( 123456 );
SELECT * FROM test;

desc test;