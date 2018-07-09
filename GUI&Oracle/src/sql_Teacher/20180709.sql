SELECT * FROM emp;

SELECT
    EMPNO,
    ENAME,
    JOB,
    MGR,
    HIREDATE,
    SAL,
    COMM,
    DEPTNO
FROM emp;


-- INSERT
desc emp;
INSERT INTO emp ( empno, ename, job, mgr,
    hiredate, sal, comm, deptno )
VALUES ( 1001, 'ALICE', 'CLERK', 1003,
    '17/01/08', 800, NULL, 30);
    
SELECT * FROM emp
WHERE empno = 1001;

desc emp;
INSERT INTO emp
VALUES( 1002, 'MORRIS', 'CLERK', 1003,
    '17/01/08', 800, NULL, 30);
    
SELECT * FROM emp WHERE empno<2000;
INSERT INTO emp
SELECT 1003, 'MATHEW', 'SALESMAN', NULL,
    sysdate, 1500, 100, 30 FROM dual;
    
INSERT INTO emp ( empno, ename )
VALUES ( 1010, 'BOB' );


-- 2명의 정보를 삽입하시오
--사번 1011
--이름 EDWARD
--직무 MANAGER
INSERT INTO emp ( empno, ename, job )
VALUES( 1011, 'EDWARD', 'MANAGER' );

--사번 1015
--이름 Richard
--급여 2000
INSERT INTO emp ( empno, ename, sal )
VALUES( 1015, 'Richard', 2000 );

SELECT * FROM emp WHERE empno < 2000;

--commit; --영구반영
--rollback; --되돌리기


-- 테이블 생성
CREATE TABLE emp_research
AS
SELECT * FROM emp;

SELECT * FROM emp_research;

-- 테이블 삭제
DROP TABLE emp_research;

CREATE TABLE emp_research
AS
SELECT * FROM emp WHERE deptno=20;
SELECT * FROM emp_research;

CREATE TABLE emp_research
AS
SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp_research;
desc emp_research;

-- 20번 부서의 모든 데이터를 INSERT
INSERT INTO emp_research
SELECT * FROM emp WHERE deptno=20;

-- 30번 부서의 empno, ename 데이터를 INSERT
INSERT INTO emp_research( empno, ename )
SELECT empno, ename FROM emp WHERE deptno=30;


-- 데이터 삭제
DELETE FROM emp_research;

-- INSERT ALL
INSERT ALL
WHEN deptno=20
    THEN INTO emp_research
WHEN deptno=30
    THEN INTO emp_research ( empno, ename )
    VALUES ( empno, ename )
SELECT * FROM emp;

SELECT * FROM emp_research;



CREATE TABLE emp_hire
AS SELECT empno, ename, hiredate
    FROM emp WHERE 1=0;
desc emp_hire;
    
CREATE TABLE emp_sal
AS SELECT empno, ename, sal
    FROM emp WHERE 1=0;
desc emp_sal;    
    
    
-- emp_hire
-- 입사일이 '1981/06/01' 이전인 사람
-- emp_sal
-- 급여가 2000보다 많은 사람
desc emp_hire;
desc emp_sal;

INSERT ALL
WHEN hiredate < '1981/06/01'
    THEN INTO emp_hire
    VALUES ( empno, ename, hiredate )
WHEN sal > 2000
    THEN INTO emp_sal
    VALUES ( empno, ename, sal )
SELECT * FROM emp;

DELETE emp_hire;
DELETE emp_sal;

SELECT * FROM emp_hire; -- 5명
--SMITH, ALLEN, WARD, JONES, BLAKE

SELECT * FROM emp_sal; -- 5명
--JONES, BLAKE, CLARK, KING, FORD

-- UPDATE
SELECT * FROM emp
--UPDATE emp SET ename = 'MATT'
WHERE empno = 1003;

--commit;
--rollback;

SELECT * FROM emp
-- UPDATE emp SET ename='Burger', job='King'
WHERE empno = 1001;


SELECT * FROM emp_hire;
-- UPDATE emp_hire SET hiredate=sysdate;

--commit;


SELECT * FROM emp
-- DELETE emp
WHERE empno = 1002;
-- rollback;


SELECT * FROM emp_sal;
-- DELETE emp_sal;
-- commit;


-- emp테이블에서 10,20부서인 인원 복사 -> emp_merge

-- emp테이블에서 20,30부서를 조회
--  emp_merge에 존재하는 사원이면 sal 10%인상
--  emp_merge에 존재하지 않으면 원본 삽입

CREATE TABLE emp_merge
AS
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno IN (10,20);

SELECT * FROm emp_merge ORDER BY deptno, empno;



MERGE INTO emp_merge m
USING (
    SELECT empno, ename, deptno, sal
    FROM emp
    WHERE deptno IN (20,30)
) e
ON ( e.empno = m.empno )
WHEN MATCHED THEN
    UPDATE SET m.sal = ROUND(m.sal*1.1)
--    WHERE e.sal > 1500
WHEN NOT MATCHED THEN
    INSERT ( m.empno, m.ename, m.sal, m.deptno )
    VALUES ( e.empno, e.ename, e.sal, e.deptno );
--    WHERE e.sal > 1000;

SELECT * FROM emp_merge ORDER BY deptno, empno;
-- DELETE emp_merge;
-- DROP TABLE emp_merge;    


SELECT * FROM emp;


-- CREATE TABLE

CREATE TABLE type_test_01 (
    data1 NUMBER,
    data2 NUMBER(10),
    data3 NUMBER(5,2),
    data4 NUMBER(4,5)
);
desc type_test_01;

-- data1 NUMBER
INSERT INTO type_test_01 ( data1 )
VALUES( 12312312398172498173498 );
SELECT * FROM type_test_01;

-- 38개의 유효숫자만 남고 나머지는 0으로 채워짐
INSERT INTO type_test_01 ( data1 )
VALUES( 12345678901234567890123456789012345678901234567890 );
SELECT * FROM type_test_01;

DELETE type_test_01;

-- data2 NUMBER(10)
INSERT INTO type_test_01 (data2)
VALUES( 123.6567 );
SELECT * FROM type_test_01;


-- data3 NUMBER(5,2)
INSERT INTO type_test_01 (data3)
VALUES( 23.65 );
INSERT INTO type_test_01 (data3)
VALUES( 23.6567 );
INSERT INTO type_test_01 (data3)
VALUES( 2374.6567 );
SELECT * FROM type_test_01;


-- data4 NUMBER(4,5)
INSERT INTO type_test_01 (data4)
VALUES( 1234 );
INSERT INTO type_test_01 (data4)
VALUES( 0.12300 );
INSERT INTO type_test_01 (data4)
VALUES( 0.01234 );
SELECT * FROM type_test_01;


-- VARCHAR2(10)
CREATE TABLE type_test_02 (
    data VARCHAR2(10)
);

INSERT INTO type_test_02
VALUES ( '1234567890' );

INSERT INTO type_test_02
VALUES ( '123456789012345' );

INSERT INTO type_test_02
VALUES ( '일이삼사오육칠팔구십' );

INSERT INTO type_test_02
VALUES ( '일이삼' );

CREATE TABLE type_test_03 (
    data1 VARCHAR2(10 BYTE),
    data2 VARCHAR2(10 CHAR) 
);
desc type_test_03;


INSERT INTO type_test_03(data1, data2)
VALUES ( '1234567890', '1234567890' );
INSERT INTO type_test_03(data1)
VALUES ( '일이삼' );
INSERT INTO type_test_03(data2)
VALUES ( '일이삼사오육칠팔구십' );

SELECT * FROM type_test_03;

