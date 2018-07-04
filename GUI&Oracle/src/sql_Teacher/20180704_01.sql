
-- to_char(datetime)
SELECT
--    to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS DAY'),
--    to_char(sysdate, 'SCC'),
--    to_char(to_date('1887/01/02'), 'SCC'),

--    to_char(sysdate, 'YEAR'),
--    to_char(sysdate, 'year'),
--    to_char(sysdate, 'Year'),
    
--    to_char(sysdate, 'YYYY'),
--    to_char(sysdate, 'YY'),
--    to_char(sysdate, 'YYY'),
--    to_char(sysdate, 'Y'),
--    to_char(sysdate, 'YYYYY'),

--    to_char(sysdate, 'MM'),
--    to_char(sysdate, 'MONTH'),
--    to_char(sysdate, 'MON'),

--    to_char(sysdate, 'DD'), -- 월 날짜
--    to_char(sysdate, 'D'), -- 주 날짜(일요일부터 1)
--    to_char(sysdate, 'DDD'), -- 연 날짜

--    to_char(sysdate, 'DAY'),
--    to_char(sysdate, 'DY'),

--    to_char(sysdate, 'Q') "sysdate",
--    to_char(to_date('2018/01/01'), 'Q') "20180101",
--    to_char(to_date('2018/04/01'), 'Q') "20180401",
--    to_char(to_date('2018/07/01'), 'Q') "20180701",
--    to_char(to_date('2018/10/01'), 'Q') "20181001",
    
--    to_char(sysdate, 'HH'),
--    to_char(sysdate, 'HH12'),
--    to_char(sysdate, 'HH24'),
    
--    to_char(sysdate, 'MI'),
    
--    to_char(sysdate, 'SS'),
    
--    to_char(sysdate, 'AM'),

--    to_char(sysdate,
--        'YYYY"년" MM"월" DD"일"' ||
--        ' AM HH24"시" MI"분" SS"초" DAY'),

--    to_char(sysdate, 'HH:MI YY-MM/DD'),

--    to_char(sysdate-1, 'HHth'),
--    to_char(sysdate-1, 'HHSP'),
--    to_char(sysdate-1, 'HHTHSP'),

--    to_char(sysdate, 'SYYYY'),
--    to_char(to_date('-2100', 'SYYYY'), 'SYYYY'),

    -- timestamp 데이터타입
    to_char(systimestamp, 'MI:SS.ff3')
FROM dual;




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
    DECODE( deptno,
        10, '회계팀',
        20, '연구팀',
        30, '영업팀',
        40, '운영팀',
        '부서없음') dname
FROM emp;



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



-- sum
SELECT sum(sal) tot_sal FROM emp;

-- avg
SELECT avg(sal) avg_sal FROM emp;

-- max
SELECT max(sal) max_sal FROM emp;

-- min
SELECT min(sal) min_sal FROM emp;
SELECT max(hiredate) last_emp FROM emp;
SELECT min(hiredate) oldest_emp FROM emp;

SELECT
    min(sal) min_sal
FROM emp
WHERE deptno=10;



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


SELECT
    empno, deptno
FROM emp
GROUP BY empno, deptno
ORDER BY deptno;


-- 조회 컬럼
-- deptno, dname, cnt, tot_sal, avg_sal

--  dname -> 한글로
--  cnt, tot_sal, avg_sal -> 부서별 통계
--  avg_sal -> 소수점 2자리까지

SELECT
    deptno,
    CASE deptno
        WHEN 10 THEN '회계팀'
        WHEN 20 THEN '연구팀'
        WHEN 30 THEN '영업팀'
        WHEN 40 THEN '운영팀'
        ELSE '부서없음'
    END dname,
    COUNT(*) cnt,
    SUM(sal) tot_sal,
    ROUND(AVG(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING AVG(sal)>2000
ORDER BY deptno;

