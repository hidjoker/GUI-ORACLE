--+ 오라클 데이터베이스 자료형
-- - NUMBER <-> int(자바)
--	숫자 타입
--	정수, 실수 구분없음(소수점 자리를 지정하지 않으면 정수)
--	음수, 양수, 0 저장 가능
--	숫자 계산이 필요한 컬럼에 지정
--	가변길이 타입
-- - NUMBER : 최대 38자리까지 저장가능한 타입
-- - NUMBER(w) : 최대 w자리까지 저장가능한 타입(최대38)
-- - NUMBER(w, d) : 전체 w자리, 소수점이하 d자리 지정
--  (w-d 만큼 정수자리, d만큼 소수자리 확보
--  (w-d 음수 n이면, 소수점이하 n+1자리부터 d개 표현가능)
--  (w-d 음수 n이면, 소수점이하 n자리까지 숫자0개, 이후 d개 표현가능)
-- - VARCHAR2(n)
--	가변 길이 문자 데이터
--	실제 저장되는 데이터의 크기만큼만 저장공간을 사용한다
--	최대 n의 길이를 가질 수 있다(영문자 개수)
--	최소 크기는 1
--	ex) varchar2(50) -> 'Alce'
--			45바이트는 만들지 않고, 5바이트만 차지한다
--	** 한글 인코딩(character set)이 UTF8이면 한글자당 3바이트
--	** n에 BYTE or CHAR 접미어를 붙일 수 있다
--	** BYTE는 바이트그기
--	** CHAR는 문자개수
-- - CHAR(n)
--	고정 길이 문자 데이터
--	n으로 지정된 크기만큼 저장 공간을 사용한다
--	최소 크기 1
--	** VARCHAR2와 CHAR는 문자를 표현하는 방식은 같고 저장방식만 다르다

-- CHAR(n)
CREATE TABLE type_test_04(
    data1 CHAR,
    data2 CHAR(10),
    data3 CHAR(10 CHAR)
    --, data4 VARCHAR2 --VARCHAR2는 반드시 크기 지정해야 함
);

INSERT INTO type_test_04
VALUES ('1', '1234567890', '1234567890');

INSERT INTO type_test_04(data2, data3)
VALUES('가나다','일이삼사오육칠팔구십');

INSERT INTO type_test_04(data2, data3)
VALUES('12345','12345');

SELECT TRIM(data1), TRIM(data2), TRIM(data3) FROM type_test_04;

-- - DATE
--	날짜시간타입(datetime)
--	날짜와 시간을 저장할 수 있는 타입
--	** sysdate : 현재 DATETIME을 반환하는 함수
--	세기, 년도, 월, 일, 시간, 분, 초, 요일, 오전오후 등을 포함
--	BC 4712/01/01 ~ AD 4712/12/31 의 표현 범위를 가짐
--	+ to_date에서 두 자리로 연도를 표현할 때 rr, yy의 차이
--		- yy : 현재 년도 앞 두자리가 붙는다(현재 세기)
--			ex)to_date('14/7/3', 'yy/mm/dd') -> 2014년
--	             to_date('88/7/7', 'yy/mm/dd') -> 2088년
--		- rr : 현재 년도에 따라 달라진다
--			현재년도	입력년도	결과
--			00~49		00~49		현재 세기
--			00~49		50~99		이전 세기
--			50~99		00~49		다음 세기
--			50~99		50~99		현재 세기
--			ex)
--			2015년		28/8/7		2028년
--			2028년		60/3/8		1960년
--			2077년		20/10/7		2120년
--			2079년		93/8/13		2092년

CREATE TABLE type_test_05(
    data DATE
);
SELECT TO_CHAR(data,'sYYYY/mm/dd hh24:mi:ss') FROM type_test_05;
INSERT INTO type_test_05 VALUES (sysdate);
INSERT INTO type_test_05 VALUES ('2020/11/21');

