--+ ����Ŭ �����ͺ��̽� �ڷ���
-- - NUMBER <-> int(�ڹ�)
--	���� Ÿ��
--	����, �Ǽ� ���о���(�Ҽ��� �ڸ��� �������� ������ ����)
--	����, ���, 0 ���� ����
--	���� ����� �ʿ��� �÷��� ����
--	�������� Ÿ��
-- - NUMBER : �ִ� 38�ڸ����� ���尡���� Ÿ��
-- - NUMBER(w) : �ִ� w�ڸ����� ���尡���� Ÿ��(�ִ�38)
-- - NUMBER(w, d) : ��ü w�ڸ�, �Ҽ������� d�ڸ� ����
--  (w-d ��ŭ �����ڸ�, d��ŭ �Ҽ��ڸ� Ȯ��
--  (w-d ���� n�̸�, �Ҽ������� n+1�ڸ����� d�� ǥ������)
--  (w-d ���� n�̸�, �Ҽ������� n�ڸ����� ����0��, ���� d�� ǥ������)
-- - VARCHAR2(n)
--	���� ���� ���� ������
--	���� ����Ǵ� �������� ũ�⸸ŭ�� ��������� ����Ѵ�
--	�ִ� n�� ���̸� ���� �� �ִ�(������ ����)
--	�ּ� ũ��� 1
--	ex) varchar2(50) -> 'Alce'
--			45����Ʈ�� ������ �ʰ�, 5����Ʈ�� �����Ѵ�
--	** �ѱ� ���ڵ�(character set)�� UTF8�̸� �ѱ��ڴ� 3����Ʈ
--	** n�� BYTE or CHAR ���̾ ���� �� �ִ�
--	** BYTE�� ����Ʈ�ױ�
--	** CHAR�� ���ڰ���
-- - CHAR(n)
--	���� ���� ���� ������
--	n���� ������ ũ�⸸ŭ ���� ������ ����Ѵ�
--	�ּ� ũ�� 1
--	** VARCHAR2�� CHAR�� ���ڸ� ǥ���ϴ� ����� ���� �����ĸ� �ٸ���

-- CHAR(n)
CREATE TABLE type_test_04(
    data1 CHAR,
    data2 CHAR(10),
    data3 CHAR(10 CHAR)
    --, data4 VARCHAR2 --VARCHAR2�� �ݵ�� ũ�� �����ؾ� ��
);

INSERT INTO type_test_04
VALUES ('1', '1234567890', '1234567890');

INSERT INTO type_test_04(data2, data3)
VALUES('������','���̻�����ĥ�ȱ���');

INSERT INTO type_test_04(data2, data3)
VALUES('12345','12345');

SELECT TRIM(data1), TRIM(data2), TRIM(data3) FROM type_test_04;

-- - DATE
--	��¥�ð�Ÿ��(datetime)
--	��¥�� �ð��� ������ �� �ִ� Ÿ��
--	** sysdate : ���� DATETIME�� ��ȯ�ϴ� �Լ�
--	����, �⵵, ��, ��, �ð�, ��, ��, ����, �������� ���� ����
--	BC 4712/01/01 ~ AD 4712/12/31 �� ǥ�� ������ ����
--	+ to_date���� �� �ڸ��� ������ ǥ���� �� rr, yy�� ����
--		- yy : ���� �⵵ �� ���ڸ��� �ٴ´�(���� ����)
--			ex)to_date('14/7/3', 'yy/mm/dd') -> 2014��
--	             to_date('88/7/7', 'yy/mm/dd') -> 2088��
--		- rr : ���� �⵵�� ���� �޶�����
--			����⵵	�Է³⵵	���
--			00~49		00~49		���� ����
--			00~49		50~99		���� ����
--			50~99		00~49		���� ����
--			50~99		50~99		���� ����
--			ex)
--			2015��		28/8/7		2028��
--			2028��		60/3/8		1960��
--			2077��		20/10/7		2120��
--			2079��		93/8/13		2092��

CREATE TABLE type_test_05(
    data DATE
);
SELECT TO_CHAR(data,'sYYYY/mm/dd hh24:mi:ss') FROM type_test_05;
INSERT INTO type_test_05 VALUES (sysdate);
INSERT INTO type_test_05 VALUES ('2020/11/21');

