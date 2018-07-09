


-- 다중 행 서브쿼리

-- SALESMAN들의 급여
SELECT DISTINCT sal
FROM emp
WHERE job = 'SALESMAN'
ORDER BY sal;

-- SALESMAN 들과 급여가 같은 사원
SELECT * FROM emp
WHERE sal IN ( 1250, 1500, 1600 );

-- SALESMAN 들의 급여와 같은 페이를 받는 모든 직원
SELECT * FROM emp
WHERE sal IN ( 
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;




-- ANY
SELECT * FROM emp
WHERE sal = ANY (  -- 1250, 1500, 1600
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;


SELECT * FROM emp
WHERE sal < ANY (  -- 1250, 1500, 1600
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;


SELECT * FROM emp
WHERE sal > ANY (  -- 1250, 1500, 1600
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;



-- ALL
SELECT * FROM emp
WHERE sal = ALL (  -- 2450, 2850, 2975
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal < ALL (  -- 2450, 2850, 2975
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;


SELECT * FROM emp
WHERE sal > ALL (  -- 2450, 2850, 2975
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;


-- EXISTS
SELECT DISTINCT mgr FROM emp ORDER BY mgr;

SELECT * FROM emp e -- 7566, 7698, 7782, 7839, 7902
WHERE EXISTS (
    SELECT empno
    FROM emp
    WHERE e.empno = mgr );


SELECT deptno, dname, loc
FROM dept d
WHERE EXISTS (
    SELECT * FROM emp e
    WHERE d.deptno = e.deptno )
ORDER BY deptno;


SELECT * FROM dept 
WHERE deptno IN (
    SELECT DISTINCT deptno FROM emp )
ORDER BY deptno;




-- UNION
SELECT empno, ename, job FROM emp
WHERE job = 'SALESMAN'
UNION
SELECT empno, ename, job FROM emp
WHERE job = 'MANAGER'
ORDER BY job, empno;



-- UNION ALL
SELECT empno, ename, sal FROM emp
WHERE sal<1000
UNION ALL
SELECT empno, ename, sal FROM emp
WHERE sal<2000
ORDER BY sal;



-- INTERSECT
SELECT empno, ename, sal FROM emp
WHERE sal<1000
INTERSECT
SELECT empno, ename, sal FROM emp
WHERE sal<2000
ORDER BY sal;



-- MINUS
SELECT empno, ename, sal FROM emp
WHERE sal<2000
MINUS
SELECT empno, ename, sal FROM emp
WHERE sal<1000
ORDER BY sal;
