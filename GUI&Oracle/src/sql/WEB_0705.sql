
-- + SELF JOIN
--	- 하나의 테이블로 자신테이블과 조인하는 것
--	- FROM절에서 alias를 다르게 설정하여 두 개의 테이블인 것처럼 인식시켜 조인한다
--	- 컬럼이 자기가 포함된 테이블의 컬럼을 참조하는 상황에 사용

SELECT * FROM emp;
-- SELF JOIN
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E ,emp M
WHERE E.mgr = M.empno
ORDER BY empno;

SELECT 사원.empno, 사원.ename, 사원.mgr, 매니저.ename AS "MGRNAME"
FROM emp 사원 
INNER JOIN emp 매니저
    ON 사원.mgr = 매니저.empno
ORDER BY empno;

-- + OUTER JOIN, 외부 조인
--	- 조인에 참가하는 컬럼에 NULL을 포함하고 있을 때 사용
--	- 조인 컬럼 중 한 쪽이 값을 가지고 있지 않을 때
--	- (+) 연산자를 데이터가 부족한(NULL) 테이블 쪽의 컬럼조건에 붙여서 조인한다
--	- 조인조건식의 한쪽에만 사용할 수 있다
--	- ANSI 구문에는
--		LEFT OUTER JOIN
--		RIGHT OUTER JOIN
--		FULL OUTER JOIN
--	이 있다
--	- 조인조건의 왼쪽에 (+)가 붙으면 RIGHT OUTER JOIN으로 변환가능
--	- 조인조건의 오른쪽에 (+)가 붙으면 LEFT OUTER JOIN으로 변환가능
--	- FULL OUTER JOIN은 ANSI에만 존재, 조인테이블 모두 NULL인 경우에 사용할 수 있다
--	- 오라클 구문에는 FULL OUTER JOIN에 대응하는 구문이 없다

-- OUTER JOIN
SELECT DISTINCT deptno 
FROM emp 
ORDER BY deptno;

SELECT * FROM dept;

-- RIGHT OUTER JOIN
SELECT empno, ename, d.deptno, dname
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
ORDER BY deptno, empno;

SELECT empno, ename, d.deptno, dname
FROM emp e
RIGHT OUTER JOIN dept d
    ON e.deptno = d.deptno
ORDER BY deptno, empno;

-- LEFT OUTER JOIN
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E ,emp M
WHERE E.mgr = M.empno(+)
ORDER BY empno;

SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E
LEFT OUTER JOIN emp M
    ON E.mgr = M.empno
ORDER BY empno;

-- FULL OUTER JOIN -- ANSI 전용
CREATE TABLE test1(no NUMBER);
CREATE TABLE test2(no NUMBER);
INSERT INTO test1 VALUES(10);
INSERT INTO test1 VALUES(20);
INSERT INTO test1 VALUES(30);

INSERT INTO test2 VALUES(10);
INSERT INTO test2 VALUES(20);
INSERT INTO test2 VALUES(40);

SELECT * FROM test1;
SELECT * FROM test2;
DELETE test1; -- 테이블1 다 지우기
DELETE test2; -- 테이블2 다 지우기

SELECT *
FROM test1
FULL OUTER JOIN test2
    ON test1.no = test2.no
ORDER BY test1.no;
	
-- + CROSS JOIN
--	- 카테시안 곱을 얻을 때 사용한다
--	- 테스트용 dummy 테이블을 만들 때 사용할 수 있다
--	** 카테시안 곱, Cartesian Product
--		두 개의 테이블의 조회가능한 모든 경우의 수를 출력하는 것
--		모든 컬럼
--		모든 행의 조합
--		ex) 4개의 컬럼과 3개의 행을 가지는 TABLE_1
--			7개의 컬럼과 5개의 행을 가지는 TABLE_2
--			위의 두 테이블로 카테시안 곱을 만들면
--			11개의 컬럼, 15개의 행으로 모든 조합을 만든다

-- CROSS JOIN
SELECT * FROM salgrade; -- 5row, 3col
SELECT * FROM dept; -- 4row, 3col

SELECT * FROM dept, salgrade;
SELECT * FROM salgrade CROSS JOIN dept;

-- + NATURAL JOIN
--	- WHERE 조인조건절 없이 EQUI JOIN을 수행한다
--	- 조인조건이 되는 컬럼을 자동으로 설정한다
--	- 조인조건을 제어하는 어려움이 있다
--		-> JOIN~USING(col) 으로 해결 가능

-- NATURAL JOIN
SELECT empno, ename, deptno, dname
FROM emp
NATURAL JOIN dept
ORDER BY deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp
INNER JOIN dept
    ON emp.deptno = dept.deptno
ORDER BY deptno;

-- INNER JOIN을 이용한 NATURAL JOIN
SELECT *
FROM emp
JOIN dept
    USING(deptno)
ORDER BY deptno;

-- + 서브쿼리, subquery
--	- SQL 문장에 포함된 또 다른 SQL문
--	- 메인쿼리와 서브쿼리(내부쿼리)로 지칭한다
--	- 서브쿼리는 ( )로 묶어서 표현한다

-- + 서브쿼리의 종류 : 적용 위치에 따라
--	1. 스칼라 서브쿼리 : SELECT 절의 컬럼으로 사용
--	2. 서브쿼리 : WHERE 절의 조건으로 사용
--	3. 인라인 뷰 : FROM 절의 조회테이블로 사용

