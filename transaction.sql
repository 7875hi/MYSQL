use exam;

select * from board;

-- 제목을 클릭했을 때(트랜잭션 발동)
start transaction;
-- 제목과 내용이 조회됨과 동시에
select title, content from board where id = '7875hi';
-- 조회수가 1씩 증가
update board 
set cnt = cnt +1
where id = '7875hi';

-- commit;
rollback;

