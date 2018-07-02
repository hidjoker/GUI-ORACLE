
-- + 오라클 DB
--  - Oracle DB Express Edition 에는 DB가 하나만 있다
--  - (SID : xe, xe가 DB이름)
--  - SID : orcl, Standard Edition의 DB이름
--  - 버전 : 11g Release 2
--
-- + 테이블, Table
--  - 데이터베이스 내에서 실제 데이터를 관리(저장)하는 단위
--  - 표 형식
--  - 행(row), 열(column)으로 이루어져 있음
--  - 테이블은 소유자를 가짐
--  - 테이블은 소유자만 관리할 수 있다
--  - (단, 권한을 부여받으면 관리가능)
--  
-- + SQL, Structed Query Lanquage
--  - 구조적 질의 언어
--  - 데이터베이스를 제어, 관리하는 언어
--  - CRUD 작업을 수행함
--  - Create, Read, Update, Delete
--  - Insert, Select, Update, Delete
--  - 스크립트 언어(읽으면서 바로 동작)





-- + 오라클 툴
--  1. SQL*Plus
-- 	- Orcale DBMS가 제공하는 기본 Tool
-- 	- 윈도우콘솔(cmd창)에서 sqlplus라고 입력(sqlplus /nolog)
--	- 시작메뉴에서 'Run SQL Command Line'으로 실행 
--
--  2. SQL*Developer
--	- Oracle에서 제공하는 추가적인 Tool


SELECT*FROM emp; --사원 테이블
SELECT*FROM dept; --부서 테이블
SELECT*FROM bonus; --보너스 테이블
SELECT*FROM salgrade; --급여테이블 테이블

-- + SQL 용도에 따른 분류
--  1. DML, Data Manipulation Language
--     데이터 조작어
--     테이블의 데이터를 조작(조회,삽입,변경,삭제)하는 명령어
--     데이터 처리 SQL
--     SELECT, INSERT, UPDATE, DELETE
--      (Read,   Create, Update, Delete)
--     *DQL, Data Query Language : SELECT 구문, 쿼리


SELECT*FROM tabs; --전체 테이블 조회
SELECT table_name FROM tabs; --전체 테이블명 조회

SELECT*FROM EMP;

desc emp; -- emp 테이블 스키마 정보

-- INSERT 구문 테스트
--데이터를 테이블에 삽입할 때 사용
-- ctrl + / : 한줄 주석

desc dept;
INSERT INTO dept VALUES (90,'','');
INSERT INTO dept 
VALUES (91,null,null);
SELECT*FROM dept;

-- UPDATE TEST
UPDATE dept
SET loc = 'SEOUL';

-- DELETE TEST
DELETE dept
WHERE deptno = 40; -- 부서번호가 40인 행 삭제
DELETE emp; -- 전체삭제

--commit; --커밋, 변경된 데이터 영구반영하기(되돌릴 수 없음)
--rollback; --롤백, 변경된 데이터 반영하지 않기(되돌리기)



-- DDL 기본 테스트
--  2. DDL, Data Definition Language
--	데이터 정의어
--	데이터 베이스의 구조(스키마)를 정의, 조작하는 SQL
--	CREATE, ALTER, DROP
--
--	스키마를 조회할 때에는 데이터사전을 조회한다
--	** 데이터사전, Data Dictionary
--			데이터베이스의 정보를 기록해둔 특수한 테이블
--			메타데이터(metadata)
--  3. DCL, Data Control Language
--     데이터 제어어
--	데이터 무결성, 보안, 병행작업, 수행제어 등을 정의하는 SQL
--	(트랜잭션 SQL 포함)
--     	COMMIT, ROLLBACK : 트랙잭션 제어
--	*TCL, Transaction Control Language
--	트랜잭션 제어어
--	(COMMIT, ROLLBACK만 지칭하는 용어)




CREATE TABLE test( -- test 테이블 생성
    test1 NUMBER, -- 숫자데이터 컬럼
    test2 VARCHAR2(10) -- 문자열데이터 컬럼
);
desc test; -- 테이블 구조(컬럼,널여부,데이터타입) 확인

SELECT * FROM tabs; --테이블스키마 상세 데이터사전 tabs
SELECT * FROM tab; --데이블스키마 간략 데이터사전 tab


DROP TABLE test; -- 테이블 삭제

-- recyclebin : 오라클에서 제공하는 휴지통
SHOW recyclebin; -- 휴지통 확인
FLASHBACK TABLE test to BEFORE DROP; --휴지통에서 복구
PURGE recyclebin; -- 휴지통 비우기

DROP TABLE test PURGE; -- 휴지통에 넣지않고 삭제





--+ SELECT 구문
--	- 테이블에 저장된 데이터를 조회하는 명령어
--	- 반드시 FROM 절이 와야함
--
-- + 구문 형식
--	- SELECT * FROM tablename; 
--		테이블 전체(모든컬럼) 조회
--	- SELECT col1, col2, ... FROM tablename;
--		지정된 컬럼만 조회
--	- SELECT col1 AS alias1, col2, AS alias2, ... FROM tablename;
--		지정된 컬럼의 별칭을 적용하여 조회


-- SELECT 구문
SELECT * FROM emp; -- 전체조회
SELECT empno, ename FROM emp; --empno, ename 컬럼만 조회
SELECT
    empno AS 사번, 
    ename AS 사원이름 
FROM emp;

-- + FROM 절
--	- 조회되는 대상을 지정하는 절
--	- 테이블
--	- 뷰
--	- 인라인뷰(서브쿼리)

-- + WHERE 절
--	- 조건 절
--	- SELECT, UPDATE, DELETE 구문에 사용됨
--	- WHERE [조건절]
--		[조건절] -> 컬럼이름 연산자 조건값