-- + 서브쿼리의 종류 : 서브쿼리결과의 행 수에 따라
--	1. 단일 행 서브 쿼리
--		- 서브쿼리 결과가 하나의 행으로 조회되는 것
--		= ,<, >, <=, <> ,>=
--	2. 다중 행 서브 쿼리
--		- 서브쿼리 결과가 여러 개의 행으로 조회되는 것
--		- 단일 행 서브쿼리에서 사용하는 연산자 사용불가
--		- 전용 연산자
--		IN, NOT, ANY(=SOME), ALL, EXISTS
--	3. 다중 열 서브 쿼리 -> WHERE절에서 주로 사용
--		- 서브쿼리 결과의 컬럼이 여러 개인 것
--		- WHERE 절의 컬럼은 ( , , , )로 묶어서 표현한다
--		ex)
--				WHERE(empno, ename) = (SELECT empno, ename ... )


-- 서브쿼리
SELECT *
FROM dept
WHERE deptno = 10;

SELECT deptno FROM emp WHERE ename=UPPER('king');

SELECT *
FROM dept
WHERE deptno = (
    SELECT deptno 
    FROM emp 
    WHERE ename=UPPER('king')
);

SELECT d.*
FROM dept d, emp e
WHERE d.deptno = e.deptno -- 조인조건
AND ename=UPPER('king'); -- 조회조건

-- 전체 평균 임금보다 많이 받는 사원들
SELECT empno, ename, sal
FROM emp
WHERE sal > (
    SELECT AVG(sal)
    FROM emp
);

-- 가장 최근에 입사한 사원(막내)
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate = (
    SELECT MAX(hiredate) FROM emp
);

-- 전체 평균 임금보다 부서 별 평균임금이 높은 부서
-- COLUMN : deptno, avg_sal - 부서번호, 부서별평균임금

-- HAVING 조건 절 서브쿼리
SELECT deptno, ROUND(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal) >(
    SELECT avg(sal) FROM emp
) 
ORDER BY deptno;

-- 인라인 뷰
SELECT E.deptno, dept.dname, avg_sal
FROM(
    SELECT deptno, ROUND(avg(sal),2) AS avg_sal
    FROM emp
    GROUP BY deptno
    HAVING avg(sal) > (SELECT avg(sal) FROM emp)
)E
INNER JOIN dept
    ON E.deptno = dept.deptno
ORDER BY deptno;

-- 스칼라 서브쿼리
SELECT
    deptno
    ,(SELECT dname FROM dept
        WHERE emp.deptno = dept.deptno) dname
    ,ROUND(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal) > (
    SELECT avg(sal) FROM emp)
ORDER BY deptno;


-- 스칼라 서브쿼리
SELECT
    empno,
    ename,
    deptno,
    (SELECT dname FROM dept D WHERE E.deptno = D.deptno) AS dname,
    (SELECT loc FROM dept D WHERE E.deptno = D.deptno) AS loc
FROM emp E
ORDER BY deptno, empno;

-- 서브쿼리를 ORDER BY절에 사용하기
UPDATE dept
SET dname='ZACCOUNT'
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
FROM emp e
ORDER BY(
    SELECT dname FROM dept d
    WHERE e.deptno = d.deptno
);
SELECT * FROM dept;

-- 부서별 인원 구하기
-- 40번 부서는 0명이라고 출력
-- 서브쿼리 활용, 조인 활용
-- deptno, dname, cnt_employee


-- 스칼라 서브쿼리
SELECT D.deptno, D.dname
    ,(SELECT Count(E.empno) 
        FROM emp E 
        WHERE E.deptno = D.deptno) "COUNT"
FROM dept D
ORDER BY D.deptno;
    
-- 조인 
SELECT 
    D.deptno, 
    COUNT(E.empno) cnt_employee
FROM emp E
RIGHT OUTER JOIN dept D
    ON E.deptno = D.deptno
GROUP BY D.deptno
ORDER BY deptno;

-- 인라인 뷰
SELECT * FROM(
    SELECT empno, ename FROM emp
    ORDER BY empno
)
ORDER BY empno;

-- ROWNUM
SELECT rownum, emp.* FROM emp;

SELECT rownum, e.* FROM (
    SELECT * FROM emp
)e;

-- top 3
SELECT rownum,e.* FROM (
    SELECT * FROM emp
    ORDER BY sal
)e
WHERE rownum BETWEEN 1 AND 3;

-- comm 을 가장 많이 받는 top2를 조회
-- COLUMNS : comm_top, emp.*


SELECT rownum comm_top, e.* FROM(
    SELECT * FROM emp
    ORDER BY comm DESC NULLS LAST
)e
WHERE rownum BETWEEN 1 AND 2;

-- MSSQL에선 통하는 문법
--SELECT top 2 comm
--FROM emp
--ORDER comm DESC;

-- 다중 열 서브쿼리
SELECT dname, empno, ename, sal
FROM emp
JOIN dept USING(deptno)
WHERE (deptno, sal) = (
    SELECT deptno, MAX(sal)
    FROM emp
    WHERE deptno = 10
    GROUP BY deptno
);
