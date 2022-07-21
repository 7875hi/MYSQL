use exam;

create table DEPT(
DEPTNO varchar(2) primary key,
DNAME varchar(15),
LOC varchar(20)
);

insert into DEPT(DEPTNO,DNAME,LOC)
	values('10', 'ACCOUNTING', 'NEW YORK'),
		  ('20', 'RESEARCH', 'DALLAS'),
          ('30', 'SALES', 'CHICAGO'),
          ('40', 'OPERATIONS', 'BOSTON'),
          ('50', 'DEVELOPER', 'KOREA');
          
select * from DEPT;

-- drop table DEPT;

select e.DEPTNO,d.DNAME,d.LOC,e.EMPNO,e.ENAME
from EMP as e
join DEPT as d
on e.DEPTNO=d.DEPTNO
order by e.DEPTNO;

select sum(SAL) as '전체 월급합계',
	avg(SAL) as '전체 월급평균',
    max(SAL) as '전체 최대월급',
    min(SAL) as '전체 최소월급',
    count(*) as '전체 사원수'  -- 괄호안에 * 하면 null값 포함 전체 갯수/속성명을 주면 null값을 빼고
from EMP;

-- 부서번호, 부서명, 부서별 월급합계 출력하기
select e.DEPTNO as '부서번호', d.DNAME as '부서명', sum(SAL) as '전체 월급합계'
from EMP as e
join DEPT as d
on e.DEPTNO=d.DEPTNO
group by e.DEPTNO
order by e.DEPTNO;

-- 부서의 최대 봉급이 2000 초과인 부서에 대해서만 부서번호, 부서명, 부서별 월급합계, 부서별 사원들의 평균 월급 출력하기
select e.DEPTNO as '부서번호', d.DNAME as '부서명', sum(SAL) as '부서별 월급합계', avg(SAL) as '부서별 월급 평균'
from EMP as e
join DEPT as d
on e.DEPTNO=d.DEPTNO
group by e.DEPTNO
having max(SAL)>2000  -- 부서의 최대 봉급이 2000 초과인 부서에 대해서만
order by e.DEPTNO;

select e.JOB as '직업명', e.DEPTNO as '부서번호', d.DNAME as '부서명'
from EMP as e
join DEPT as d
on e.DEPTNO=d.DEPTNO
order by e.JOB;