INSERT INTO type_test_05
VALUES (to_date('-2012/11/24','syyyy/mm/dd')); 
--���� date������ ���ڿ��� �ν��ϱ� ������ to_date�� �����Ͽ� ����ȯ�� ���ش�

-- �⵵ YY, RR
SELECT to_char(data, 'yyyy/mm/dd'),
    to_char(data,'rrrr/mm/dd')
FROM type_test_05;

INSERT INTO type_test_05
VALUES(to_date('10/7/3','yy/mm/dd'));
INSERT INTO type_test_05
VALUES(to_date('80/8/5','yy/mm/dd'));

INSERT INTO type_test_05
VALUES(to_date('10/7/3','rr/mm/dd'));
INSERT INTO type_test_05
VALUES(to_date('80/8/5','rr/mm/dd'));

SELECT*FROM type_test_05;

-- - TIMESTAMP
--		DATETIME(��¥�ð�_ Ÿ��
--		DATE Ÿ���� Ȯ����
--		�и��ʱ��� ���� ������ Ÿ��

CREATE TABLE type_test_06(
    data TIMESTAMP
);
INSERT INTO type_test_06
VALUES(systimestamp);
SELECT * FROM type_test_06;

-- - LONG
--		���� ���� ������
--		�ִ� ũ�� 2GB
--		���̺� �� �� �÷��� ���� ����
--		���̺� ���� �����͸� ���� ����
--		+�η� �Լ�, Lorem Ipsum
--		- �ѱ� �Լ�
--			http://hangul.thefron.me/
--		- �η� �Լ�
--			https://www.lipsum.com/

-- LONG
CREATE TABLE type_test_07(
    data LONG
--    , data2 LONG -- LONG�� ���̺� �� �Ѱ��� ����
);
INSERT INTO type_test_07 VALUES('�ȳ��ϼ���');
SELECT * FROM type_test_07;

INSERT INTO type_test_07 VALUES('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis dui non metus dignissim tempor eget sed velit. Mauris nec velit hendrerit, euismod ex ac, scelerisque ligula. Morbi venenatis semper lorem. Cras vitae pharetra nisl. Nunc tempus nisl purus, malesuada sodales elit ultrices in. In elementum orci ac tincidunt sodales. Suspendisse egestas, orci rutrum interdum tempor, mauris dolor finibus orci, quis cursus nunc nisi sed neque. Vestibulum convallis lorem ac tempus iaculis. Aliquam sit amet libero vitae lacus ultricies vestibulum sit amet mattis quam. Vivamus vel dui sed tortor imperdiet rhoncus sit amet ac mauris. Curabitur cursus ipsum sed tortor convallis, ultrices sodales nisi ullamcorper. Proin dapibus, magna at tincidunt hendrerit, enim nunc maximus ante, ac cursus arcu ex quis ipsum.

Fusce vitae risus a neque lobortis porttitor sit amet facilisis lectus. Donec commodo pharetra maximus. Proin ut risus sit amet arcu aliquet consequat. Proin non risus facilisis, cursus ipsum nec, imperdiet justo. Suspendisse imperdiet felis tincidunt nulla faucibus, fermentum molestie sem viverra. Maecenas lobortis lorem dui, a sollicitudin eros eleifend vel. Nullam vitae tincidunt arcu. Praesent ultrices orci vitae mi fringilla posuere. Donec ut nisl et dolor pharetra luctus venenatis in augue. Praesent volutpat nunc mauris, non elementum purus ultricies sed.

Maecenas felis magna, pretium at elementum maximus, egestas quis nisi. Morbi vitae nisi id arcu ultrices laoreet. Nam imperdiet, ante ac sodales euismod, augue nisl mattis arcu, at semper libero tellus et odio. Curabitur faucibus placerat blandit. Suspendisse bibendum fermentum volutpat. Praesent hendrerit mi urna, eu commodo ipsum pulvinar pharetra. Nunc laoreet eu eros id malesuada. Nunc condimentum ipsum justo, vel efficitur urna interdum tempor. Praesent maximus porttitor laoreet. Donec hendrerit tempus tortor, nec cursus diam dapibus nec. Phasellus vel congue lorem. Donec tempor dolor nunc, eget ornare elit porttitor quis. Nulla volutpat id ante pellentesque feugiat. Sed placerat leo ac ante dictum dapibus.

Suspendisse pharetra tellus mauris, vel malesuada mi blandit eu. Morbi nec cursus nisl, sit amet finibus tellus. Sed aliquet nunc quis orci commodo dignissim. Pellentesque euismod ac ex sed ultrices. Sed eu elementum turpis. Aenean tristique, risus nec elementum pharetra, nibh nisi gravida nulla, a porta risus diam non neque. Curabitur vitae nulla laoreet, lacinia nisl in, varius metus. Phasellus eu tellus molestie, iaculis libero et, eleifend nisi. Etiam sed neque ultricies, mattis risus eget, porttitor nulla. Aliquam ultricies sagittis velit.

Proin vitae tortor in libero tristique elementum. Nulla mollis elit eget sem tincidunt consequat. Etiam in tellus ut nisl aliquet accumsan eu vitae enim. Suspendisse maximus sapien velit. Nunc eu bibendum tortor. Fusce non est eu augue tincidunt sollicitudin. In dapibus ipsum ut erat vulputate, egestas dictum sapien accumsan. Donec quis felis quis ex pellentesque molestie. Sed vitae tortor eu sapien vestibulum luctus egestas in leo. Proin elementum, nibh feugiat sollicitudin molestie, enim dolor dapibus justo, id tincidunt sapien purus vehicula leo. Mauris quis commodo magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');

INSERT INTO type_test_07 VALUES('���� �󸶳� ����, ���̴�. ���� �����̽��� Ȳ�ݽô븦 Ǯ�� ���̴�. ���̴�.����, �ǰ� ������ �����Ϸ�? ������ �̻��� �� �Ͽ�����, �츮 �츮�� ������ �̰��� ���̴�. ������ �Ǵ� ���� �ִ� û���� ���. ���� �Ҿ� ����� ������ �Ƹ��ٿ��? õ�ڸ�ȫ�� ������ ���Ͽ�, �� ������ ���� ����. �Ƹ���� ���� �� ��Ȳ�Ͽ�����, �̰��̾߸��� ���̴�. ���� �ູ������ �󸶳� ������ �λ��� �ǿ� �Ƹ��ٿ��? �� ���� ������ ��ģ �ΰ��� �ξ�, ������ ������ �Ͽ�����, �̰��̴�. �̼��� �̻��� ���� �α� �����ϰ� ������ ���Ͽ� ã�ƴٳ൵, �����Ϸ�?

���̴� ���� ����� ���� û���� �̻��� ���̴�. ������ �ִ� �ǿ� ����, ã�ƴٳ൵, ��Ⱑ ���� Ÿ������ ���ٶ��̴�. ��߿� �׵��� ���� �����ϰ� �̻��� ��ġ�� ������ ũ�� ����� ���ٶ��̴�. �ӿ��� ���� �Ǿ�� ��´�. ���� �ǰ� û�� �ǰ�, Ǯ�� �ڽŰ� ���� ���Ͽ���. Ʈ��, ���� ������ �ƴ��� �����ϰ�, ���� �Ǵ�. õ�ڸ�ȫ�� ������ �ҷ� �縷�̴�. ������ ������ �߰ſ�����, �ǰ� �� �󸶳� öȯ�Ͽ��°�? �ΰ��� ���� ���� ���� �̹��� ������ ��ġ�� ���л��̴�.

������ ���� ���� �ǰ� ���̴�. �������, ������ ��ġ�� �ִ� ��Ȳ�Ͽ���, ���. ������ ������ �Ͽ��� �Ƿ��Ͽ�, �̼��� �ΰ��� �ΰ��� ���� ���� öȯ�Ͽ��°�? �α� ���� �Ǿ�� �̻� ������ �縷�̴�. ��Ȳ�Ͽ���, ���� �� Ȳ�ݽô��. �׵��� ���� ������ ���Ͽ���. �ִ� �׵��� ����� �ǰ� ����� ������ ���̴�. �󸶳� ������ �λ��� ���̴�. ���� �̻�, ������ �ϴ� ��߿� ���Ͽ���.

�̻��� �������ν� ������ ������ �λ��� ���̴�. �Ǵ� �Ҿ� �ٸ� �츮�� �װ��� ���Ͽ� ���, ���̴�. ������ ���� ���ҳ⿡�Լ� �縷�̴�. ������ Ǯ�翡 ������, �ǰ�, ����� ���̸�, �װ��� ������ �󸶳� ���ִ�. �׷��Ƿ� ������ ���Ͽ� ���̴�. �λ��� �� ���ҳ⿡�Լ� ���� û���� �λ��� ������ ���ٶ��̴�. �ǰ� ��⸸ ���߿��� �� ���� ������ ������, �۰� ���� �׸��Ͽ��°�? ������ ���, �ٸ� ���̴�. �̻��� �ƴ��� ���� ������ �ǰ� �ϴ� ����� �̰��̾߸��� Ȳ�ݽô��. û�� �������, �̹��� ��Ȳ�Ͽ�����, �ʹ� ����, ���� �׵��� �縷�̴�.');

-- - LOB, Large OBject
--		���� ���� ������
--		�ִ� ũ��� 4GB
--		���̺� ���� �÷� ���� ����
--		���������� ������
--		���̺��� �� �������� ��ġ�� ����
--		�� �����ʹ� ���� �����
-- - BLOB : ���̳ʸ� LOB
-- - CLOB : (����)���� LOB (DMBS�� ��������)

-- CLOB
CREATE TABLE type_test_08(
    data CLOB
);
INSERT INTO type_test_08
VALUES('���� �󸶳� ����, ���̴�. ���� �����̽��� Ȳ�ݽô븦 Ǯ�� ���̴�. ���̴�.����, �ǰ� ������ �����Ϸ�? ������ �̻��� �� �Ͽ�����, �츮 �츮�� ������ �̰��� ���̴�. ������ �Ǵ� ���� �ִ� û���� ���. ���� �Ҿ� ����� ������ �Ƹ��ٿ��? õ�ڸ�ȫ�� ������ ���Ͽ�, �� ������ ���� ����. �Ƹ���� ���� �� ��Ȳ�Ͽ�����, �̰��̾߸��� ���̴�. ���� �ູ������ �󸶳� ������ �λ��� �ǿ� �Ƹ��ٿ��? �� ���� ������ ��ģ �ΰ��� �ξ�, ������ ������ �Ͽ�����, �̰��̴�. �̼��� �̻��� ���� �α� �����ϰ� ������ ���Ͽ� ã�ƴٳ൵, �����Ϸ�?

���̴� ���� ����� ���� û���� �̻��� ���̴�. ������ �ִ� �ǿ� ����, ã�ƴٳ൵, ��Ⱑ ���� Ÿ������ ���ٶ��̴�. ��߿� �׵��� ���� �����ϰ� �̻��� ��ġ�� ������ ũ�� ����� ���ٶ��̴�. �ӿ��� ���� �Ǿ�� ��´�. ���� �ǰ� û�� �ǰ�, Ǯ�� �ڽŰ� ���� ���Ͽ���. Ʈ��, ���� ������ �ƴ��� �����ϰ�, ���� �Ǵ�. õ�ڸ�ȫ�� ������ �ҷ� �縷�̴�. ������ ������ �߰ſ�����, �ǰ� �� �󸶳� öȯ�Ͽ��°�? �ΰ��� ���� ���� ���� �̹��� ������ ��ġ�� ���л��̴�.

������ ���� ���� �ǰ� ���̴�. �������, ������ ��ġ�� �ִ� ��Ȳ�Ͽ���, ���. ������ ������ �Ͽ��� �Ƿ��Ͽ�, �̼��� �ΰ��� �ΰ��� ���� ���� öȯ�Ͽ��°�? �α� ���� �Ǿ�� �̻� ������ �縷�̴�. ��Ȳ�Ͽ���, ���� �� Ȳ�ݽô��. �׵��� ���� ������ ���Ͽ���. �ִ� �׵��� ����� �ǰ� ����� ������ ���̴�. �󸶳� ������ �λ��� ���̴�. ���� �̻�, ������ �ϴ� ��߿� ���Ͽ���.

�̻��� �������ν� ������ ������ �λ��� ���̴�. �Ǵ� �Ҿ� �ٸ� �츮�� �װ��� ���Ͽ� ���, ���̴�. ������ ���� ���ҳ⿡�Լ� �縷�̴�. ������ Ǯ�翡 ������, �ǰ�, ����� ���̸�, �װ��� ������ �󸶳� ���ִ�. �׷��Ƿ� ������ ���Ͽ� ���̴�. �λ��� �� ���ҳ⿡�Լ� ���� û���� �λ��� ������ ���ٶ��̴�. �ǰ� ��⸸ ���߿��� �� ���� ������ ������, �۰� ���� �׸��Ͽ��°�? ������ ���, �ٸ� ���̴�. �̻��� �ƴ��� ���� ������ �ǰ� �ϴ� ����� �̰��̾߸��� Ȳ�ݽô��. û�� �������, �̹��� ��Ȳ�Ͽ�����, �ʹ� ����, ���� �׵��� �縷�̴�.');
SELECT * FROM type_test_08;

-- LOB �Ϻ� ��ȸ�ϱ�
SELECT DBMS_LOB.SUBSTR(data, 10, 2) FROM type_test_08;
-- LOB ��ü ��ȸ�ϱ�
SELECT DBMS_LOB.SUBSTR(data, length(data), 1)
FROM type_test_08;

-- - NCLOB : (����)���� LOB (DMBS���� ������ ���� ǥ�� ��������)
-- - RAW, LONG RAW
--		�̹����� ���� ������ �� ���
--		���� �����Ͱ� ����ǰ� 16���� ǥ���ȴ�
--		���� ��ȯ X
--		(��������.. LOB ������)




-- ��������, �������
-- + �������, Constraints
--	- ���̺� �������� �����Ͱ� �ԷµǴ� ���� ���� �뵵�� ����ϴ� ���� ����
--	- ������ ���Ἲ�� �����Ѵ�

-- + �������, Constraints
--	- ���̺� �������� �����Ͱ� �ԷµǴ� ���� ���� �뵵�� ����ϴ� ���� ����
--	- ������ ���Ἲ�� �����Ѵ�

-- + ������� �������
--	1. CREATE TABLE������ �÷� ���� �� ���� ����
--	2. ������ TABLE�� ALTER�������� ������� �ݿ�(���̺� ����)
--	** DROP�� ���ؼ� ������� ����

    
-- ������� ��� ������� (�ڷ����)
SELECT * FROM USER_CONSTRAINTS;

-- �÷��� �ش��ϴ� �������(�ڷ����)
SELECT * FROM USER_CONS_COLUMNS;

SELECT
	SUBSTR(A.COLUMN_NAME,1,15) COLUMN_NAME,
	DECODE(B.CONSTRAINT_TYPE,
		'P','PRIMARY KEY',
		'U','UNIQUE KEY',
		'C','CHECK OR NOT NULL',
		'R','FOREIGN KEY'
	) CONSTRAINT_TYPE,
	A.CONSTRAINT_NAME,
    SEARCH_CONDITION
FROM USER_CONS_COLUMNS A, USER_CONSTRAINTS B
WHERE A.TABLE_NAME = UPPER('&table_name')
	AND A.TABLE_NAME = B.TABLE_NAME
	AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
ORDER BY 1; --�÷� ����

SELECT * FROM USER_CONSTRAINTS; -- ������� ��� �������
SELECT * FROM USER_CONS_COLUMNS; -- �÷��� �ش��ϴ� ������� ��ȸ

-- + ������� ����
--	- NOT NULL
--		�÷��� NULL �����, NULL �Է� �Ұ�
--		ALTER ADD CONSTRAINT �� �߰��� �� ����
--		(�÷��� ����Ǵ� ��������̶� �÷��� �����ϰų�
--		CREATE TABLE�� �����ϸ鼭 �÷��� �����ؾ��Ѵ�)

-- NOT NULL
CREATE TABLE cons_01 (
    data VARCHAR2(10) NOT NULL
);
desc cons_01;
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_01');

CREATE TABLE cons_02(
    data VARCHAR2(10) CONSTRAINT cons_02_nn NOT NULL
);

CREATE TABLE cons_03(
    data VARCHAR2(10)
);

--	- UNIQUE
--		�÷��� �ߺ������͸� ������� �ʴ´�
--		(������ ���ϼ�)
--		** �ε����� �����Ѵ�


-- ��������ִ� ���̺� �������� �ݿ�(�����̸� �ʼ�)
ALTER TABLE cons_03
ADD CONSTRAINT cons_03_uq UNIQUE(data);

INSERT INTO cons_03 VALUES('111');

-- NOT NULL �������� �ݿ��ϱ�
ALTER TABLE cons_03
MODIFY data NOT NULL;

--	- CHECK
--		�÷��� �� �� �ִ� �������� ������ �����ϴ� �������
--		WHERE���� ���ǹ��� ������������ �����ϸ� �ȴ�

-- CHECK
CREATE TABLE cons_04(
    data NUMBER CHECK(data >=1 AND data<= 100)
);
INSERT INTO cons_04 VALUES(10);
INSERT INTO cons_04 VALUES(333);
INSERT INTO cons_04 VALUES(100);

-- cons_05 ���̺� ���� (�÷� : data1 NUMBER,data2 NUMBER)

-- ALTER TABLE�� �̿��� data1, data2��
-- ������� CHECK �߰�
-- 1000, 2000, 3000, 4000

CREATE TABLE cons_05(
    data1 NUMBER,
    data2 NUMBER
);

ALTER TABLE cons_05
ADD CONSTRAINT cons_05_ck
CHECK(data1 IN(1000,2000,3000,4000));

ALTER TABLE cons_05
MODIFY data2 CHECK (data2 IN(1000,2000,3000,4000));

INSERT INTO cons_05
values(1000);

--	- DEFAULT
--		�����͸� �Է����� �ʰ� INSERT�� �� �⺻���� �Էµ� �� ����

-- DEFAULT
CREATE TABLE cons_06(
    data1 NUMBER DEFAULT 10,
    data2 DATE,
    data3 VARCHAR2(10)
);
desc cons_06;

-- �������� �ڷ����
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_06');

-- ���̺� �÷� ���� �ڷ����
SELECT * FROM USER_TAB_COLUMNS
WHERE table_name = UPPER('cons_06');

-- ���̺��� �÷� ����
ALTER TABLE cons_06
MODIFY (data2 DEFAULT sysdate);

-- ���̺��� �������� �߰�
ALTER TABLE cons_06
MODIFY( data3 DEFAULT 'HI' NOT NULL);

-- ��������� null�� INSERT�� ������ DEFAULT ���� ����
INSERT INTO cons_06
VALUES(null,null,'AA');
SELECT * FROM cons_06;

INSERT INTO cons_06(data3)
VALUES('BB');

INSERT INTO cons_06(data1)
VALUES(5);

INSERT INTO cons_06; --�ȵ�
INSERT INTO cons_06 VALUES(); --�ȵ�

--	- PRIMARY KEY, PK
--		�⺻Ű, ��Ű
--		���̺��� ��ǥ �÷��� �����ϴ� Ű
--		NOT NULL, UNIQUE �⺻���� �����ִ� ��������
--		(UNIQUE�� ���� �ε����� ������)
--		�ܷ�Ű(FK)���� ������ �� �ִ� �ڰ��� �ο���
--		+ �⺻Ű ���� ���
--			- ���1 : �÷��� ���������̸��� ����ϸ鼭 �����ϱ�
--			CREATE TABLE table_name
--			(	col1 type1 CONSTRAINT cons_name PRIMARY KEY,
--				col2 type2,
--				...
--			);
--			- ���2 : �÷��� ���������̸����� �����ϱ�
--			CREATE TABLE table_name
--			(	col1 type1 PRIMARY KEY,
--				col2 type2,
--				...
--			);
--			- ���3 : �÷����� ���Ŀ� CONSTRAINT Ű����� �����ϱ�
--			CREATE TABLE table_name
--			(
--				col1 type1,
--				col2 type2,
--				....
--				CONSTRAINT constraint_name PRIMARY KEY(col1, col2, ... )
--			);
--			- ���4 : ���̺� ���� ���� ALTER TABLE�� �����ϱ�
--			ALTER TABLE table_name
--			ADD CONSTRAINT constraint_name PRIMARY KEY(col1, col2, ...);

--		- �������� �߰� - PK�߰�
--		ALTER TABLE table_name
--		ADD CONSTRAINT constraint_name PRIMARY KEY(idx);

--		- �������� ���� - PK����
--		ALTER TABLE table_name
--		DROP CONSTRAINT constraint_name;

--		- �������� ��Ȱ��ȭ - PK��� ����
--		ALTER TABLE table_name
--		DISABLE CONSTRAINT constraint_name;

--		- �������� Ȱ��ȭ - ��Ȱ��ȭ�� PK Ȱ��ȭ�ϱ�
--		ALTER TABLE table_name
--		ENABLE CONSTRAINT constraint_name;

-- PRIMARY KEY
CREATE TABLE cons_07(
    no NUMBER CONSTRAINT cons_07_pk PRIMARY KEY,
    data VARCHAR2(20) NOT NULL
);

CREATE TABLE cons_08(
    no NUMBER PRIMARY KEY
);
CREATE TABLE cons_09(
    no NUMBER,
    data VARCHAR2(20),
    
    CONSTRAINT cons_09_pk PRIMARY KEY(no, data)
);

CREATE TABLE cons_10(
    idx NUMBER,
    data VARCHAR2(20)
);
-- �������� �߰� - PK�߰�
ALTER TABLE cons_10
ADD CONSTRAINT cons_10_pk PRIMARY KEY(idx);

-- �������� ���� - PK����
ALTER TABLE cons_10
DROP CONSTRAINT cons_10_pk;

-- �������� ��Ȱ��ȭ - PK��� ����
ALTER TABLE cons_10
DISABLE CONSTRAINT cons_10_pk;

-- �������� Ȱ��ȭ - ��Ȱ��ȭ�� PK Ȱ��ȭ�ϱ�
ALTER TABLE cons_10
ENABLE CONSTRAINT cons_10_pk;

-- - FOREIGN KEY, FK
--	�ܷ�Ű, ����Ű, ����Ű
--	�⺻Ű�� �����ϴ� �÷� �Ǵ� �÷���
--	�����ϰ� �ִ� �⺻Ű�� ������Ÿ�԰� ��ġ�ؾ� �Ѵ�.
--	�ܷ�Ű�� �����ϰ� �ִ� �⺻Ű�� ������ �� ����.
--	(�ܷ�Ű�� ���� ����� �⺻Ű ���� ������ ��)
--	+ �ܷ�Ű ���� ���
--	- ���1 : �÷����� ���Ŀ� CONSTRAINT�� �����ϱ�
--	CREATE TABLE table_name
--	(
--			col1 type1,
--			col2 type2,
--			...	,
--			CONSTRAINT constraint_name
--					FOREIGN KEY(col1)
--					REFERENCES r_table_name(r_pk)
--	);
--	- ���2 : ���̺� ���� �� ALTER TABLE�� �����ϱ�
--	ALTER TABLE table_name
--	ADD CONSTRAINT constraint_name
--		  FOREIGN KEY(col1)
--		  REFERENCES r_table_name(r_pk)
--	+ �������� ���� - FK����
--	+ �������� ��Ȱ��ȭ - FK ��� ����
--	+ �������� Ȱ��ȭ - ��Ȱ��ȭ�� FK Ȱ��ȭ�ϱ�
--	- PK�� �����ϰ� �����

-- FOREIGN KEY
desc cons_10;
CREATE TABLE cons_11(
    num NUMBER,
    data VARCHAR2(20),
    CONSTRAINT cons_11_fk
        FOREIGN KEY(num)
        REFERENCES cons_10 (idx)
);

CREATE TABLE cons_12(
    num NUMBER,
    data VARCHAR2(30)
);
ALTER TABLE cons_12
ADD CONSTRAINT cons_12_fk
    FOREIGN KEY (num)
    REFERENCES cons_10(idx);
