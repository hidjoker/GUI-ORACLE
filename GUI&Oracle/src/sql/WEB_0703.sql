-- + DISTINCT
--	- 중복데이터를 제거하는 키워드
--	- SELECT 키워드 바로 뒤에 붙여서 사용
--		SELECT DISTINCT ~~
--	- 여러 칼럼을 조회할 때는 컬럼들을 하나의 그룹으로
--	묶어서 인식한다
--	(조회되는 모든 컬럼의 데이터가 중복될 때 제거한다)
--	** SELECT 키워드와 컬럼리스트 사이에 DISTINCT 적용

-- DISTINCT : 중복값 제거

-- 회사에 존재하는 부서들
SELECT DISTINCT deptno
FROM emp
ORDER BY deptno;
-- 각 부서에 존재하는 직무들
SELECT DISTINCT deptno, job
FROM emp
ORDER BY deptno;

-- 잘못된 사용법(모든 컬럼이 일치해야한다)
SELECT DISTINCT *
FROM emp;

-- + 데이터 연결 연산자 ||
--	- 두 개 이상의 데이터를 하나의 컬럼으로 연결하여 표현할 때 사용
--	- 문자열 두 개 합치기
--	- 문자열 + 숫자
--	- 문자열 + 날짜
--	- 등등...
-- ** ' ' 로 표현된 문자열 내에서 ' 를 사용하고 싶으면 ''를 사용한다
--	ex) 'Bob''s job'
--          ->Bob's job


-- || 문자열 연결 연산자
SELECT
    ename || ' is ' || job AS "EMPLOYEE"
FROM emp;

