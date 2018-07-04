-- + DISTINCT
--	- �ߺ������͸� �����ϴ� Ű����
--	- SELECT Ű���� �ٷ� �ڿ� �ٿ��� ���
--		SELECT DISTINCT ~~
--	- ���� Į���� ��ȸ�� ���� �÷����� �ϳ��� �׷�����
--	��� �ν��Ѵ�
--	(��ȸ�Ǵ� ��� �÷��� �����Ͱ� �ߺ��� �� �����Ѵ�)
--	** SELECT Ű����� �÷�����Ʈ ���̿� DISTINCT ����

-- DISTINCT : �ߺ��� ����

-- ȸ�翡 �����ϴ� �μ���
SELECT DISTINCT deptno
FROM emp
ORDER BY deptno;
-- �� �μ��� �����ϴ� ������
SELECT DISTINCT deptno, job
FROM emp
ORDER BY deptno;

-- �߸��� ����(��� �÷��� ��ġ�ؾ��Ѵ�)
SELECT DISTINCT *
FROM emp;

-- + ������ ���� ������ ||
--	- �� �� �̻��� �����͸� �ϳ��� �÷����� �����Ͽ� ǥ���� �� ���
--	- ���ڿ� �� �� ��ġ��
--	- ���ڿ� + ����
--	- ���ڿ� + ��¥
--	- ���...
-- ** ' ' �� ǥ���� ���ڿ� ������ ' �� ����ϰ� ������ ''�� ����Ѵ�
--	ex) 'Bob''s job'
--          ->Bob's job


-- || ���ڿ� ���� ������
SELECT
    ename || ' is ' || job AS "EMPLOYEE"
FROM emp;

