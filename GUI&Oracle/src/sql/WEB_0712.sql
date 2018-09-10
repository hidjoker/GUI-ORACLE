-- + 시퀀스
--	- 연속된 숫자를 생성해주는 객체
--	- 테이블 내의 유일한 숫자를 자동으로 생성할 때 사용
--	- 행을 구분하는 유일키 값으로 사용함
--	(PRIMARY KEY)

-- + 시퀀스 생성 구문
--	- CREATE SEQUENCE 시퀀스명;
--	- CREATE SEQUENCE 시퀀스명
--		[START WITH n ] -- 시작값
--		[INCREMENT BY n] -- 증가값
--		[MAXVALUE n | NOMAXVALUE] -- 최대값
--		[MINVALUE n | NOMINVALUE] -- 최소값
--		[CYCLE | NOCYCLE] -- 순환구조 여부
--		[CACHE n | NOCACHE] --미리 생성할 숫자 개수

-- SEQUENCE

CREATE SEQUENCE seq_emp;

-- 시퀀스명.currval -- 현재 시퀀스값
-- 시퀀스명.nextval -- 다음 시퀀스값

SELECT seq_emp.currval FROM dual;
SELECT seq_emp.nextval FROM dual;

INSERT INTO emp(empno, ename)
VALUES(seq_emp.nextval, 'AAAA');

SELECT * FROM emp
WHERE empno < 1000;

--+ 시퀀스 변경 구문
--	- ALTER SEQUENCE 시퀀스명
--		[INCREMENT BY n] -- 증가값
--		[MAXVALUE n | NOMAXVALUE] -- 최대값
--		[MINVALUE n | NOMINVALUE] -- 최소값
--		[CYCLE | NOCYCLE] -- 순환구조 여부
--		[CACHE n | NOCACHE] --미리 생성할 숫자 개수

-- + 시퀀스 사용 구문
--	- 시퀀스명.currval -- 현재 시퀀스 값
--	- 시퀀스명.nextval -- 다음 시퀀스 값
--	ex)
--		CREATE SEQUENCE seq_emp;
--		INSERT INTO emp (empno, ename)
--      VALUES (seq_emp.nextval, #{ename});

-- 시퀀스 변경
ALTER SEQUENCE seq_emp
MINVALUE 2001; -- currval 시퀀스가 < MINVALUE 이므로 오류

-- + 시퀀스 삭제
--	- DROP SEQUENCE 시퀀스명;

-- 시퀀스 삭제
DROP SEQUENCE seq_emp;

-- 변경된 조건으로 다시 생성
CREATE SEQUENCE seq_emp
START WITH 2001
MINVALUE 2001
MAXVALUE 3000
INCREMENT BY 100;

-- 시퀀스에 CYCLE 옵션 적용
ALTER SEQUENCE seq_emp
CACHE 5 -- CYCLE내 숫자 개수보다 CACHE수가 작아야함
CYCLE;

SELECT seq_emp.nextval FROM dual;

-- + 시퀀스 확인 자료사전
--	- SELECT * FROM USER_SEQUENCES;

-- 시퀀스 자료사전
SELECT * FROM user_sequences
WHERE sequence_name = upper('seq_emp');

-- 첫 NEXTVAL : 40, INCREMENT : 10
-- 로 설정된 seq_test 를 만들고 확인
    -- user_sequences로 확인
    -- nextval로 확인 -> 40, 50, 60 나오는지 확인

CREATE SEQUENCE seq_test
START WITH 40
INCREMENT BY 10;

SELECT * FROM user_sequences
WHERE sequence_name = upper('seq_test');

-- nextval 확인
SELECT seq_test.nextval FROM dual;

-- + 뷰, View
--	- 복잡한 쿼리를 간단하게 사용하려는 목적의 객체
--	- 접근할 수 있는 데이터의 범위를 축소하기 위해 사용하기도 한다
--	(조회되는 컬럼을 제한할 수 있음)
--	- SELECT 쿼리만 VIEW로 저장하고 있음
--	- VIEW를 테이블 처럼 조회하면
--	- VIEW에 저장되어있는 SELECT 쿼리를 수행하고 결과를 넘겨줌
--	- 이름만 봐서는 TABLE인지 VIEW인지 구분 할 수 없음
--	- 가상테이블 생성하는 객체이다
--	- 뷰를 통해서 테이블 조회, 삽입, 수정, 삭제 가능
--		(원본 테이블 자료도 반영됨)

 + 뷰 생성 문법
--	CREATE [OR REPLACE] VIEW 뷰이름
--	AS 서브쿼리
--	[ WITH CHECK OPTION [CONSTRANINT 제약조건]]
--	[ WITH READ ONLY]
--	CREATE : 뷰 생성
--	CREATE OR REPLACE : 뷰 생성, 중복된 뷰이름이 있으면 쿼리를 수정하여 반영
--	WITH CHECK OPTION : 제약조건에 맞는 데이터만 삽입, 수정가능
--	WITH READ ONLY : SELECT만 가능

-- 뷰 생성
CREATE OR REPLACE VIEW test_view
AS (
    SELECT * FROM emp WHERE empno < 2000 
);

GRANT CREATE VIEW TO scott; -- (DBA)

SELECT * FROM test_view;

-- 뷰를 통한 삽입
INSERT INTO test_view(empno, ename)
VALUES (500,'BBB');

INSERT INTO test_view(empno, ename)
VALUES (8000,'CCC');

SELECT * FROM test_view;
SELECT * FROM emp 
WHERE empno IN(500,8000);

-- 뷰 확인 (자료사전)
SELECT * FROM user_views;

CREATE OR REPLACE VIEW test_view
AS (
    SELECT * FROM emp WHERE empno < 2000 
)WITH CHECK OPTION;

INSERT INTO test_view(empno, ename)
VALUES (7000, 'DDD');

INSERT INTO test_view(empno, ename)
VALUES (600, 'EEE');

-- 인라인 뷰
SELECT * FROM(
    SELECT * FROM emp
    WHERE empno < 2000
)E;
-- 뷰
SELECT * FROM TEST_VIEW;

SELECT * FROM tabs;