-- + 연산자
--	- 비교 연산자
--		= 같다
--		<> != ^= 같지 않다
--		> 크다
--		< 작다
--		>= 크거나 같다
--		<= 작거나 같다
--	- 논리 연산자
--		AND 두 조건 모두 만족할 때 TRUE
--		OR 두 조건 중 하나라도 만족하면 TRUE
--		NOT 조건을 부정(논리 부정)
--	- 기타 연산자
--		BETWEEN a AND b : a와 b사이의 데이터(a,b 포함)
--				ex) deptno BETWEEN 10 AND 20
--					(deptno >=10 AND deptno <=20 )
--				<-> NOT BETWEEN a AND b
--				ex) deptno NOT BETWEEN 10 AND 20
--		IN(list) : list의 값 중 어느 하나라도 일치하면 데이터 반환
--                   <-> NOT IN(list)
--				ex) deptno IN(10,20)
--
--		LIKE : 지정된 형식의 문자 포맷으로 일치하는 데이터
--			<-> NOT LIKE
--			% : 여러 문자, 문자가 없는 경우도 포함
--			_ : 한 문자, 반드시 한 글자 있어야함
--			LIKE 'B%' -> B로 시작하는 모든 데이터
--			LIKE '%B%' -> B를 포함하는 모든 데이터
--			LIKE '_B%' -> 두번째 글자가 B인 모든 데이터
--			LIKE '%B' -> B로 끝나는 모든 데이터
--
--		IS NULL : null값을 가지는지 데이터
--			<-> IS NOT NULL



-- WHERE 절
SELECT empno, ename, deptno 
FROM emp
--WHERE deptno=10; --부서번호가 10번인 조건
--WHERE deptno>20; --부서번호가 20번보다 큰 조건
WHERE deptno<>20; --부서번호가 20이 아닌 조건

-- 논리 연산자
-- 부서번호가 30이고, job이 'SALESMAN'인 사원 조회
SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30
    AND job = 'SALESMAN';

-- 부서번호가 30이고 직무가 영업이 아닌 사원
SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30
    AND NOT(job = 'SALESMAN');
    
--  부서번호가 30이 아니고 직무가 영업이 아닌 사원
SELECT empno, ename, deptno
FROM emp
WHERE NOT(deptno = 30
    OR job = 'SALESMAN');    
-- WHERE deptno!=30 AND job!='SALESMAN'    

-- 기타 연산자

-- BETWEEN a AND b
SELECT empno, ename FROM emp
WHERE empno BETWEEN 7700 AND 7900;
--WHERE empno >= 7700 AND empno <= 7900;

-- NOT BETWEEN a AND b
SELECT empno, ename FROM emp
WHERE empno NOT BETWEEN 7700 AND 7900;

-- IN(list)
SELECT empno, ename FROM emp
WHERE empno IN (7369, 7521, 7654, 7777, 8888);
--WHERE empno = 7369
--    OR empno = 7521
--    OR empno = 7654
--    OR empno = 7777
--    OR empno = 8888;

SELECT empno, ename FROM emp
WHERE empno NOT IN (7369, 7521, 7654, 7777, 8888);

-- LIKE
SELECT empno, ename FROM emp
--WHERE ename LIKE '%R%'; -- 이름에 R을 포함하는 모든 사원
--WHERE ename LIKE '_A%'; -- 이름의 두번째가 A인 사원
--WHERE ename LIKE '%RD'; -- 이름의 마지막인 RD인 사원
WHERE ename NOT LIKE '%R%' ; --이름에 R이 없는 사원

SELECT empno, ename FROM emp
--WHERE ename LIKE 'KING' ; --하면 안됨(성능저하)
WHERE ename = 'KING';

-- IS NULL
SELECT empno, ename FROM emp
--WHERE mgr IS NULL;
--WHERE mgr = null; -- null값은 적용 안됨
WHERE mgr IS NOT NULL;

-- 부서번호가 30이고 직무가 영업인 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE deptno = 30 AND 
    job = 'SALESMAN';

-- 부서번호가 30이고 직무가 영업이 아닌 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE deptno =30 AND
    NOT job = 'SALESMAN';

-- 부서번호가 30이 아니고 직무가 영업이 아닌 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE NOT(deptno=30 OR
    job = 'SALESMAN');
    
-- 사원번호가 7782에서 7900 사이인 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE empno BETWEEN 7782 AND 7900;

-- 사원명이 'A'부터 'C'로 시작하는 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE ename LIKE 'A%' OR 
    ename LIKE 'B%'OR 
    ename LIKE 'C%';
--WHERE ename>='A' AND ename<'D'; ASKII값 기준(사전순)

-- 부서번호가 10 또는 30인 사원 조회(IN 사용)
SELECT empno, ename, deptno FROM emp
WHERE deptno IN(10,30);

-- ORDER BY 절
SELECT * FROM emp
--ORDER BY empno; -- 사번 오름차순
--ORDER BY ename; -- 이름 오름차순
ORDER BY ename DESC; -- 이름 내림차순

-- deptno 기준으로 정렬 후 그룹 내에서 empno로 정렬
SELECT * FROM emp
ORDER BY deptno DESC, empno ASC;

-- NULL 데이터를 뒤로 보내기
SELECT * FROM emp
ORDER BY comm DESC NULLS LAST;

-- NULL 데이터를 앞으로 보내기
SELECT * FROM emp
ORDER BY comm NULLS FIRST;

-- NULLS 설정도 각각의 정렬기준에 적용된다
SELECT * FROM emp
ORDER BY comm ASC NULLS FIRST, ename DESC;


SELECT * FROM emp
WHERE deptno = 10
ORDER BY sal DESC;

