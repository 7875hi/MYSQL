select bno as '게시판번호',  
	   title as '제목',
	   writer as '작성자',
	   regdate as '작성일자',
	   cnt+1 '조회수'  -- as 생략가능
from board;