INSERT INTO type_test_05
VALUES (to_date('-2012/11/24','syyyy/mm/dd')); 
--음수 date형식은 문자열로 인식하기 때문에 to_date로 포맷하여 형변환을 해준다

-- 년도 YY, RR
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
--		DATETIME(날짜시간_ 타입
--		DATE 타입의 확장형
--		밀리초까지 저장 가능한 타입

CREATE TABLE type_test_06(
    data TIMESTAMP
);
INSERT INTO type_test_06
VALUES(systimestamp);
SELECT * FROM type_test_06;

-- - LONG
--		가변 길이 문자형
--		최대 크기 2GB
--		테이블에 한 개 컬럼만 지정 가능
--		테이블 내에 데이터를 직접 저장
--		+로렘 입숨, Lorem Ipsum
--		- 한글 입숨
--			http://hangul.thefron.me/
--		- 로렘 입숨
--			https://www.lipsum.com/

-- LONG
CREATE TABLE type_test_07(
    data LONG
--    , data2 LONG -- LONG은 테이블 당 한개만 가능
);
INSERT INTO type_test_07 VALUES('안녕하세요');
SELECT * FROM type_test_07;

INSERT INTO type_test_07 VALUES('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis dui non metus dignissim tempor eget sed velit. Mauris nec velit hendrerit, euismod ex ac, scelerisque ligula. Morbi venenatis semper lorem. Cras vitae pharetra nisl. Nunc tempus nisl purus, malesuada sodales elit ultrices in. In elementum orci ac tincidunt sodales. Suspendisse egestas, orci rutrum interdum tempor, mauris dolor finibus orci, quis cursus nunc nisi sed neque. Vestibulum convallis lorem ac tempus iaculis. Aliquam sit amet libero vitae lacus ultricies vestibulum sit amet mattis quam. Vivamus vel dui sed tortor imperdiet rhoncus sit amet ac mauris. Curabitur cursus ipsum sed tortor convallis, ultrices sodales nisi ullamcorper. Proin dapibus, magna at tincidunt hendrerit, enim nunc maximus ante, ac cursus arcu ex quis ipsum.

Fusce vitae risus a neque lobortis porttitor sit amet facilisis lectus. Donec commodo pharetra maximus. Proin ut risus sit amet arcu aliquet consequat. Proin non risus facilisis, cursus ipsum nec, imperdiet justo. Suspendisse imperdiet felis tincidunt nulla faucibus, fermentum molestie sem viverra. Maecenas lobortis lorem dui, a sollicitudin eros eleifend vel. Nullam vitae tincidunt arcu. Praesent ultrices orci vitae mi fringilla posuere. Donec ut nisl et dolor pharetra luctus venenatis in augue. Praesent volutpat nunc mauris, non elementum purus ultricies sed.

Maecenas felis magna, pretium at elementum maximus, egestas quis nisi. Morbi vitae nisi id arcu ultrices laoreet. Nam imperdiet, ante ac sodales euismod, augue nisl mattis arcu, at semper libero tellus et odio. Curabitur faucibus placerat blandit. Suspendisse bibendum fermentum volutpat. Praesent hendrerit mi urna, eu commodo ipsum pulvinar pharetra. Nunc laoreet eu eros id malesuada. Nunc condimentum ipsum justo, vel efficitur urna interdum tempor. Praesent maximus porttitor laoreet. Donec hendrerit tempus tortor, nec cursus diam dapibus nec. Phasellus vel congue lorem. Donec tempor dolor nunc, eget ornare elit porttitor quis. Nulla volutpat id ante pellentesque feugiat. Sed placerat leo ac ante dictum dapibus.

Suspendisse pharetra tellus mauris, vel malesuada mi blandit eu. Morbi nec cursus nisl, sit amet finibus tellus. Sed aliquet nunc quis orci commodo dignissim. Pellentesque euismod ac ex sed ultrices. Sed eu elementum turpis. Aenean tristique, risus nec elementum pharetra, nibh nisi gravida nulla, a porta risus diam non neque. Curabitur vitae nulla laoreet, lacinia nisl in, varius metus. Phasellus eu tellus molestie, iaculis libero et, eleifend nisi. Etiam sed neque ultricies, mattis risus eget, porttitor nulla. Aliquam ultricies sagittis velit.

Proin vitae tortor in libero tristique elementum. Nulla mollis elit eget sem tincidunt consequat. Etiam in tellus ut nisl aliquet accumsan eu vitae enim. Suspendisse maximus sapien velit. Nunc eu bibendum tortor. Fusce non est eu augue tincidunt sollicitudin. In dapibus ipsum ut erat vulputate, egestas dictum sapien accumsan. Donec quis felis quis ex pellentesque molestie. Sed vitae tortor eu sapien vestibulum luctus egestas in leo. Proin elementum, nibh feugiat sollicitudin molestie, enim dolor dapibus justo, id tincidunt sapien purus vehicula leo. Mauris quis commodo magna. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');

INSERT INTO type_test_07 VALUES('가진 얼마나 때에, 것이다. 못할 오아이스도 황금시대를 풀이 것이다. 것이다.보라, 피고 봄날의 쓸쓸하랴? 가슴이 이상의 수 하였으며, 우리 우리의 예수는 이것을 것이다. 스며들어 피는 가는 있는 청춘이 운다. 것은 불어 사랑의 구하지 아름다우냐? 천자만홍이 무엇을 위하여, 새 영락과 예가 보라. 아름답고 새가 새 방황하였으며, 이것이야말로 뿐이다. 없는 행복스럽고 얼마나 굳세게 인생을 피에 아름다우냐? 이 것은 생명을 거친 인간의 맺어, 동력은 때까지 하였으며, 이것이다. 이성은 이상을 같이 두기 현저하게 따뜻한 위하여 찾아다녀도, 쓸쓸하랴?

보이는 싹이 붙잡아 너의 청춘을 이상이 것이다. 무엇이 넣는 피에 같이, 찾아다녀도, 용기가 싸인 타오르고 봄바람이다. 산야에 그들은 끓는 현저하게 이상은 가치를 얼음이 크고 붙잡아 봄바람이다. 속에서 능히 피어나기 듣는다. 많이 피가 청춘 피고, 풀이 자신과 눈이 위하여서. 트고, 보는 설레는 아니한 원대하고, 전인 피다. 천자만홍이 힘차게 불러 사막이다. 석가는 생명을 뜨거운지라, 피가 이 얼마나 철환하였는가? 인간이 많이 눈이 것이 미묘한 영락과 가치를 부패뿐이다.

구하지 오직 싸인 피고 것이다. 살았으며, 심장의 가치를 있는 방황하여도, 운다. 봄날의 스며들어 일월과 되려니와, 이성은 인간에 인간의 별과 같은 철환하였는가? 두기 구할 피어나는 이상 동력은 사막이다. 방황하여도, 것은 새 황금시대다. 그들을 못할 내려온 위하여서. 있는 그들은 충분히 피가 목숨을 설레는 것이다. 얼마나 지혜는 인생을 것이다. 얼음 이상, 무엇을 하는 산야에 위하여서.

이상의 있음으로써 가지에 무한한 인생에 것이다. 피는 불어 꾸며 우리는 그것은 위하여 대고, 것이다. 없으면 같이 유소년에게서 사막이다. 예수는 풀밭에 없으면, 피고, 기관과 바이며, 그것은 긴지라 얼마나 힘있다. 그러므로 군영과 위하여 것이다. 인생을 곧 유소년에게서 너의 청춘의 인생을 따뜻한 봄바람이다. 피고 듣기만 광야에서 꽃 밝은 스며들어 없으면, 작고 옷을 그리하였는가? 굳세게 대고, 꾸며 것이다. 이상이 아니한 생의 무엇을 피가 하는 붙잡아 이것이야말로 황금시대다. 청춘 살았으며, 미묘한 방황하였으며, 귀는 때에, 밥을 그들의 사막이다.');

-- - LOB, Large OBject
--		가변 길이 문자형
--		최대 크기는 4GB
--		테이블에 여러 컬럼 지정 가능
--		참조형으로 동작함
--		테이블에는 실 데이터의 위치만 저장
--		실 데이터는 따로 저장됨
-- - BLOB : 바이너리 LOB
-- - CLOB : (대형)문자 LOB (DMBS의 문자집합)

-- CLOB
CREATE TABLE type_test_08(
    data CLOB
);
INSERT INTO type_test_08
VALUES('가진 얼마나 때에, 것이다. 못할 오아이스도 황금시대를 풀이 것이다. 것이다.보라, 피고 봄날의 쓸쓸하랴? 가슴이 이상의 수 하였으며, 우리 우리의 예수는 이것을 것이다. 스며들어 피는 가는 있는 청춘이 운다. 것은 불어 사랑의 구하지 아름다우냐? 천자만홍이 무엇을 위하여, 새 영락과 예가 보라. 아름답고 새가 새 방황하였으며, 이것이야말로 뿐이다. 없는 행복스럽고 얼마나 굳세게 인생을 피에 아름다우냐? 이 것은 생명을 거친 인간의 맺어, 동력은 때까지 하였으며, 이것이다. 이성은 이상을 같이 두기 현저하게 따뜻한 위하여 찾아다녀도, 쓸쓸하랴?

보이는 싹이 붙잡아 너의 청춘을 이상이 것이다. 무엇이 넣는 피에 같이, 찾아다녀도, 용기가 싸인 타오르고 봄바람이다. 산야에 그들은 끓는 현저하게 이상은 가치를 얼음이 크고 붙잡아 봄바람이다. 속에서 능히 피어나기 듣는다. 많이 피가 청춘 피고, 풀이 자신과 눈이 위하여서. 트고, 보는 설레는 아니한 원대하고, 전인 피다. 천자만홍이 힘차게 불러 사막이다. 석가는 생명을 뜨거운지라, 피가 이 얼마나 철환하였는가? 인간이 많이 눈이 것이 미묘한 영락과 가치를 부패뿐이다.

구하지 오직 싸인 피고 것이다. 살았으며, 심장의 가치를 있는 방황하여도, 운다. 봄날의 스며들어 일월과 되려니와, 이성은 인간에 인간의 별과 같은 철환하였는가? 두기 구할 피어나는 이상 동력은 사막이다. 방황하여도, 것은 새 황금시대다. 그들을 못할 내려온 위하여서. 있는 그들은 충분히 피가 목숨을 설레는 것이다. 얼마나 지혜는 인생을 것이다. 얼음 이상, 무엇을 하는 산야에 위하여서.

이상의 있음으로써 가지에 무한한 인생에 것이다. 피는 불어 꾸며 우리는 그것은 위하여 대고, 것이다. 없으면 같이 유소년에게서 사막이다. 예수는 풀밭에 없으면, 피고, 기관과 바이며, 그것은 긴지라 얼마나 힘있다. 그러므로 군영과 위하여 것이다. 인생을 곧 유소년에게서 너의 청춘의 인생을 따뜻한 봄바람이다. 피고 듣기만 광야에서 꽃 밝은 스며들어 없으면, 작고 옷을 그리하였는가? 굳세게 대고, 꾸며 것이다. 이상이 아니한 생의 무엇을 피가 하는 붙잡아 이것이야말로 황금시대다. 청춘 살았으며, 미묘한 방황하였으며, 귀는 때에, 밥을 그들의 사막이다.');
SELECT * FROM type_test_08;

-- LOB 일부 조회하기
SELECT DBMS_LOB.SUBSTR(data, 10, 2) FROM type_test_08;
-- LOB 전체 조회하기
SELECT DBMS_LOB.SUBSTR(data, length(data), 1)
FROM type_test_08;

-- - NCLOB : (대형)문자 LOB (DMBS에서 지정한 국가 표준 문자집합)
-- - RAW, LONG RAW
--		이미지나 사운드 저장할 때 사용
--		이진 데이터가 저장되고 16진수 표현된다
--		문자 변환 X
--		(옛날꺼임.. LOB 쓰세요)




-- 제약조건, 제약사항
-- + 제약사항, Constraints
--	- 테이블에 부적절한 데이터가 입력되는 것을 막는 용도로 사용하는 필터 조건
--	- 데이터 무결성을 유지한다

-- + 제약사항, Constraints
--	- 테이블에 부적절한 데이터가 입력되는 것을 막는 용도로 사용하는 필터 조건
--	- 데이터 무결성을 유지한다

-- + 제약사항 지정방식
--	1. CREATE TABLE문에서 컬럼 지정 시 같이 지정
--	2. 생성된 TABLE에 ALTER구문으로 제약사항 반영(테이블 수정)
--	** DROP을 통해서 제약사항 삭제

    
-- 사용자의 모든 제약사항 (자료사전)
SELECT * FROM USER_CONSTRAINTS;

-- 컬럼에 해당하는 제약사항(자료사전)
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
ORDER BY 1; --컬럼 숫자

SELECT * FROM USER_CONSTRAINTS; -- 사용자의 모든 제약사항
SELECT * FROM USER_CONS_COLUMNS; -- 컬럼에 해당하는 제약사항 조회

-- + 제약사항 종류
--	- NOT NULL
--		컬럼에 NULL 비허용, NULL 입력 불가
--		ALTER ADD CONSTRAINT 로 추가할 수 없다
--		(컬럼에 적용되는 제약사항이라서 컬럼을 변경하거나
--		CREATE TABLE로 생성하면서 컬럼에 적용해야한다)

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
--		컬럼에 중복데이터를 허용하지 않는다
--		(데이터 유일성)
--		** 인덱스를 생성한다


-- 만들어져있는 테이블에 제약조건 반영(제약이름 필수)
ALTER TABLE cons_03
ADD CONSTRAINT cons_03_uq UNIQUE(data);

INSERT INTO cons_03 VALUES('111');

-- NOT NULL 제약조건 반영하기
ALTER TABLE cons_03
MODIFY data NOT NULL;

--	- CHECK
--		컬럼에 들어갈 수 있는 데이터의 범위를 지정하는 제약사항
--		WHERE절의 조건문을 제약조건으로 적용하면 된다

-- CHECK
CREATE TABLE cons_04(
    data NUMBER CHECK(data >=1 AND data<= 100)
);
INSERT INTO cons_04 VALUES(10);
INSERT INTO cons_04 VALUES(333);
INSERT INTO cons_04 VALUES(100);

-- cons_05 테이블 생성 (컬럼 : data1 NUMBER,data2 NUMBER)

-- ALTER TABLE을 이용한 data1, data2의
-- 제약사항 CHECK 추가
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
--		데이터를 입력하지 않고 INSERT할 때 기본으로 입력될 값 지정

-- DEFAULT
CREATE TABLE cons_06(
    data1 NUMBER DEFAULT 10,
    data2 DATE,
    data3 VARCHAR2(10)
);
desc cons_06;

-- 제약조건 자료사전
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_06');

-- 테이블 컬럼 정보 자료사전
SELECT * FROM USER_TAB_COLUMNS
WHERE table_name = UPPER('cons_06');

-- 테이블의 컬럼 변경
ALTER TABLE cons_06
MODIFY (data2 DEFAULT sysdate);

-- 테이블의 제약조건 추가
ALTER TABLE cons_06
MODIFY( data3 DEFAULT 'HI' NOT NULL);

-- 명시적으로 null을 INSERT할 때에는 DEFAULT 동작 안함
INSERT INTO cons_06
VALUES(null,null,'AA');
SELECT * FROM cons_06;

INSERT INTO cons_06(data3)
VALUES('BB');

INSERT INTO cons_06(data1)
VALUES(5);

INSERT INTO cons_06; --안됨
INSERT INTO cons_06 VALUES(); --안됨

--	- PRIMARY KEY, PK
--		기본키, 주키
--		테이블의 대표 컬럼을 지정하는 키
--		NOT NULL, UNIQUE 기본으로 묶여있는 제약조건
--		(UNIQUE에 의해 인덱스도 생성됨)
--		외래키(FK)들이 참조할 수 있는 자격이 부여됨
--		+ 기본키 지정 방식
--			- 방법1 : 컬럼에 제약조건이름을 명시하면서 지정하기
--			CREATE TABLE table_name
--			(	col1 type1 CONSTRAINT cons_name PRIMARY KEY,
--				col2 type2,
--				...
--			);
--			- 방법2 : 컬럼에 제약조건이름없이 지정하기
--			CREATE TABLE table_name
--			(	col1 type1 PRIMARY KEY,
--				col2 type2,
--				...
--			);
--			- 방법3 : 컬럼설정 이후에 CONSTRAINT 키워드로 지정하기
--			CREATE TABLE table_name
--			(
--				col1 type1,
--				col2 type2,
--				....
--				CONSTRAINT constraint_name PRIMARY KEY(col1, col2, ... )
--			);
--			- 방법4 : 테이블 생성 이후 ALTER TABLE로 지정하기
--			ALTER TABLE table_name
--			ADD CONSTRAINT constraint_name PRIMARY KEY(col1, col2, ...);

--		- 제약조건 추가 - PK추가
--		ALTER TABLE table_name
--		ADD CONSTRAINT constraint_name PRIMARY KEY(idx);

--		- 제약조건 삭제 - PK삭제
--		ALTER TABLE table_name
--		DROP CONSTRAINT constraint_name;

--		- 제약조건 비활성화 - PK잠깐 끄기
--		ALTER TABLE table_name
--		DISABLE CONSTRAINT constraint_name;

--		- 제약조건 활성화 - 비활성화된 PK 활성화하기
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
-- 제약조건 추가 - PK추가
ALTER TABLE cons_10
ADD CONSTRAINT cons_10_pk PRIMARY KEY(idx);

-- 제약조건 삭제 - PK삭제
ALTER TABLE cons_10
DROP CONSTRAINT cons_10_pk;

-- 제약조건 비활성화 - PK잠깐 끄기
ALTER TABLE cons_10
DISABLE CONSTRAINT cons_10_pk;

-- 제약조건 활성화 - 비활성화된 PK 활성화하기
ALTER TABLE cons_10
ENABLE CONSTRAINT cons_10_pk;

-- - FOREIGN KEY, FK
--	외래키, 참조키, 보조키
--	기본키를 참조하는 컬럼 또는 컬럼들
--	참조하고 있는 기본키의 데이터타입과 일치해야 한다.
--	외래키가 참조하고 있는 기본키는 삭제할 수 없다.
--	(외래키의 행을 지우고 기본키 행을 지워야 함)
--	+ 외래키 지정 방식
--	- 방법1 : 컬럼설정 이후에 CONSTRAINT로 지정하기
--	CREATE TABLE table_name
--	(
--			col1 type1,
--			col2 type2,
--			...	,
--			CONSTRAINT constraint_name
--					FOREIGN KEY(col1)
--					REFERENCES r_table_name(r_pk)
--	);
--	- 방법2 : 테이블 생성 후 ALTER TABLE로 지정하기
--	ALTER TABLE table_name
--	ADD CONSTRAINT constraint_name
--		  FOREIGN KEY(col1)
--		  REFERENCES r_table_name(r_pk)
--	+ 제약조건 삭제 - FK삭제
--	+ 제약조건 비활성화 - FK 잠깐 끄기
--	+ 제약조건 활성화 - 비활성화된 FK 활성화하기
--	- PK와 동일하게 적용됨

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