SELECT
    ename || '''s job is ' || job AS "EMPLOYEE"
FROM emp;

-- + ����Ŭ ���� �Լ�, SQL Functions
--	- ���� �� �Լ�
--		���̺� ��ȸ���� ����ϸ� �� �࿡ ����� �ݿ��Ǵ� �Լ�
--		�����Լ�, �����Լ�, ��¥�Լ�, ����ȯ�Լ�
--		�Ϲ��Լ�, ���Խ�, ...
--	- �׷� �Լ� 
--		����� �׷�ȭ�Ͽ� �ϳ��� ����� �����ϴ� �Լ�
--		�����Լ�(SUM, AVG, COUNT, ...)
-- + ����Ŭ 11g R2 Reference URL
--	https://docs.oracle.com/cd/E11882_01/server.112/e41084/toc.htm

-- + DUAL ���̺�
--	- sys ����ڰ� �����ϴ� ���̺�(OWNER : sys)
--	- ������ ����� �����÷��� Ȯ���ϴ� �뵵�� �����Ǵ� ���̺�

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

-- + ���� �� �Լ�, Single Row Function
--	- ���� �Լ�, Numeric Function
--		JAVA�� MathŬ������ �޼ҵ��� ������

-- ���� �Լ�
SELECT abs(-445) FROM dual; --���밪

-- 12.523 -> �Ҽ������� �ݿø�
SELECT ROUND(12.523,0) FROM dual;
-- -12.723 -> �Ҽ������� �ݿø�
SELECT ROUND(-12.723,0) FROM dual;
-- 12.567 -> �Ҽ��� 3°�ڸ����� �ݿø�
SELECT ROUND(12.567, 2) FROM dual;
-- 12345 -> 1�� �ڸ����� �ݿø�
SELECT ROUND(12345, -1) FROM dual;
-- 56789 -> 10�� �ڸ����� �ݿø�
SELECT ROUND(56789, -2) FROM dual;

-- 12.456 -> �Ҽ������� ����
--SELECT FLOOR(12.456) FROM dual;
SELECT TRUNC(12.456) FROM dual;
-- 12.456 -> �Ҽ��� 3° �ڸ����� ����
--SELECT (FLOOR(12.456*100))/100 FROM dual;
SELECT TRUNC(12.456,2) FROM dual;
-- 12345 -> 1�� �ڸ����� ����
--SELECT (FLOOR(12345/10))*10 FROM dual;
SELECT TRUNC(12345,-1) FROM dual;
-- 56789 -> 10�� �ڸ����� ����
--SELECT (FLOOR(56789/100))*100 FROM dual;
SELECT TRUNC(56789,-2) FROM dual;

-- 13�� 8�� ���� ������
SELECT MOD(13,8) FROM dual;

-- 12.345�ø� -> 13
SELECT CEIL(12.345) FROM dual;

-- -12.567�ø� -> -12
SELECT CEIL(-12.567) FROM dual;

-- 12.567 ���� -> 12
SELECT FLOOR(12.567) FROM dual;
-- 12.123 ���� -> 12
SELECT FLOOR(12.123) FROM dual;
-- -12.567 ���� -> -13
SELECT FLOOR(-12.567) FROM dual;
-- -12.123 ���� -> -13
SELECT FLOOR(-12.123) FROM dual;

-- 3�� 4���� -> 81
SELECT POWER(3,4) FROM dual;
-- 3�� -1���� -> 0.33333333
SELECT POWER(3,-1) FROM dual;

-- 9�� ������ -> 3
SELECT sqrt(9) FROM dual;
-- 11�� ������ -> 3.3166..
SELECT sqrt(11) FROM dual;


--	- ���� �Լ�, Character Function
--		1. ��ȯ���� ������ �����Լ�
--		2. ��ȯ���� ������ �����Լ�

-- ���� �Լ�

-- length()
SELECT length(ename)FROM emp;
SELECT length('Apple')FROM dual;
SELECT length('�ȳ�')FROM dual;

-- lengthb()
SELECT lengthb('Apple')FROM dual;
SELECT lengthb('�ȳ�')FROM dual;

-- substr()
SELECT substr('Hello Oracle', 3) FROM dual;

-- 'hELlo' ��� �빮�ڷ� ��ȯ -> HELLO
SELECT UPPER('hELlo') FROM dual;
-- 'hELlo' ��� �ҹ��ڷ� ��ȯ -> hello
SELECT LOWER('hELlo') FROM dual;
-- 'hELlo' �̴ϼ�(ù����) �빮�� -> Hello
SELECT NLS_INITCAP('hELlo') FROM dual;

-- 'Alice Bob'�� ���ڿ� ���� -> 9
SELECT LENGTH('Alice Bob') FROM dual;
-- '�ȳ��ϼ���'�� ���ڿ� ���� -> 5
SELECT LENGTH('�ȳ��ϼ���') FROM dual;

-- 'Alice BOb' ���ڿ� ����Ʈ �� -> 9
SELECT LENGTHB('Alice Bob') FROM dual;
-- 'ACE �ȳ��ϼ���' ���ڿ� ����Ʈ �� -> 19
SELECT LENGTHB('ACE �ȳ��ϼ���') FROM dual;
-- (����Ŭ�� �ѱ� ���ڵ��� UTF-8�� �⺻���� �ϸ�
--  UTF-8�� �ѱ� �ѱ��ڿ� 3����Ʈ�� �ʿ��ϴ�)

-- 'ABCDEFGHI'���� 'D'�� ��ġ -> 4
SELECT instr('ABCDEFGHI','D') FROM dual;
--SELECT REGEXP_INSTR('ABCDEFGHI', 'D') FROM dual;
-- 'ABCDEFGHI'���� 'DEF'���ڿ��� ��ġ ->4
SELECT instr('ABCDEFGHI','DEF')FROM dual;
--SELECT REGEXP_INSTR('ABCDEFGHI','DEF') FROM dual;
-- 'ABCDEFGHI'���� 'DF'���ڿ��� ��ġ ->0
SELECT instr('ABCDEFGHI','DF')FROM dual;
--SELECT REGEXP_INSTR('ABCDEFGHI','DF') FROM dual;
-- '�ȳ��ϼ���'���� '��'���ڿ��� ��ġ ->3
SELECT instr('�ȳ��ϼ���','��')FROM dual;
SELECT REGEXP_INSTR('�ȳ��ϼ���','��')FROM dual;
-- 'ABCABCDDD'���� 'C'���ڿ��� ��ġ ->3
SELECT instr('ABCABCDDD','C')FROM dual;
SELECT REGEXP_INSTR('ABCABCDDD','C')FROM dual;

--'Oracle SQL Developer'���� 5��° �ε��� ������ ���ڿ��� �ڸ���
SELECT SUBSTR('Oracle SQL Developer',6) FROM dual;
--'Oracle SQL Developer'���� 5��° �ε������� 5���ڷ� �ڸ���
SELECT SUBSTR('Oracle SQL Developer',6,5) FROM dual;
--'����Ŭ SQL'���� 2���� �ε������� 5���ڷ� �ڸ���
SELECT SUBSTR('����Ŭ SQL',2,5)FROM dual;
SELECT SUBSTRb('����Ŭ SQL',2,5)FROM dual;
--'�ȳ��ϼ������Ŭ'���� 3��° ���� �ڸ���
SELECT SUBSTR('�ȳ��ϼ������Ŭ',3)FROM dual;
SELECT SUBSTRb('�ȳ��ϼ������Ŭ',3)FROM dual;

SELECT empno+1000, initcap(ename)
FROM emp
WHERE ename = 'SMITH'; --from -> where -> select ������ ó��

-- LEFT PADDING
-- ���ڿ��� ���� ������ Ȯ���ϰ� ������� ������ ���ڷ� ä���
SELECT lpad('SQL',5,'*')FROM dual;
SELECT lpad('SQL',10,'*-')FROM dual;
SELECT lpad('SQL',5)FROM dual;
SELECT lpad('SQL',5,' ')FROM dual;

SELECT lpad('ABCDEFGHI',5,'*')FROM dual;

-- RIGHT PADDING
SELECT rpad('SQL',5,'*')FROM dual;

-- TRIM
SELECT '   SQL    ',
    LTRIM('  SQL  ') AS "-",
    RTRIM('  SQL  ') AS "-",
    TRIM('   SQL   ') AS "-",
    LTRIM(RTRIM('    SQL   ')) "-"
FROM dual;

SELECT TRIM('A' FROM 'AAASQLAAAAA' ) FROM dual;    
SELECT TRIM(LEADING FROM '  SQL     ') AS "-" FROM dual;
SELECT TRIM(TRAILING '*' FROM '**SQL***') AS "-" FROM dual;
SELECT TRIM('   SQL    ') AS "-" FROM dual;

--	- ��¥ �Լ�, Datetime Function
--		DATE, TIMESTAMP, INTERVAL Ÿ�Կ� ����Ǵ� ��¥���� �Լ�
-- 		** sysdate
--		 ���糯¥(�ð�����)�� ��ȯ�ϴ� �Լ�
--		 �Ű���������
--		  sysdate() �������� ������� �ʰ�
--		  sysdate ��� ����Ѵ�
--		ex) SELECT sysdate FROM dual;

-- ��¥ �Լ�
SELECT sysdate FROM dual;

SELECT 
    TO_CHAR(TRUNC(sysdate), 'YYYY/MM/DD HH24:MI:SS') AS "NOW" -- ""�ĺ��� as���� ����
FROM dual;

-- months_between : �� datetime ������ ���� �� ���� ���
SELECT
    MONTHS_BETWEEN('18-01-01', '18/02/01')"1",
    MONTHS_BETWEEN('18/01/01', '18/02/15')"2",
    ROUND(MONTHS_BETWEEN('18/01/01', '18/02/15'),2)"3"
FROM dual;

-- ��������� ��ȸ
SELECT
    ename,
    months_between(sysdate, hiredate)"diff"
FROM emp;

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

--	- (��)��ȯ �Լ�, Conversion Function
--		TO_NUMBER : NUMBER ������ VARCHAR2  ---> NUMBER
--		TO_CHAR : NUMBER, DATE ---> ���ϴ� ������ VARCHAR2
--		TO_DATE : DATETIME ������ VARCHAR2 -----> DATETIME
--
--                  TO_CHAR       ����       TO_DATE        ��¥
--����            ----------->  (varchar2)  ---------->      (DATETIME)
--(NUMBER)     <----------                  <----------
--                   TO_NUMBER               TO_CHAR

-- to_number
SELECT
    '123123' + 1111111 --�ڵ� ����ȯ
--    to_number('123123')+111111 
FROM dual;

-- to_date
SELECT
    '17/10/9', -- + 5 ����Ÿ���̹Ƿ� + ���� �Ұ�
    to_date('17/10/9') + 5
FROM dual;

SELECT
    to_date('12 1 11'),
    to_date('12 1 11', 'dd mm yy')
FROM dual;

-- + TO_CHAR(number)
--		NUMBER -> VARCHAR2
--	- TO_CHAR(number)
--	- TO_CHAR(number, ���� ���� ��������)

-- + ���� ���� ��������
--	- 0 : ���ڰ� �� �ڸ��� Ȯ��, ���� �ڸ��� 0���� LPAD
--	- 9 : ���ڰ� �� �ڸ��� Ȯ��, ���� �ڸ��� ' '���� LPAD
--	- , : �ڸ��� ���� ���� �߰�
--	- . : �Ҽ��� ���� ���� �߰�
--	- $ : ��ȭ��ȣ $�� �߰�
--	- L : ���� ��ȭ��ȣ �߰�(������ ��ȭ(LOCALE)�� ����, �ѱ� : \)
--	- �Ҽ��� ���� �κ��� �������ڰ� �����ϸ� �ݿø�
--	- ���ڰ� �����ϸ� 0���� RPAD
--	- ������ �������ڰ� �����ϸ� #���� ����ó��
-- + NUMBER ������Ÿ��
--	- ���ڸ� ǥ���ϴ� ������Ÿ��
--	- ����, �Ǽ��� �������� ����
--	- NUMBER : 38�ڸ����� ǥ�������� ����
--	- NUMBER(n) : n�ڸ����� ǥ�������� ����
--	- NUMBER(n, m) : n�ڸ��� ǥ���� �� �ְ� �Ҽ��κ��� m���� ����
--		ex) NUMBER(7, 2) : 7�ڸ� ǥ��, �Ҽ��δ� 2�ڸ�

-- to_char(number)
SELECT
   to_char(12345) "1",
   to_char(12345, '99')"2",
   to_char(12345, '9999999999')"3",
   to_char(12345, '0000000000')"4",
   to_char(12345, '9900000000')"5"
FROM dual;

SELECT
    to_char(12345, '$999999')"1",
    to_char(12345, '$99999')"2",
    to_char(12345, '$9999')"3",
    to_char(12345, 'L999999')"4" -- �ѱ���ȭ \�� ǥ��
FROM dual;

SELECT
    to_char(12345.6789)"1",
    to_char(12345.6789, '99999.99')"2",
    to_char(12345.6789, '9,999,999.99')"3",
    to_char(12345.6, '99,999.99')"4" --�Ҽ��κ��� �ڸ�����ŭ 0�� ä��
FROM dual;