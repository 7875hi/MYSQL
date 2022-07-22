use exam;

-- 1) 'ALLEN'의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 출력하세요.
select ENAME '이름' ,DNAME '부서명' ,SAL '급여' ,JOB '직무'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where JOB = (select JOB from EMP where ENAME = 'ALLEN');

-- 2) JONES가 속해있는 부서의 모든 사람의 사원번호, 이름, 입사일, 급여를 출력하세요.
select EMPNO '사원번호' , ENAME '이름', HIREDATE '입사일' ,SAL '급여'
from EMP
where DEPTNO = (select DEPTNO from EMP where ENAME = 'JONES');

-- 3) 전체 사원의 평균 임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하세요.
select EMPNO '사원번호' , ENAME '이름', DNAME '부서명', HIREDATE '입사일' , LOC '지역' , SAL '급여'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where SAL >= (select avg(SAL) from EMP);

-- 4) 10번 부서와 같은 일을 하는 사원의 사원번호, 이름, 부서명, 지역, 급여를 급여가 많은 순으로 출력하세요.
select EMPNO '사원번호' , ENAME '이름', DNAME '부서명', LOC '지역' , SAL '급여'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where JOB in (select JOB from EMP where e.DEPTNO = '10')
order by SAL desc;

-- 5) 'MARTIN'이나 'SCOTT'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하세요.
select EMPNO '사원번호' , ENAME '이름', SAL '급여'
from EMP
where SAL in (select SAL from EMP where ENAME in('MARTIN' , 'SCOTT'));

-- 6) 부서번호가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하세요.
select EMPNO '사원번호' , ENAME '이름', SAL '급여'
from EMP
where SAL > (select max(SAL) from EMP where DEPTNO = '30');

-- 7)** 사원중에서 급여(sal)와 보너스(comm)을 합친 금액이 가장 많은 경우와 가장 적은 경우, 평균 금액을 구하세요.(ifnull()사용)

select max(total) 'max',
	   min(total) 'min'
from (select sum(SAL + COMM) 'total' from EMP group by EMPNO) as ba;

select max(SAL+ifnull(COMM,0)) 'max',
	   min(SAL+ifnull(COMM,0)) 'min',
       avg(SAL+ifnull(COMM,0)) 'avg'
from EMP;

-- 8) 부서별로 급여합계를 구하세요.
select DNAME '부서명',
	   sum(SAL) '급여합계'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
group by e.DEPTNO;

-- 9) 급여가 3000이상이면, 급여+급여의 15%의 격려금을, 급여가 2000이상이면, 급여+급여의 10%의 격려금을,급여가 1000이상이면, 급여+급여의 5%의 격려금을, 그렇지 않으면 급여를 구하여, 이름, 직업, 급여,격려금을 표시하시오.
-- HINT : DECODE사용(구글로 검색해보세요.)
select ENAME '이름', JOB '직업', SAL '급여', (case when SAL >= 3000 then SAL + SAL*0.15
											   when SAL >= 2000 then SAL + SAL*0.1
                                               when SAL >= 1000 then SAL + SAL*0.05
                                               else SAL
										  end) as '격려금'
from EMP;

-- 10) 'MARTIN'과 같은 매니저와 일하는 이름, 직업, 급여, 부서명, 지역을 구하세요.
select ENAME '이름', JOB '직업', SAL '급여', DNAME '부서명', LOC '지역', MGR '매니저번호'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where MGR = (select MGR from EMP where ENAME = 'MARTIN');

-- 11) 부서명이 'RESEARCH'인 사람의 이름, 직업, 급여,부서명을 표시하시오.
select ENAME '이름', JOB '직업', SAL '급여', DNAME '부서명'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where DNAME = 'RESEARCH';

-- 12)** 각 부서별 평균 급여를 구하고, 그 중에서 평균 급여가 가장 적은 부서의 평균 급여보다 적게 받는 사원들의 부서명, 지역, 급여를 구하세요.
select DNAME '부서명', LOC '지역', SAL '급여'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where SAL < (select min(AVGSAL) from (select avg(SAL) 'AVGSAL' from EMP group by DEPTNO) as minsalview);


select min(AVGSAL) from (select avg(SAL) 'AVGSAL' from EMP group by DEPTNO) as minsalview;

-- 13) 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데 'BLAKE'는 빼고 출력하라.
select ENAME '이름', HIREDATE '입사일'
from EMP
where DEPTNO = (select DEPTNO from EMP where ENAME = 'BLAKE')
	  and ENAME != 'BLAKE';

