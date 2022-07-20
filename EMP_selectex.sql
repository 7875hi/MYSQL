use exam;

create table EMP(
	EMPNO varchar(4) primary key,
    ENAME varchar(10),
    JOB varchar(10),
    MGR varchar(4),
    HIREDATE date,
    SAL int,
    COMM int,
    DEPTNO varchar(2)
);

insert into EMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
	values('7369', 'SMITH', 'CLERK', '7902', '1980-12-17', 800, NULL, 20),
		  ('7499', 'ALLEN', 'SALESMAN', '7698', '1981-02-20', 1600, 300, 30),
          ('7521', 'WARD', 'SALESMAN', '7698', '1981-02-22', 1250, 500, 30),
          ('7566', 'JONES', 'MANAGER', '7839', '1981-04-02', 2975, NULL, 20),
          ('7654', 'MARTIN', 'SALESMAN', '7698', '1981-09-28', 1250, 1400, 30),
          ('7698', 'BLAKE', 'MANAGER', '7839', '1981-05-01', 2850, NULL, 30),
          ('7782', 'CLARK', 'MANAGER', '7839', '1981-06-09', 2450, NULL, 10),
          ('7788', 'SCOTT', 'ANALYST', '7566', '1982-12-09', 3000, NULL, 20),
          ('7839', 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
          ('7844', 'TURNER', 'SALESMAN', '7698', '1981-09-08', 1500, 0, 30),
          ('7876', 'ADAMS', 'CLERK', '7788', '1983-01-12', 1100, NULL, 20),
          ('7900', 'JAMES', 'CLERK', '7698', '1981-12-03', 950, NULL, 30),
          ('7902', 'FORD', 'ANALYST', '7566', '1981-12-03', 3000, NULL, 20),
          ('7934', 'MILLER', 'CLERK', '7782', '1982-01-23', 1300, NULL, 10);
          
select * from EMP;

-- drop table EMP;

-- where 절 활용
-- 사원 테이블(EMP)에서 사원번호(EMPNO) 7566 인 이름(ENAME)과 부서번호(DEPTNO) 검색
select ENAME,DEPTNO  -- 이름(ENAME) 부서번호(DEPTNO) 검색
from EMP  -- 사원 테이블(EMP)에서
where EMPNO = '7566';  -- 사원번호(EMPNO) 7566 인

-- 사원테이블에서 부서번호(DEPTNO)가 20번이고 월급(SAL)이 400 이상인 사원의 이름(ENAME)과 직책(JOB) 검색
select ENAME, JOB
from EMP
where DEPTNO = '20' and SAL>=400;  -- 컬럼명이 틀리면 between 연산자 사용 못함

-- 사원테이블에서 월급(SAL)이 2000 대인 사원의 이름과 직책 검색
select ENAME, JOB
from EMP
where SAL>=2000 and 3000>SAL;

-- 사원테이블에서 월급(SAL)이 2000 대인 사원의 이름과 직책 검색 (between 연산자)
select ENAME, JOB
from EMP
where SAL between 2000 and 2999;

-- 사원테이블에서 직업이 'SALESMAN' 이거나 'MANAGER'인 사원의 사원번호와 이름 검색
select EMPNO, ENAME
from EMP
where JOB = 'SALESMAN' or JOB = 'MANAGER';  -- where JOB in ('SALESMAN', 'MANAGER')

-- 사원테이블에서 COMM이 NULL 값인 사원의 사원 번호와 이름 검색
select EMPNO, ENAME
from EMP
where COMM is NULL;  -- is null : null 값 조회 / is not null : null 값 아닌거 조회

-- 사원테이블에서 이름이 'SMITH'인 사원의 월급과 부서번호를 검색
select SAL, DEPTNO
from EMP
where ENAME = 'SMITH';

-- 검색할 때 쓰이는 연산자 : MYSQL LIKE 연산자
-- 사원테이블에서 이름이 'S'로 시작하는 사원의 월급과 부서번호를 검색
select SAL, DEPTNO
from EMP
where ENAME like 'S%';  -- S로 시작하는 모든 문자

-- 정렬
-- 오름차순 asc(생략가능): 가~하 / 1~10
-- 내림차순 desc: 하~가 / 10~1
-- 사원테이블에서 급여가 높은순부터 정렬하시오
select *
from EMP
-- where JOB = 'MANAGER'
order by SAL desc;

-- 1. 사원 테이블에서 사원 번호와 이름과 월급을 출력하라
select EMPNO,ENAME,SAL
from EMP;

-- 2. 직위가 'SALESMAN'이고 월급이 1000이상인 사원의 이름과 월급을 출력하라.
select ENAME,SAL
from EMP
where JOB = 'SALESMAN' and SAL>=1000;

-- 3. 직위가 MANAGER인 사원을 뽑는데 월급이 높은 사람순으로 이름, 직위, 월급을 출력하라.
select ENAME,JOB,SAL
from EMP
where JOB = 'MANAGER'
order by SAL desc;

-- 4. 이름이 SCOTT인 사원의 이름, 월급, 직업, 입사일, 부서 번호를 출력하라
select ENAME,SAL,JOB,HIREDATE,DEPTNO
from EMP
where ENAME = 'SCOTT';

-- 5. 81년 11월 17일에 입사한 사원의 이름, 월급, 직업, 입사일을 출력하라
select ENAME,SAL,JOB,HIREDATE
from EMP
where HIREDATE = '1981-11-17';

-- 6. 월급이 3600 이상인 사원들의 이름과 월급을 출력하라
select ENAME,SAL
from EMP
where SAL >= 3600;

-- 7. 월급이 1200 이하인 사원들의 이름과 월급, 직업, 부서번호를 출력하라
select ENAME,SAL,JOB,DEPTNO
from EMP
where SAL <=1200;

-- 8. 직업이 SALESMAN이 아닌 사원들의 이름과 부서 번호, 직업을 출력하라
select ENAME,DEPTNO,JOB
from EMP
where JOB not like 'SALESMAN';  -- where JOB != 'SALESMAN'

-- 9. 월급이 1000에서 3000사이가 아닌 사원들의 이름과 월급을 출력하라
select ENAME,SAL
from EMP
where SAL not between 1000 and 3000;

-- 10. 이름의 끝 글자가 T로 끝나는 사원들의 이름과 월급을 출력하라
select ENAME,SAL
from EMP
where ENAME like '%T';

-- 11. 커미션이 NULL인 사원들의 이름과 커미션을 출력하라
select ENAME,COMM
from EMP
where COMM is null;

-- 12. 직업이 SALESMAN, ANALYST, MANAGER가 아닌 사원들의 이름, 월급, 직업을 출력하라
select ENAME,SAL,JOB
from EMP
where not JOB in ('SALESMAN', 'ANALYST', 'MANAGER');