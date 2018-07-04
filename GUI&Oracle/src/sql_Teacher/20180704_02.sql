

SELECT * FROM emp;
SELECT * FROM dept;

SELECT * FROM emp, dept; -- CROSS JOIN

SELECT * FROM emp NATURAL JOIN dept;

desc emp;

INSERT INTO emp ( empno, deptno )
VALUES( 9999, 50 ); -- FK 제약조건 위배, dept.deptno에 50이 없다






-- EQUI JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- 조인조건
    AND empno > 7500 -- 조회조건
ORDER BY deptno, empno;


-- INNER JOIN
SELECT
    empno, ename, E.deptno, dname
FROM emp E
INNER JOIN dept D
    ON E.deptno = D.deptno --조인조건
WHERE empno > 7500; --조회조건



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
JOIN salgrade S
    ON E.sal BETWEEN S.losal AND S.hisal;