-- 14) 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고있는 사원의 사원번호와 이름을 출력하라.
select EMPNO '사원번호' , ENAME '이름'
from EMP
where DEPTNO in (select DEPTNO from EMP where ENAME like '%T%');

-- 15) 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름, 급여를 출력하라.
select EMPNO '사원번호' , ENAME '이름', SAL '급여'
from EMP
where DEPTNO in (select DEPTNO from EMP where SAL > (select avg(SAL) from EMP) and
											  ENAME like '%S%');

-- 16) 커미션을 받는 사원과 (부서번호, 월급)이 같은 사원의 이름, 월급, 부서번호를 출력하라.
select ENAME '이름', SAL '급여', DEPTNO '부서번호'
from EMP
where DEPTNO in (select DEPTNO from EMP where COMM is not null and COMM > 0) 
and SAL in (select SAL from EMP where COMM is not null and COMM > 0);

-- 17) 직업명과 사원의 등급을 직업이 'PRESIDENT' 이면 'A', 직업이 'ANALYST' 이면 'B', 직업이 'MANAGER' 이면 'C', 직업이 'SALESMAN' 이면 'D', 직업이 'CLEARK' 이면 'E' 로 표시하시오.
select JOB
from EMP
group by JOB;

select ENAME '성명',JOB '직업명', ( case JOB
					    when 'PRESIDENT' then 'A' 
						when 'ANALYST' then 'B'
						when 'MANAGER' then 'C'
						when 'SALESMAN' then 'D'
						else 'E'
                        end) as '등급'
from EMP;

-- 18) 10번 부서중에서 30번 부서에는 없는 업무를 하는 사원의 사원번호, 이름, 부서명,입사일, 지역을 출력하라.
select EMPNO '사원번호' , ENAME '이름', DNAME '부서명', HIREDATE '입사일', LOC '지역'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where e.DEPTNO = '10'
and e.JOB not in (select JOB from EMP where DEPTNO = 30);

select JOB from EMP where DEPTNO = 30;  -- 30번 부서에 있는 업무(직업)

-- 19) 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select EMPNO '사원번호' , ENAME '이름', SAL '급여'
from EMP
where SAL > (select max(SAL) from EMP where DEPTNO = '30');

-- 20) 급여가 30번 부서의 최저 급여보다 낮은 사원의 사원번호, 이름, 급여를 출력하라.
select EMPNO '사원번호' , ENAME '이름', SAL '급여'
from EMP
where SAL < (select min(SAL) from EMP where DEPTNO = '30');

-- 21) 사원 중에서 입사일이 가장 빠른 사원의 사원번호, 이름, 입사일, 부서명을 출력하세요.
select EMPNO '사원번호' , ENAME '이름', HIREDATE '입사일', DNAME '부서명'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where HIREDATE = (select min(HIREDATE) from EMP);

-- 22) 평균 연봉보다 많이 받는 사원들의 사원번호, 이름, 연봉을 연봉이 높은 순으로 정렬하여 출력하세요. (연봉은 sal*12+comm으로 계산)
-- HINT : IFNULL사용(구글로 검색해보세요.)
select DEPTNO '부서번호', ENAME '이름', SAL*12+ifnull(comm,0) '연봉'
from EMP
where SAL*12+ifnull(comm,0) > (select avg(SAL*12+ifnull(comm,0)) as '평균 연봉' from EMP)
	            -- 연봉      >     -- 평균 연봉
order by SAL*12+ifnull(comm,0) desc;

-- 23) EMP와 DEPT TABLE을 JOIN하여 부서 번호, 부서명, 이름, 급여를 출력하라.
select e.DEPTNO '부서번호' , DNAME '부서명', ENAME '이름', SAL '급여'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
order by e.DEPTNO;

-- 24) 이름이 'ALLEN'인 사원의 부서명을 출력하라.
select ENAME '이름', DNAME '부서명'
from EMP e
join DEPT d
on e.DEPTNO=d.DEPTNO
where ENAME = 'ALLEN';

-- 25) DEPT Table 에는 존재하는 부서코드이지만 해당부서에 근무하는 사람이 존재하지 않는 경우의 결과를 출력하라.
select d.DEPTNO '부서번호', DNAME '부서명', ifnull(e.DEPTNO,0) '근무자'
from EMP e
right outer join DEPT d
on e.DEPTNO=d.DEPTNO
where e.DEPTNO is null;

select *
from EMP e
right outer join DEPT d
on e.DEPTNO=d.DEPTNO
where e.DEPTNO is null;
