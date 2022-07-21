use exam;

-- 서브쿼리

-- 1. select 절에서 사용
-- select (select * from 테이블명) from 테이블명 where 조건식

-- 급여가 2000 이상인 사원번호, 직업, 부서명을 검색하기
-- 1-1. join
select EMPNO, JOB, DNAME
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where SAL>=2000;

-- 1-2. 서브쿼리
select EMPNO, JOB, (select DNAME from DEPT d where e.DEPTNO=d.DEPTNO) 'DNAME'
from EMP e
where SAL>=2000;


-- 2. from 절에서 사용
-- select * from (select * from 테이블명) as 가상의 테이블명 where 조건식
-- from 절에 서브쿼리를 쓸 때는 반드시 가상의 테이블명 있어야 함

-- 부서별 최대 인원수 검색
select count(*) 'DEPTNOCNT'
from EMP
group by DEPTNO;

select -- DNAME '부서명',
	   max(DEPTNOCNT) '최대 인원수'
from (select count(*) 'DEPTNOCNT' from EMP group by DEPTNO) as EMPVIEW;
														   -- 가상의 테이블명  

-- 3. where 절에서 사용
-- select * from 테이블명 where (select * from 테이블명)

-- 사원테이블의 평균급여보다 많이 받는 사원의 사원번호, 이름, 부서명을 검색
select EMPNO,ENAME, DNAME
from EMP e join DEPT d
on e.DEPTNO=d.DEPTNO
where SAL >= (select avg(SAL) from EMP);

select avg(SAL) from EMP;  -- 단일 행 서브쿼리

select avg(SAL) from EMP group by DEPTNO;  -- 다중 행 서브쿼리

-- 부서별 평균급여보다 많이 받는 사원의 사원번호, 이름, 부서명을 검색
select EMPNO,ENAME, DNAME, SAL
from EMP e join DEPT d
on e.DEPTNO=d.DEPTNO
-- where SAL >= all (select avg(SAL) from EMP group by DEPTNO);
where SAL >= any (select avg(SAL) from EMP group by DEPTNO)
order by e.DEPTNO;

-- 커미션을 받는 직원
select EMPNO,ENAME, DNAME
from EMP e join DEPT d
on e.DEPTNO=d.DEPTNO
-- where ENAME in ('ALLEN', 'MARTIN', 'WARD');
where ENAME in (select ENAME from EMP where COMM > 0);




