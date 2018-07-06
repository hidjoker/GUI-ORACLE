-- + TO_CHAR( datetime )
--		DATE -> VARCHAR2
-- + TO_CHAR(날짜)
-- + TO_CHAR(날짜, 날짜형식 지정문자)

-- + 날짜형식 지정문자
--  - SCC : 세기
--  - YEAR, year, Year : 년도(영문)
--  - YYYY, YY, YYY, Y : 년도(숫자), Y개수는 년도표현 자리수
--  - MM : 월(숫자)
--  - MONTH, MON : 월(문자)

--  - Q : 분기(1~4)

--  - DD : 월 기준 날짜
--  - D : 주 기준 날짜
--  - DDD : 년 기준 날짜
--  - DAY : 요일
--  - DY : 요일 약자

--  - HH : 시
--  - HH12 : 시(12시간 표기법)
--  - HH24 : 시(24시간 표기법)

--  - MI : 분
--  - SS : 초
--  - FF : 밀리초
--  - AM, PM, A.M., P.M. : 오전 / 오후

-- ** 접미어 서식
--  - TH : 서수 영문
--  - SP : 기수 영문
--  - THSP, SPTH : 서수 영문
--	(앞에오는 서식의 UPPER, LOWER, INITCAP을 따른다)
--	ex) DdSP -> Four

-- ** 밀리초 서식
--  - FF : 밀리초 표현
--   (timesptamp 타입에서 사용가능)
--   (FF2, FF3 처럼 뒤에 숫자 붙여서 자리수 지정 가능)

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
--    to_char(sysdate,'YYYYY'), --YYYY Y 로 인식

--    to_char(sysdate,'MM'),
--    to_char(sysdate,'MONTH'),
--    to_char(sysdate,'MON'),

--    to_char(sysdate,'DD'), --월 날짜
--    to_char(sysdate,'D'), --주 날짜(일요일부터 1)
--    to_char(sysdate,'DDD'), --연 날짜
    
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
--    to_char(sysdate,'AM'), --'A.M.'같음
--    to_char(sysdate,'PM'), --'P.M.'같음 서식문자라 AM,PM상관없이 기준시에 따라 오전,오후 표시
    
--    to_char(sysdate,'YYYY"년" MM"월" DD"일"' || 
--        ' AM HH24"시" MI"분" ss"초" DAY'), --" "안에 문자열을 표시해 줄 수 있음

--    to_char(sysdate,'HH:MI YY-MM/DD'),
--    to_char(sysdate-1,'DDth'),
--    to_char(sysdate-1,'DdSP'),
--    to_char(sysdate,'DDSPTH'),

--    to_char(sysdate,'SYYYY'),
    to_char(to_date(-500,'SYYYY'),'SYYYY'),


-- + 날짜 타입
--	- DATE : 초까지 표현가능한 날짜시간타입
--	- TIMESTAMP : 밀리초까지 표현가능한 날짜시간타입
--	- sysdate : 현재시간(DATE 타입)
--	- systimestamp : 현재시간(TIMESTAMP 타입)

    -- timestamp 데이터타입
    to_char(systimestamp,'MI:SS.ff2')
FROM dual;


-- + 기타 변환함수
--	- NVL
--		NULL인지 판단하여 원하는 값으로 변환하는 함수
--		NVL(컬럼, 원하는 값)
--	- NVL2
--		NULL인지 아닌지 판단하여 원하는 값으로 변환하는 함수
--		NVL2(컬럼, NULL이 아닐 경우 값, NULL일 경우 값)
--	- NULLIF
--		두 개의 값이 같은지 비교하여 같으면 NULL 반환
--		다르면 첫번째 매개변수 반환
--		NULLIF(첫번쨰값, 두번쨰값)
--	- DECODE
--		비교값을 여러 개 나열하여 비교결과를 반환하는 함수
--		DECODE( 기준값,
--					비교값1, 반환값1,
--					비교값2, 반환값2,
--					...
--					비교값3, 반환값3,
--					default값 );


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
        10, '회계팀',
        20, '연구팀',
        30, '영업팀',
        40, '운영팀',
        '부서없음')dname
FROM emp;

--+ CASE 구문
-- - DECODE함수와 비슷한 동작을 하는 조건문
-- - CASE ~ WHEN THEN ~ END로 구성
-- - WHEN THEN의 마지막에 ELSE 추가 가능

-- CASE문
SELECT
    empno, ename, deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END dname
FROM emp;

SELECT
    empno, ename, deptno,
    CASE 
        WHEN job='PRESIDENT' THEN '사장'
        WHEN deptno=10 THEN '회계팀'
        WHEN deptno=20 THEN '연구팀'
        WHEN deptno=30 THEN '영업팀'
        WHEN deptno=40 THEN '운영팀'
        ELSE '부서없음'
    END dname
