

-- SEQUENCE

CREATE SEQUENCE seq_emp;

-- 시퀀스명.currval --현재 시퀀스값
-- 시퀀스명.nextval --다음 시퀀스값

SELECT seq_emp.currval FROM dual;
SELECT seq_emp.nextval FROM dual;

INSERT INTO emp (empno, ename)
VALUES ( seq_emp.nextval, 'AAAA' );

SELECT * FROM emp
WHERE empno < 1000;


-- 시퀀스 변경
ALTER SEQUENCE seq_emp
MINVALUE 2001;

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
CACHE 5 --CYCLE내 숫자 개수보다 CACHE 수가 작아야함
CYCLE;

SELECT seq_emp.nextval FROM dual;

-- 시퀀스 자료사전
SELECT * FROM user_sequences
WHERE sequence_name = upper('seq_emp');



--  첫 NEXTVAL : 40, INCREMENT : 10
-- 로 설정된 seq_test 를 만들고 확인
  -- user_sequences로 확인
  -- nextval 로 확인 -> 40, 50, 60 나오는지 확인

-- 시퀀스 생성
CREATE SEQUENCE seq_test
START WITH 40
INCREMENT BY 10;

-- 시퀀스 확인
SELECT * FROM user_sequences
WHERE sequence_name = upper('seq_test');

-- nextval 확인
SELECT seq_test.nextval FROM dual;




-- 뷰 생성
CREATE OR REPLACE VIEW test_view -- (SCOTT)
AS (
    SELECT * FROM emp WHERE empno < 2000 
);

GRANT CREATE VIEW   -- ( DBA )
TO scott;


-- 시스템 권한 조회
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee IN (
    SELECT granted_role FROM DBA_ROLE_PRIVS
    WHERE GRANTEE = 'SCOTT' )
UNION
SELECT * FROM DBA_SYS_PRIVS
WHERE grantee='SCOTT';


SELECT * FROM test_view;


-- 뷰를 통한 삽입
INSERT INTO test_view (empno, ename)
VALUES ( 500, 'BBB' );

INSERT INTO test_view (empno, ename)
VALUES ( 8000, 'CCC' );

SELECT * FROM test_view;

SELECT * FROM emp WHERE empno IN (500, 8000);

-- 뷰 확인 (자료사전)
SELECT * FROM user_views;

TEST_VIEW

"(
    SELECT "EMPNO","ENAME","JOB","MGR",
        "HIREDATE","SAL","COMM","DEPTNO"
    FROM emp WHERE empno < 2000 
)"



CREATE OR REPLACE VIEW test_view -- (SCOTT)
AS ( SELECT * FROM emp WHERE empno < 2000 )
WITH CHECK OPTION;

INSERT INTO test_view (empno, ename)
VALUES ( 7000, 'DDD');

INSERT INTO test_view (empno, ename)
VALUES ( 600, 'EEE');


-- 인라인 뷰
SELECT * FROM (
    SELECT * FROM emp
    WHERE empno < 2000
) E;

-- 뷰
SELECT * FROM TEST_VIEW;
