create database exam;
use exam;

create table member(
	id varchar(20) PRIMARY KEY,
	password varchar(30) NOT NULL,
    name varchar(5),
    birth datetime,  -- date : 날짜, datetime : 날짜시간
    gender varchar(1)
);
-- member 테이블에 주소 컬럼 추가 (add)
alter table member add column address varchar(30);
-- member 테이블에 비밀번호 컬럼의 글자수를 20자로 변경 (modify)
alter table member modify column password varchar(20) NOT NULL;
-- member 테이블 제거
drop table member;