SELECT
    ename || '''s job is ' || job AS "EMPLOYEE"
FROM emp;

-- + 오라클 내장 함수, SQL Functions
--	- 단일 행 함수
--		테이블 조회에서 사용하면 각 행에 결과가 반영되는 함수
--		문자함수, 숫자함수, 날짜함수, 형변환함수
--		일반함수, 정규식, ...
--	- 그룹 함수 
--		행들을 그룹화하여 하나의 결과를 도출하는 함수
--		집계함수(SUM, AVG, COUNT, ...)
-- + 오라클 11g R2 Reference URL
--	https://docs.oracle.com/cd/E11882_01/server.112/e41084/toc.htm

-- + DUAL 테이블
--	- sys 사용자가 소유하는 테이블(OWNER : sys)
--	- 연산의 결과나 가상컬럼을 확인하는 용도로 제공되는 테이블

-- 단일행 함수 테스트
SELECT
    ename, length(ename)
FROM emp;

-- 그룹함수 테스트
SELECT
    SUM(sal)
FROM emp;

-- DUAL 테이블
SELECT 'Apple' FROM dual;

SELECT 10+20 FROM dual;
desc dual;

-- + 단일 행 함수, Single Row Function
--	- 숫자 함수, Numeric Function
--		JAVA의 Math클래스의 메소드들과 유사함

-- 숫자 함수
SELECT abs(-445) FROM dual; --절대값

-- 12.523 -> 소수점이하 반올림
SELECT ROUND(12.523,0) FROM dual;
-- -12.723 -> 소수점이하 반올림
SELECT ROUND(-12.723,0) FROM dual;
-- 12.567 -> 소수점 3째자리에서 반올림
SELECT ROUND(12.567, 2) FROM dual;
-- 12345 -> 1의 자리에서 반올림
SELECT ROUND(12345, -1) FROM dual;
-- 56789 -> 10의 자리에서 반올림
SELECT ROUND(56789, -2) FROM dual;

-- 12.456 -> 소수점이하 버림
--SELECT FLOOR(12.456) FROM dual;
SELECT TRUNC(12.456) FROM dual;
-- 12.456 -> 소수점 3째 자리에서 버림
--SELECT (FLOOR(12.456*100))/100 FROM dual;
SELECT TRUNC(12.456,2) FROM dual;
-- 12345 -> 1의 자리에서 버림
--SELECT (FLOOR(12345/10))*10 FROM dual;
SELECT TRUNC(12345,-1) FROM dual;
-- 56789 -> 10의 자리에서 버림
--SELECT (FLOOR(56789/100))*100 FROM dual;
SELECT TRUNC(56789,-2) FROM dual;

-- 13을 8로 나눈 나머지
SELECT MOD(13,8) FROM dual;

-- 12.345올림 -> 13
SELECT CEIL(12.345) FROM dual;

-- -12.567올림 -> -12
SELECT CEIL(-12.567) FROM dual;

-- 12.567 내림 -> 12
SELECT FLOOR(12.567) FROM dual;
-- 12.123 내림 -> 12
SELECT FLOOR(12.123) FROM dual;
-- -12.567 내림 -> -13
SELECT FLOOR(-12.567) FROM dual;
-- -12.123 내림 -> -13
SELECT FLOOR(-12.123) FROM dual;

-- 3의 4제곱 -> 81
SELECT POWER(3,4) FROM dual;
-- 3의 -1제곱 -> 0.33333333
SELECT POWER(3,-1) FROM dual;

-- 9의 제곱근 -> 3
SELECT sqrt(9) FROM dual;
-- 11의 제곱근 -> 3.3166..
SELECT sqrt(11) FROM dual;


--	- 문자 함수, Character Function
--		1. 반환값이 문자인 문자함수
--		2. 반환값이 숫자인 문자함수

-- 문자 함수

-- length()
SELECT length(ename)FROM emp;
SELECT length('Apple')FROM dual;
SELECT length('안녕')FROM dual;

-- lengthb()
SELECT lengthb('Apple')FROM dual;
SELECT lengthb('안녕')FROM dual;

-- substr()
SELECT substr('Hello Oracle', 3) FROM dual;

-- 'hELlo' 모두 대문자로 변환 -> HELLO
SELECT UPPER('hELlo') FROM dual;
-- 'hELlo' 모두 소문자로 변환 -> hello
SELECT LOWER('hELlo') FROM dual;
-- 'hELlo' 이니셜(첫글자) 대문자 -> Hello
SELECT NLS_INITCAP('hELlo') FROM dual;

-- 'Alice Bob'의 문자열 길이 -> 9
SELECT LENGTH('Alice Bob') FROM dual;
-- '안녕하세요'의 문자열 길이 -> 5
SELECT LENGTH('안녕하세요') FROM dual;

-- 'Alice BOb' 문자열 바이트 수 -> 9
SELECT LENGTHB('Alice Bob') FROM dual;
-- 'ACE 안녕하세요' 문자열 바이트 수 -> 19
SELECT LENGTHB('ACE 안녕하세요') FROM dual;
-- (오라클은 한글 인코딩을 UTF-8을 기본으로 하며
--  UTF-8은 한글 한글자에 3바이트가 필요하다)

-- 'ABCDEFGHI'에서 'D'의 위치 -> 4
SELECT instr('ABCDEFGHI','D') FROM dual;
--SELECT REGEXP_INSTR('ABCDEFGHI', 'D') FROM dual;
-- 'ABCDEFGHI'에서 'DEF'문자열의 위치 ->4
SELECT instr('ABCDEFGHI','DEF')FROM dual;
--SELECT REGEXP_INSTR('ABCDEFGHI','DEF') FROM dual;
-- 'ABCDEFGHI'에서 'DF'문자열의 위치 ->0
SELECT instr('ABCDEFGHI','DF')FROM dual;
--SELECT REGEXP_INSTR('ABCDEFGHI','DF') FROM dual;
-- '안녕하세요'에서 '하'문자열의 위치 ->3
SELECT instr('안녕하세요','하')FROM dual;
SELECT REGEXP_INSTR('안녕하세요','하')FROM dual;
-- 'ABCABCDDD'에서 'C'문자열의 위치 ->3
SELECT instr('ABCABCDDD','C')FROM dual;
SELECT REGEXP_INSTR('ABCABCDDD','C')FROM dual;

--'Oracle SQL Developer'에서 5번째 인덱스 이후의 문자열로 자르기
SELECT SUBSTR('Oracle SQL Developer',6) FROM dual;
--'Oracle SQL Developer'에서 5번째 인덱스부터 5글자로 자르기
SELECT SUBSTR('Oracle SQL Developer',6,5) FROM dual;
--'오라클 SQL'에서 2번쨰 인덱스부터 5글자로 자르기
SELECT SUBSTR('오라클 SQL',2,5)FROM dual;
SELECT SUBSTRb('오라클 SQL',2,5)FROM dual;
--'안녕하세요오라클'에서 3번째 부터 자르기
SELECT SUBSTR('안녕하세요오라클',3)FROM dual;
SELECT SUBSTRb('안녕하세요오라클',3)FROM dual;

SELECT empno+1000, initcap(ename)
FROM emp
WHERE ename = 'SMITH'; --from -> where -> select 순으로 처리

-- LEFT PADDING
-- 문자열을 위한 공간을 확보하고 빈공간은 설정된 문자로 채운다
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

--	- 날짜 함수, Datetime Function
--		DATE, TIMESTAMP, INTERVAL 타입에 적용되는 날짜관련 함수
-- 		** sysdate
--		 현재날짜(시간포함)을 반환하는 함수
--		 매개변수없음
--		  sysdate() 형식으로 사용하지 않고
--		  sysdate 라고만 사용한다
--		ex) SELECT sysdate FROM dual;

-- 날짜 함수
SELECT sysdate FROM dual;

SELECT 
    TO_CHAR(TRUNC(sysdate), 'YYYY/MM/DD HH24:MI:SS') AS "NOW" -- ""식별자 as생략 가능
FROM dual;

-- months_between : 두 datetime 사이의 개월 수 차이 계산
SELECT
    MONTHS_BETWEEN('18-01-01', '18/02/01')"1",
    MONTHS_BETWEEN('18/01/01', '18/02/15')"2",
    ROUND(MONTHS_BETWEEN('18/01/01', '18/02/15'),2)"3"
FROM dual;

-- 몇개월차인지 조회
SELECT
    ename,
    months_between(sysdate, hiredate)"diff"
FROM emp;

-- datetime 에 덧셈하기
SELECT
    sysdate + 100
FROM dual;

-- last_day : 지정된 datetime의 해당 월 마지막 날 반환
SELECT
    last_day(sysdate),
    last_day('16/2/7')
FROM dual;

-- next_day
SELECT
    next_day(sysdate, '금')
FROM dual;

-- date 타입과 timestamp 타입의 현재 datetime
SELECT
    sysdate,
    systimestamp
FROM dual;

--	- (형)변환 함수, Conversion Function
--		TO_NUMBER : NUMBER 포맷의 VARCHAR2  ---> NUMBER
--		TO_CHAR : NUMBER, DATE ---> 원하는 포맷의 VARCHAR2
--		TO_DATE : DATETIME 포맷의 VARCHAR2 -----> DATETIME
--
--                  TO_CHAR       문자       TO_DATE        날짜
--숫자            ----------->  (varchar2)  ---------->      (DATETIME)
--(NUMBER)     <----------                  <----------
--                   TO_NUMBER               TO_CHAR

-- to_number
SELECT
    '123123' + 1111111 --자동 형변환
--    to_number('123123')+111111 
FROM dual;

-- to_date
SELECT
    '17/10/9', -- + 5 문자타입이므로 + 연산 불가
    to_date('17/10/9') + 5
FROM dual;

SELECT
    to_date('12 1 11'),
    to_date('12 1 11', 'dd mm yy')
FROM dual;

-- + TO_CHAR(number)
--		NUMBER -> VARCHAR2
--	- TO_CHAR(number)
--	- TO_CHAR(number, 숫자 서식 지정문자)

-- + 숫자 서식 지정문자
--	- 0 : 숫자가 들어갈 자리를 확보, 남는 자리는 0으로 LPAD
--	- 9 : 숫자가 들어갈 자리를 확보, 남는 자리는 ' '으로 LPAD
--	- , : 자릿수 구분 문자 추가
--	- . : 소수부 구분 문자 추가
--	- $ : 통화기호 $를 추가
--	- L : 세계 통화기호 추가(설정된 통화(LOCALE)을 따라감, 한국 : \)
--	- 소수점 이하 부분은 지정문자가 부족하면 반올림
--	- 숫자가 부족하면 0으로 RPAD
--	- 정수부 지정문자가 부족하면 #으로 에러처리
-- + NUMBER 데이터타입
--	- 숫자를 표현하는 데이터타입
--	- 정수, 실수를 구분하지 않음
--	- NUMBER : 38자리까지 표현가능한 숫자
--	- NUMBER(n) : n자리까지 표현가능한 숫자
--	- NUMBER(n, m) : n자리를 표현할 수 있고 소수부분이 m개인 숫자
--		ex) NUMBER(7, 2) : 7자리 표현, 소수부는 2자리

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
    to_char(12345, 'L999999')"4" -- 한국통화 \로 표현
FROM dual;

SELECT
    to_char(12345.6789)"1",
    to_char(12345.6789, '99999.99')"2",
    to_char(12345.6789, '9,999,999.99')"3",
    to_char(12345.6, '99,999.99')"4" --소수부분은 자릿수만큼 0을 채움
FROM dual;