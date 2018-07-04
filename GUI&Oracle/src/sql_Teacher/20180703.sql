

-- DISTINCT : 중복값 제거

-- 회사에 존재하는 부서들
SELECT DISTINCT
    deptno
FROM emp
ORDER BY deptno;

-- 각 부서에 존재하는 직무들
SELECT DISTINCT
    deptno, job
FROM emp
ORDER BY deptno;

-- 잘못된 사용법 (모든 컬럼이 일치해야한다)
SELECT DISTINCT
    *
FROM emp;





-- || 문자열 연결 연산자
SELECT
    ename || ' is ' || job AS "EMPLOYEE"
FROM emp;

SELECT
    ename || '''s job is ' || job AS "EMPLOYEE"
FROM emp;



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





-- 숫자 함수
SELECT abs(-445) FROM dual; --절대값

-- 12.523 -> 소수점이하 반올림
-- -12.723 -> 소수점이하 반올림
-- 12.567 -> 소수점 3째자리에서 반올림
-- 12345 -> 1의 자리에서 반올림
-- 56789 -> 10의 자리에서 반올림

-- 12.456 -> 소수점이하 버림
-- 12.456 -> 소수점 3째자리에서 버림
-- 12345 -> 1의자리에서 버림
-- 56789 -> 10의자리에서 버림

-- 13을 8로 나눈 나머지

-- 12.345 올림 -> 13
-- -12.567 올림 -> -12

-- 12.567 내림 -> 12
-- 12.123 내림 -> 12
-- -12.567 내림 -> -13
-- -12.123 내림 -> -13

-- 3의 4제곱 -> 81
-- 3의 -1 제곱 -> 0.33333333333

-- 9의 제곱근 -> 3
-- 11의 제곱근 -> 3.3166...

--------------------------------------------------------
-- 12.523 -> 소수점이하 반올림
SELECT round(12.523) FROM dual;
-- -12.723 -> 소수점이하 반올림
SELECT round(-12.723) FROM dual;
-- 12.567 -> 소수점 3째자리에서 반올림
SELECT round(12.567, 2) FROM dual;
-- 12345 -> 1의 자리에서 반올림
SELECT round(12345, -1) FROM dual;
-- 56789 -> 10의 자리에서 반올림
SELECT round(56789, -2) FROM dual;

-- 12.456 -> 소수점이하 버림
SELECT trunc(12.456) FROM dual;
-- 12.456 -> 소수점 3째자리에서 버림
SELECT trunc(12.456, 2) FROM dual;
-- 12345 -> 1의자리에서 버림
SELECT trunc(12345, -1) FROM dual;
-- 56789 -> 10의자리에서 버림
SELECT trunc(56789, -2) FROM dual;

-- 13을 8로 나눈 나머지
SELECT mod(13, 8) FROM dual;

-- 12.345 올림 -> 13
SELECT ceil(12.345) FROM dual;
-- -12.567 올림 -> -12
SELECT ceil(-12.567) FROM dual;


-- 12.567 내림 -> 12
SELECT floor(12.567) FROM dual;
-- 12.123 내림 -> 12
SELECT floor(12.123) FROM dual;
-- -12.567 내림 -> -13
SELECT floor(-12.567) FROM dual;
-- -12.123 내림 -> -13
SELECT floor(-12.123) FROM dual;

-- 3의 4제곱 -> 81
SELECT power(3, 4) FROM dual;
-- 3의 -1 제곱 -> 0.33333333333
SELECT power(3, -1) FROM dual;

-- 9의 제곱근 -> 3
SELECT sqrt(9) FROM dual;
-- 11의 제곱근 -> 3.3166...
SELECT sqrt(11) FROM dual;


-- 문자 함수

-- length()
SELECT length(ename) FROM emp;
SELECT length('Apple') FROM dual;
SELECT length('안녕') FROM dual;

-- lengthb()
SELECT lengthb('Apple') FROM dual;
SELECT lengthb0('안녕') FROM dual;


-- substr()
SELECT substr('Hello Oracle', 3) FROM dual;





-- 'hELlo' 모두 대문자로 변환 -> HELLO
-- 'hELlo' 모두 소문자로 변환 -> hello
-- 'hELlo' 이니셜(첫글자) 대문자 -> Hello

-- 'Alice Bob'의 문자열 길이 -> 9
-- '안녕하세요'의 문자열 길이 -> 5

-- 'Alice Bob' 문자열 바이트 수 -> 9
-- 'ACE 안녕하세요'문자열 바이트 수 -> 19
-- (오라클은 한글 인코딩을 UTF-8을 기본으로 하며
--  UTF-8은 한글 한글자에 3바이트가 필요하다)

-- 'ABCDEFGHI'에서 'D' 의 위치 -> 4
-- 'ABCDEFGHI'에서 'DEF'문자열의 위치 ->4
-- 'ABCDEFGHI'에서 'DF'문자열의 위치 -> 0
-- '안녕하세요'에서 '하'문자열의 위치 -> 3
-- 'ABCABCDDD'에서 'C'문자열의 위치 -> 3

--'Oracle SQL Developer'에서 5번째 인덱스 이후의 문자열로 자르기
--'Oracle SQL Developer'에서 5번째 인덱스부터 5글자로 자르기
--'오라클 SQL'에서 2번째 인덱스부터 5글자로 자르기
--'안녕하세요오라클'에서 3번째 부터 자르기


-----------------------------------------------

-- 'hELlo' 모두 대문자로 변환 -> HELLO
SELECT UPPER('hELlo') FROM dual;

SELECT * FROM emp
WHERE ename = UPPER('smith');

-- 'hELlo' 모두 소문자로 변환 -> hello
SELECT LOWER('hELlo') FROM dual;

-- 'hELlo' 이니셜(첫글자) 대문자 -> Hello
SELECT INITCAP('hELlo') FROM dual;


-- 'Alice Bob'의 문자열 길이 -> 9
SELECT length('Alice Bob') FROM dual;
-- '안녕하세요'의 문자열 길이 -> 5
SELECT length('안녕하세요') FROM dual;

-- 'Alice Bob' 문자열 바이트 수 -> 9
SELECT lengthb('Alice Bob') FROM dual;

-- 'ACE 안녕하세요'문자열 바이트 수 -> 19
SELECT lengthb('ACE 안녕하세요') FROM dual;
-- (오라클은 한글 인코딩을 UTF-8을 기본으로 하며
--  UTF-8은 한글 한글자에 3바이트가 필요하다)

-- 'ABCDEFGHI'에서 'D' 의 위치 -> 4
SELECT instr('ABCDEFGHI', 'D') FROM dual;
-- 'ABCDEFGHI'에서 'DEF'문자열의 위치 ->4
SELECT instr('ABCDEFGHI', 'DEF') FROM dual;
-- 'ABCDEFGHI'에서 'DF'문자열의 위치 -> 0
SELECT instr('ABCDEFGHI', 'DF') FROM dual;
-- '안녕하세요'에서 '하'문자열의 위치 -> 3
SELECT instr('안녕하세요', '하') FROM dual;
SELECT instrb('안녕하세요', '하') FROM dual;
-- 'ABCABCDDD'에서 'C'문자열의 위치 -> 3
SELECT instrb('ABCABCDDD', 'C') FROM dual;


--'Oracle SQL Developer'에서
--5번째 인덱스 이후의 문자열로 자르기
SELECT substr('Oracle SQL Developer', 6) FROM dual;

--'Oracle SQL Developer'에서
--5번째 인덱스부터 5글자로 자르기
SELECT substr('Oracle SQL Developer', 6, 5) FROM dual;

--'오라클 SQL'에서 2번째 인덱스부터 5글자로 자르기
SELECT substr('오라클 SQL', 2, 5) FROM dual;
SELECT substrb('오라클 SQL', 2, 5) FROM dual;

--'안녕하세요오라클'에서 3번째 부터 자르기
SELECT substr('안녕하세요오라클', 3) FROM dual;
SELECT substrb('안녕하세요오라클', 3) FROM dual;


SELECT empno+1000, initcap(ename)
FROM emp
WHERE ename = 'SMITH';


-- LEFT PADDING
--  문자열을 위한 공간을 확보하고 빈공간은 설정된 문자로 채운다
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





-- 날짜 함수
SELECT sysdate FROM dual;

SELECT
    TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') NOW
FROM dual;


-- months_between : 두 datetime 사이의 개월 수 차이 계산
SELECT
    MONTHS_BETWEEN('18-01-01', '18/02/01') "1",
    MONTHS_BETWEEN('18/01/01', '18/02/15') "2",
    ROUND(MONTHS_BETWEEN('18/01/01', '18/02/15'), 2)"3"
FROM dual;

-- 몇개월차인지 조회
SELECT
    ename,
    months_between(sysdate, hiredate) "diff"
FROM emp;

select * from emp;


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
    '17/10/9', -- + 5  문자타입이므로 + 연산 불가
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
    to_char(12345, 'L999999') "4" -- 한국통화 \로 표현
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