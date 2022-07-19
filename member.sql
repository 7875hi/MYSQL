create database exam;
use exam;

create table member(
	id varchar(20) PRIMARY KEY,
	password varchar(20) NOT NULL,
    addr varchar(30) NOT NULL,
    phone varchar(12),
    email varchar(20),
    name varchar(5),
    age int
);

-- insert into 테이블명(컬럼명, 컬럼명, 컬럼명....)
insert into member(id, password, addr, phone, email, name, age)
	values('7875hi', '1234', '울산', '01024947875', '7875hi@naver.com', '박은희', 27);

insert into member(id, password, addr)
	values('green', '5678', '부산');

-- member 테이블에 있는 모든 컬럼을 조회   
-- select 컬럼명 from 테이블명 
select * from member;

-- member 테이블에 있는 아이디, 비번, 이메일 컬럼만을 조회
select id, password, email from member;

-- update 테이블명
-- set 변경하고자 하는 컬럼명 = 값
-- 개명(박은희 -> 박희연)
update member
set name = '박희연';  -- 모든 name 값이 박희연으로 바뀜

-- 비밀번호 변경
update member
set password = '5678';  -- 모든 password 값이 5678로 바뀜

-- member 테이블 중에서 id가 '7875hi'인 데이터의 모든 컬럼을 조회
-- select 컬럼명
-- from 테이블명
-- where 조건식
select *
from member
where id = '7875hi';

update member
set name = '박은희'  -- id가 '7875hi'인 데이터의 name 값만 바뀜
where id = '7875hi';
update member
set password = '1234'  -- id가 '7875hi'인 데이터의 password 값만 바뀜
where id = '7875hi';

-- 아이디가 'green'인 데이터를 member 테이블에서 삭제
-- delete from 테이블명
-- where 조건식
delete from member
where id = 'green';

-- 인서트 한 번 써서 2개의 데이터 넣기
insert into member(id, password, addr)
	values('blue', '8484', '서울'),
		  ('white', '9999', '강원도'),
          ('red', '5555', '대구'),
          ('black', '4444', 'hell');
    
