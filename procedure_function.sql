-- 프로시저 선언
delimiter //
create procedure 프로시저명()
begin
	select * from member;
    select * from board;
end
//
delimiter ;

-- 프로시저 (부서번호가 10인 사원 출력)
delimiter //
create procedure pr1(a varchar(2))
begin
	select * from EMP where DEPTNO = a;
end
//
delimiter ;

-- pr1 프로시저 호출 (부서번호 10을 매개변수 a에 셋팅)
call pr1(10);

drop procedure pr1;


-- 함수
-- error : 1418 
show global variables like 'log_bin_trust_function_creators';  -- 이 값이 on인지 off인지 확인해보기
-- off 이기 때문에 함수 호출 안됨, on으로 만들어주기
SET GLOBAL log_bin_trust_function_creators = 1; -- //on 
-- SET GLOBAL log_bin_trust_function_creators = 0; //OFF

-- fu1 함수 선언
delimiter //
create function fu1(a int, b int) returns int
begin

   return a+b;

end
//
delimiter ;

-- fu1 함수 호출
select fu1(10,20);


-- fu2 함수 선언
delimiter //
create function fu2() returns double
begin

   -- 변수 선언(declare)
   declare R double;
   select avg(SAL) 
   into R
   from EMP;
   return R;

end
//
delimiter ;

-- fu2 함수 호출
select fu2() 'avg';




-- EMP 테이블 이용해 인수에 부서번호 하나 설정하면, 해당하는 부서의 급여합계를 반환하는 저장 함수 F_SALES()를 만드시오
delimiter //
create function F_SALES(d varchar(2)) returns int
begin
	
   declare total int;
   select sum(SAL) 
   into total
   from EMP
   where DEPTNO = d;
   return total;

end
//
delimiter ;

select F_SALES(20) 'sum';

drop function F_SALES;


select sum(SAL) 
from EMP
group by DEPTNO;
