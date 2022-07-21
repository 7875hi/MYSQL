use exam;

select * from member;
select * from board;

-- 보드 테이블 작성자 칼럼 삭제
alter table board drop writer;

-- 조인(JOIN) 
-- member 테이블하고 board 테이블 내부 조인
select bno, title, name, regdate, cnt
from member m, board b
where m.id = b.id
and bno = 4;

-- member 테이블하고 board 테이블 내부 조인
-- (표기법 : ANSI)
select bno, title, name, regdate, cnt
from member m
join board b
on m.id = b.id
where bno = 4;

select e.*, LOC -- e.DEPTNO,d.DNAME,d.LOC,e.EMPNO,e.ENAME
from EMP as e, DEPT as d
where e.DEPTNO=d.DEPTNO
order by e.DEPTNO;

-- 외부조인
-- 왼쪽 테이블(EMP)에는 있고, 오른쪽 테이블(DEPT)에는 없는 데이터
select *
from EMP e  -- 왼쪽 테이블
left outer join DEPT d  -- 오른쪽 테이블
on e.DEPTNO=d.DEPTNO;

-- 왼쪽 테이블(EMP)에는 없고, 오른쪽 테이블(DEPT)에는 있는 데이터
select *
from EMP e  -- 왼쪽 테이블
right outer join DEPT d  -- 오른쪽 테이블
on e.DEPTNO=d.DEPTNO;

-- 왼쪽 테이블(DEPT)에는 있고, 오른쪽 테이블(EMP)에는 없는 데이터
select *
from DEPT d  -- 왼쪽 테이블
left outer join EMP e  -- 오른쪽 테이블
on e.DEPTNO=d.DEPTNO;


-- 집단함수
-- 총 직원 수, 총 급여 금액
select count(*) as '전체 사원수',  -- 괄호안에 * 하면 null값 포함 전체 갯수/속성명을 주면 null값을 빼고
	   sum(SAL) as '전체 급여액',
       avg(SAL) as '급여 평균',
       max(SAL) as '최대 급여',
       min(SAL) as '최저 급여',
       DNAME
from EMP e
join DEPT d  -- 오른쪽 테이블
on e.DEPTNO=d.DEPTNO
group by d.DEPTNO
having avg(SAL)>=2500;


-- 1. 각 부서별로 지급되는 총 월급    
select DEPTNO '부서번호',
	   sum(SAL) '총 월급'
from EMP
group by DEPTNO
order by DEPTNO;

-- 2. 각 직업별로 월급이 제일 많은 사람과 제일 적은 사람의 차이는? 
select JOB '직업',
	   max(SAL)-min(SAL) '최고-최저'
from EMP
group by JOB;

-- 3. 커미션이 없는 사람 중에 각 부서별로 월급이 제일 작은 사람은? 
select DEPTNO '부서번호',
	   min(SAL) '최저 월급'
from EMP
where COMM is null or COMM = 0
group by DEPTNO
-- having COMM is null
order by DEPTNO;

-- 3-1. 커미션이 없는 사람 중에 각 부서별로 월급이 제일 작은 사람은? (월급과 이름 매칭하기)
select min(SAL), ENAME from EMP
where SAL in (select min(SAL) from EMP group by DEPTNO)  -- 서브쿼리
group by DEPTNO;

-- 4. 급여가 3000대인 회원의 사원번호, 성명, 일하는 지역을 검색
select EMPNO '사원번호',
	   ENAME '성명',
       LOC '지역'
from EMP e
join DEPT d
on e.DEPTNO = d.DEPTNO
where SAL between 3000 and 3999;
-- order by DEPTNO;

-- 5. 성명에 'LA'가 포함된 회원의 성명, 부서명, 일하는 지역을 검색  
select ENAME '성명',
	   DNAME '부서명',
       LOC '지역'
from EMP e
join DEPT d
on e.DEPTNO = d.DEPTNO
where ENAME like '%LA%';  