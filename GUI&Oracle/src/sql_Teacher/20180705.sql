

SELECT * FROM emp;


-- SELF JOIN
SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E, emp M
WHERE E.mgr = M.empno
ORDER BY empno;

SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E
JOIN emp M
    ON E.mgr = M.empno
ORDER BY empno;

SELECT 사원.empno, 사원.ename, 사원.mgr, 매니저.ename AS "MGRNAME"
FROM emp 사원
JOIN emp 매니저
    ON 사원.mgr = 매니저.empno
ORDER BY empno;




-- OUTER JOIN
SELECT DISTINCT deptno FROM emp ORDER BY deptno;
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
FROM emp E, emp M
WHERE E.mgr = M.empno(+)
ORDER BY empno;


SELECT E.empno, E.ename, E.mgr, M.ename AS "MGRNAME"
FROM emp E
LEFT OUTER JOIN emp M
    ON E.mgr = M.empno
ORDER BY empno;




SELECT empno, ename, d.deptno, dname
FROM emp e, dept d
WHERE d.deptno = e.deptno(+)
ORDER BY deptno, empno;




-- FULL OUTER JOIN --ANSI전용
CREATE TABLE test1 ( no NUMBER );
CREATE TABLE test2 ( no NUMBER );
INSERT INTO test1 VALUES (10);
INSERT INTO test1 VALUES (20);
INSERT INTO test1 VALUES (30);

INSERT INTO test2 VALUES (10);
INSERT INTO test2 VALUES (20);
INSERT INTO test2 VALUES (40);

SELECT * FROM test1;
SELECT * FROM test2;
DELETE test1; -- 테이블 다 지우기
DELETE test2; -- 테이블 다 지우기

SELECT *
FROM test1
FULL OUTER JOIN test2
    ON test1.no = test2.no
ORDER BY test1.no;




-- CROSS JOIN
SELECT * FROM salgrade; -- 5row, 3col
SELECT * FROM dept; -- 4row, 3col

SELECT * FROM dept, salgrade;
SELECT * FROM salgrade CROSS JOIN dept;



-- NATURAL JOIN
SELECT *
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
    AND ename=UPPER('king'); --조회조건



-- 전체 평균 임금보다 많이 받는 사원들
SELECT empno, ename, sal
FROM emp
WHERE sal > (
    SELECT AVG(sal) FROM emp
);


-- 가장 최근에 입사한 사원 (막내)
SELECT empno, ename, hiredate
FROM emp
WHERE hiredate = (
    SELECT MAX(hiredate) FROM emp
);


-- 전체 평균 임금보다 부서 별 평균임금이 높은 부서
-- COLUMN : deptno, avg_sal - 부서번호, 부서별평균임금
--  10 2916.67
--  20 2258.33
SELECT deptno, ROUND(avg(sal), 2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal) > (
    SELECT avg(sal) FROM emp )
ORDER BY deptno;



SELECT E.deptno, dept.dname, avg_sal
FROM (
    SELECT deptno, ROUND(avg(sal), 2) AS avg_sal
    FROM emp
    GROUP BY deptno
    HAVING avg(sal) > (SELECT avg(sal) FROM emp)
) E
INNER JOIN dept
    ON E.deptno = dept.deptno
ORDER BY deptno;






20	2258.33
10	2916.67

SELECT
    deptno
    ,(SELECT dname FROM dept
        WHERE emp.deptno=dept.deptno ) dname
    ,ROUND(avg(sal), 2) avg_sal
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
    ( SELECT dname FROM dept D WHERE E.deptno=D.deptno ) AS dname,
    ( SELECT loc FROM dept D WHERE E.deptno=D.deptno ) AS loc
FROM emp E
ORDER BY deptno, empno;




-- 서브쿼리를 ORDER BY 절에 사용하기
UPDATE dept
SET dname='ZACCOUNT'
WHERE deptno=10;

SELECT empno, ename, sal, deptno
FROM emp e
ORDER BY (
    SELECT dname FROM dept d
    WHERE e.deptno = d.deptno
);
SELECT dname FROM dept ORDER BY dname;


--부서별 인원 구하기
--  40번 부서는 0명이라고 출력
--  서브쿼리 활용, 조인 활용
--  deptno, dname, cnt_employee
SELECT d.deptno, dname, COUNT(e.empno) cnt_employee
FROM dept d
LEFT OUTER JOIN emp e
    ON d.deptno = e.deptno
GROUP BY d.deptno, dname
ORDER BY deptno;



SELECT d.deptno, dname, COUNT(e.empno) cnt_employee
FROM dept d, emp e
WHERE d.deptno = e.deptno(+)
GROUP BY d.deptno, dname
ORDER BY deptno;



SELECT
    deptno,
    dname,
    ( SELECT COUNT(*) FROM emp e
     WHERE e.deptno = d.deptno ) cnt_employee
FROM dept d;



-- 인라인 뷰
SELECT * FROM (
    SELECT empno, ename FROM emp
    ORDER BY empno
) E;



-- ROWNUM
SELECT rownum, emp.* FROM emp;

SELECT rownum, e.* FROM (
    SELECT * FROM emp 
) e;


SELECT rownum, emp.* FROM emp
WHERE rownum <=3
ORDER BY sal;

--  top 3
SELECT rownum rnum, e.* FROM (
    SELECT * FROM emp
    ORDER BY sal DESC
) e
WHERE rownum BETWEEN 1 AND 3;


-- comm 을 가장 많이 받는 TOP 2 를 조회
-- COLUMNS : comm_top, emp.*

SELECT * FROM (
    SELECT rownum comm_top, e.* FROM (
        SELECT * FROM emp
        ORDER BY comm DESC NULLS LAST
    ) e
    ORDER BY rownum DESC
) s
WHERE comm_top BETWEEN 1 AND 2;



-- MSSQL
SELECT top 2 comm
FROM emp
ORDER comm DESc;




-- 다중 열 서브쿼리
SELECT dname, empno, ename, sal
FROM emp
JOIN dept USING(deptno)
WHERE ( deptno, sal ) IN (
    SELECT deptno, MAX(sal) FROM emp
    GROUP BY deptno );
    