FROM emp;


--+ 그룹함수
--  - 모든 행을 그룹화하여 하나의 결과를 도출하는 함수

--  - COUNT(n)
--		데이터를 가지고있는 행의 수를 반환
--		NULL은 무시
--		count(1) vs count(*) 이슈가 있지만 똑같으니까 암꺼나 쓰자

--  - SUM : 합계
--  - AVG : 평균

--  - MAX : 최고값
--  - MIN : 최소값

-- + GROUP BY 절
--	- 데이터들을 원하는대로 그룹화할 떄 사용하는 절
--	- 그룹함수와 함께 사용한다
--	- GROUP BY [컬럼]

-- 그룹함수

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

-- + GROUP BY 절
--	- 데이터들을 원하는대로 그룹화할 떄 사용하는 절
--	- 그룹함수와 함께 사용한다
--	- GROUP BY [컬럼]

-- GROUP BY 절
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

-- 조회 컬럼
-- deptno, dname, cnt, tot_sal, avg_sal

-- dname -> 한글로
-- cnt, tot_sal, avg_sal -> 부서별 통계
-- avg_sal -> 소수점 2자리까지


ELECT
    deptno, 
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END dname,
    count(*) cnt, 
    sum(sal) tot_sal, 
    round(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING AVG(sal) > 2000 --그룹함수의 조건절(WHERE)
ORDER BY deptno;

-- + HAVING 절
--	- GROUP BY 절과 함께 쓰이는 조건절
--	- 그룹함수의 결과를 조건식으로 사용하고 싶을 때 사용한다
--	- WHERE절의 기능을 수행한다
--	(단, WHERE절은 그룹함수를 사용할 수 없다)





-- + 조인, JOIN
--	- 두 개 이상의 테이블을 한번에 SELECT하는 방법
--	- Primary Key(PK, 주키, 기본키)와 Foreign Key(FK, 보조키, 외래키)를 이용하여
--  	  테이블을 조인한다
--	** Primary Key
--		테이블의 각 행을 구분하기 위한 식별값으로 쓰이는 컬럼
		--- 기본키 무결성 -----
--		해당 테이블의 컬럼중에서 고유한 값 - UNIQUE
--		NULL일 수 없다 - NOT NULL
		-------------------------
--		ex) dept.deptno
--	** Foreign Key
--		다른 테이블의 컬럼 참조하고 있는 컬럼
--		Primary Key를 참조한다
		--- 외래키 무결성 -----
--		참조대상 이외의 데이터를 가질 수 없다
--		ex) emp.deptno
-- + 조인 문법 종류
--	- 오라클 전용 문법
--	- ANSI 조인 문법(표준)
-- + ANSI : 미국 국립 표준 협회
--		ISO 기구에 속해있음
-- + ISO : 국제 표준화 기구
--		International Standard Organization
-- + IEEE : 전기 전자 기술자 협회




SELECT * FROM emp;
SELECT * FROM dept;


SELECT * FROM emp, dept; -- CROSS JOIN

SELECT * FROM emp NATURAL JOIN dept;

desc emp;

-- + EQUI JOIN, 등가 조인
--	- 조인 대상 테이블들의 공통데이터를 가지는 컬럼을 이용함
--	- 해당 컬럼이 같은 값을 가질 떄 조회되도록 WHERE 절에 적용
--	- 가장 많이 쓰임
--	- 오라클 전용 구문

-- + INNER JOIN, 내부 조인
--	- EQUI JOIN과 같은 조회 결과를 얻을 수 있다
--	- FROM 조인대상테이블 INNER JOIN 조인테이블명 ON 조인조건
--	- EQUI JOIN의 조인조건을 WHERE 대신 ON절에 사용한다
--	- 장점 : 일반조건과 조인조건을 분리해서 볼 수 있다
--	- INNER키워드 생략하고 JOIN키워드만 사용해도 됨

-- + NON-EQUI JOIN, 비등가 조인
--	- 기본 문법은 EQUI JOIN과 같음
--	- 조인조건의 연산자가 '='(equal)이 아닌 조언

-- EQUI JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno --조인조건
    AND empno > 7500 --조회조건
ORDER BY deptno, empno;

-- INNER JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno --조인조건
WHERE empno > 7500 --조회조건
ORDER BY deptno, empno;

-- NON-EQUI JOIN
SELECT * FROM emp;
SELECT * FROM salgrade;

SELECT ename, sal, grade
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal AND S.hisal; 

-- ANSI 표준문법으로 수정
-- ( JOIN 키워드 사용 )

SELECT ename, sal, grade
FROM emp E
INNER JOIN salgrade S
    ON E.sal BETWEEN s.losal AND s.hisal;
