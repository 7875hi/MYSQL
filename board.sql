create database exam;
use exam;

create table board(
	bno int auto_increment primary key,  -- auto_increment : 자동으로 1씩 증가시켜주는 컬럼을 만들겠다
	title varchar(50) not null,
    content varchar(1000),
    writer varchar(5),
    regdate datetime default now(),
    -- regdate datetime,
    cnt int default 0,
    id varchar(20)
);

-- create 에서 regdate 에 디폴트값을 주지 않았을 때
-- regdate datetime,

-- insert 에서 regdate에 now() 선언하기
-- insert into board(title,content,writer,regdate,id)
-- 	values('제목', '작성하세요.', '운영자', now(), 'King');

-- cnt 도 마찬가지로 디폴트값을 주지 않았을 때 insert 에서 cnt에 0 선언하기
-- cnt int,
-- insert into board(title,content,writer,cnt,id)
-- 	values('제목', '작성하세요.', '운영자', 0, 'King');

-- alter 문으로 foreign key 설정
-- alter table 자식 테이블명 add constraint 제약조건명
-- foreign key(자식테이블 컬럼명) references 부모 테이블명(부모테이블 필드명)
alter table board add constraint boardid_fk  -- 외래키 빼고자 할 때는 제약조건명 필요
foreign key(id) references member(id)
on delete cascade  -- 부모테이블 데이터 삭제시 자식테이블 데이터도 자동 삭제
on update cascade;  -- 부모테이블 데이터 변경시 자식테이블 데이터도 자동 변경

insert into board(title,content,writer,id)
	values('제목', '작성하세요.', '운영자', 'white'),
		  ('안녕', '내용 추가', '박은희', '7875hi'),
          ('하요하요', '오늘은 날씨가 좋군요', '아망떼', 'blue'),
		  ('MYSQL', 'board 만들기', '박은희', '7875hi');
          
-- delete from board where bno=1;    

select * from member;
select * from board;

drop table board;

update board
set cnt = cnt+1
where title = '제목';

delete from member where id = 'blue';  -- member 테이블과 board 테이블의 id가 blue인 데이터 같이 삭제됨
insert into member(id, password, addr)
	values('blue', '8484', '서울');

		