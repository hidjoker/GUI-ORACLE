SELECT * FROM emp; --사원 테이블
SELECT * FROM dept; --부서 테이블
SELECT * FROM bonus; --보너스 테이블
SELECT * FROM salgrade; --급여테이블 테이블

SELECT * FROM tabs; --전체 테이블 조회
SELECT table_name FROM tabs; --전체 테이블명 조회

SELECT * FROM emp;

desc emp; -- emp 테이블 스키마 정보

-- INSERT구문 테스트
--데이터를 테이블에 삽입할 때 사용
-- ctrl + / : 한줄 주석
desc dept;
INSERT INTO dept VALUES (90, '', '');
INSERT INTO dept 
VALUES (91, null, null);
SELECT * FROM dept;

-- UPDATE TEST
UPDATE dept
SET loc = 'SEOUL';

--DELETE TEST
DELETE dept
WHERE deptno = 40; --부서번호가 40인 행 삭제
SELECT * FROM dept;

SELECT * FROM emp;
DELETE emp; --전체삭제

--commit; --커밋, 변경된 데이터 영구반영하기(되돌릴 수 없음)
--rollback; --롤백, 변경된 데이터 반영하지 않기(되돌리기)



-- DDL 기본 테스트
CREATE TABLE test ( -- test테이블 생성
    test1 NUMBER, -- 숫자데이터 컬럼
    test2 VARCHAR2(10) -- 문자열데이터 컬럼
);
desc test; -- 테이블 구조(컬럼,널여부,데이터타입) 확인

SELECT * FROM tabs; --테이블스키마 상세 데이터사전 tabs
SELECT * FROM tab; --테이블스키마 간략 데이터사전 tab

DROP TABLE test; -- 테이블 삭제

-- recyclebin : 오라클에서 제공하는 휴지통
SHOW recyclebin; -- 휴지통 확인
FLASHBACK TABLE test TO BEFORE DROP; --휴지통에서 복구
SELECT * FROM tabs;
PURGE recyclebin; -- 휴지통 비우기

DROP TABLE test PURGE; -- 휴지통에 넣지않고 삭제
SELECT * FROM tab;





-- SELECT 구문
SELECT * FROM emp; -- 전체조회
SELECT empno, ename FROM emp; -- empno,ename컬럼만 조회

SELECT
    empno AS 사번,
    ename AS 사원이름
FROM emp;






-- WHERE 절

-- 관계연산자
SELECT empno, ename, deptno
FROM emp
--WHERE deptno=10; --부서번호가 10번인 조건
--WHERE deptno>20; --부서번호가 20번보다 큰 조건
WHERE deptno<>20; --부서번호가 20이 아닌 조건


-- 논리 연산자
-- 부서번호가 30이고, job이 'SALESMAN'인 사원 조회
SELECT empno, ename, deptno
FROM emp
WHERE deptno=30
    AND job='SALESMAN';
    
-- 부서번호가 30이고 직무가 영업이 아닌 사원
SELECT empno, ename, deptno
FROM emp
WHERE deptno=30
    AND NOT(job='SALESMAN');
    
-- 부서번호가 30이 아니고 직무가 영업이 아닌 사원
SELECT empno, ename, deptno, job
FROM emp
WHERE NOT(deptno=30
    OR job='SALESMAN');
-- WHERE deptno!=30 AND job!='SALESMAN'   




-- 기타 연산자

-- BETWEEN a AND b
SELECT empno, ename FROM emp
WHERE empno BETWEEN 7700 AND 7900;
--WHERE empno>=7700 AND empno<=7900;

-- NOT BETWEEN a AND b
SELECT empno, ename FROM emp
WHERE empno NOT BETWEEN 7700 AND 7900;


-- IN(list)
SELECT empno, ename FROM emp
WHERE empno IN ( 7369, 7521, 7654, 7777, 8888 );
--WHERE empno=7369
--    OR empno=7521
--    OR empno=7654
--    OR empno=7777
--    OR empno=8888;

SELECT empno, ename FROM emp
WHERE empno NOT IN ( 7369, 7521, 7654, 7777, 8888 );



-- LIKE
SELECT empno, ename FROM emp
--WHERE ename LIKE '%R%'; --이름에 R을 포함하는 모든 사원
--WHERE ename LIKE '_A%'; --이름의 두번째가 A인 사원
--WHERE ename LIKE '%RD'; --이름의 마지막이 RD인 사원
WHERE ename NOT LIKE '%R%'; --이름에 R이 없는 사원

SELECT empno, ename FROM emp
--WHERE ename LIKE 'KING'; --하면 안됨
WHERE ename = 'KING';



-- IS NULL
SELECT empno, ename FROM emp
--WHERE mgr IS NULL;
--WHERE mgr = null; --적용안됨
WHERE mgr IS NOT NULL;



-- WHERE 문제
-- SELECT empno, ename, deptno FROM emp
-- WHERE
-- 구조를 이용하여 해결할 것

 -- 부서번호가 30이고 직무가 영업인 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE deptno = 30 AND job = 'SALESMAN';

 -- 부서번호가 30이고 직무가 영업이 아닌 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE deptno = 30 AND job <> 'SALESMAN';

 -- 부서번호가 30이 아니고 직무가 영업이 아닌 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE deptno <> 30 AND job <> 'SALESMAN';

 -- 사원번호가 7782에서 7900 사이인 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE empno BETWEEN 7782 AND 7900;

 -- 사원명이 'A'부터 'C'로 시작하는 사원 조회
SELECT empno, ename, deptno FROM emp
WHERE ename>='A' AND ename<'D';
--WHERE ename BETWEEN 'A' AND 'D';
--WHERE ename LIKE 'A%' OR ename LIKE 'B%' OR ename LIKE 'C%';

 -- 부서번호가 10 또는 30인 사원 조회 (IN 사용)
SELECT empno, ename, deptno FROM emp
WHERE deptno IN (10,30);






-- ORDER BY 절
SELECT * FROM emp
--ORDER BY empno; --사번 오름차순
--ORDER BY ename; -- 이름 오름차순
ORDER BY ename DESC; -- 이름 내림차순


-- deptno기준으로 정렬 후 그룹 내에서 empno로 정렬
SELECT * FROM emp
ORDER BY deptno DESC, empno ASC;

-- NULL 데이터를 뒤로 보내기
SELECT * FROM emp
ORDER BY comm DESC NULLS LAST;

-- NULL 데이터를 앞으로 보내기
SELECT * FROM emp
ORDER BY comm NULLS FIRST;


-- NULLS 설정도 각각의 정렬기준(컬럼)에 적용된다
SELECT * FROM emp
ORDER BY comm ASC NULLS FIRST, sal DESC;


SELECT * FROM emp
WHERE deptno = 10
ORDER BY sal DESC;

SELECT * FROM emp;

SELECT empno, comm FROM emp
WHERE comm>=0;