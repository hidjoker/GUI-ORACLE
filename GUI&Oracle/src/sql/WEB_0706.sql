-- 다중 행 서브쿼리
-- + 다중 행 서브 쿼리
--	- 서브 쿼리의 결과가 두 건(2행) 이상 출력되는 서브쿼리
--	- 다중 행 전용 연산자만 사용할 수 있다
--	- 단일 행 연산자 사용 불가( = != < > 등등 )
--	- IN
--		단일행 서브쿼리에서 사용하는 IN과 같음
--		동등비교(=) 을 위해 사용
--		결과 행 중에서 하나라도 만족하면 조회
--	- ANY(=SOME) : 범위비교를 위해 사용
--		비교컬럼과 서브쿼리의 결과 중 어떤 것이라도 조건에
--		만족하면 조회됨(결과 반환) => OR
--		col = ANY (A, B, C) : A,B,C 모두 조회
--		col < ANY (A, B, C) : 최대값보다 작은 모든 결과 조회
--		col > ANY (A, B, C) : 최소값보다 큰 모든 결과 조회
--	- ALL : 범위비교를 위해 사용
--			비교컬럼과 서브쿼리의 결과들 모두가 조건에
--			만족하면 조회됨(결과 반환)
--		col = ALL(A, B, C) : 셋 모두와 같을 때 조회(의미가 없어짐, 조회안됨)
--		col < ALL(A, B, C) : 최소값보다 작은 결과들 조회
--		col > ALL(A, B, C) : 최대값보다 큰 결과들 조회
--	- EXISTS : 서브쿼리의 결과가 메인쿼리에 존재하면 조회

-- SALESMAN들의 급여
SELECT DISTINCT sal FROM emp
WHERE job = 'SALESMAN'
ORDER BY sal;

-- SALESMAN 들과 급여가 같은 사원
SELECT * FROM emp
WHERE sal IN (1250, 1500, 1600);

-- SALESMAN 들의 급여와 같은 페이를 받는 모든 직원
-- IN
SELECT * FROM emp
WHERE sal IN (
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;

-- ANY
SELECT * FROM emp
WHERE sal = ANY ( -- 1250, 1500, 1600
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal < ANY ( -- 1250, 1500, 1600
    SELECT DISTINCT sal
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal > ANY ( -- 1250, 1500, 1600
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'SALESMAN'
)
ORDER BY sal;

-- ALL
SELECT * FROM emp
WHERE sal = ALL ( -- 2450, 2850, 2975
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal < ALL ( -- 2450, 2850, 2975
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;

SELECT * FROM emp
WHERE sal > ALL ( -- 2450, 2850, 2975
    SELECT DISTINCT sal 
    FROM emp
    WHERE job = 'MANAGER'
)
ORDER BY sal;

-- EXISTS
SELECT DISTINCT mgr FROM emp
ORDER BY mgr;

SELECT * FROM emp e -- 7566, 7698, 7782, 7839, 7902
WHERE EXISTS (
    SELECT empno
    FROM emp
    WHERE e.empno = mgr);
    
SELECT deptno, dname, loc
FROM dept d
WHERE EXISTS(
    SELECT * FROM emp e
    WHERE d.deptno = e.deptno)
ORDER BY deptno;

SELECT * FROM dept
WHERE deptno IN(
    SELECT DISTINCT deptno FROM emp)
ORDER BY deptno;

-- + 집합연산자
--	- 두 개 이상의 쿼리 결과를 하나로 합치는 연산자
--	- 컬럼의 개수와 이름이 같아야 한다
--	- UNION : 합집합
--	- UNION ALL : 합집합, 중복허용
--	- INTERSECT : 교집합
--	- MINUS : 차집합

-- UNION
SELECT empno, ename, job FROM emp
WHERE job = 'SALESMAN'
UNION
SELECT empno, ename, job FROM emp
WHERE job = 'MANAGER'
ORDER BY job, empno;

-- UNION
SELECT empno, ename, sal FROM emp
WHERE sal<1000
UNION
SELECT empno, ename, sal FROM emp
WHERE sal<2000
ORDER BY sal;

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
