use encore;
select * from board;
desc member;
select * from encore.member;
desc board;

create table board(
 num int auto_increment primary key,
 writer varchar(20),
 w_date datetime, 
 title varchar(50),
 content varchar(500),
 constraint foreign key(writer) references member(id) on delete cascade);


call mem_join('bbb',12524,'hahaha','sun5252@gmail.com');
call write_board('aaa','테스트용 제목', '테스트용 컨텐츠');
call find_num(2);
call find_writer('aaa');
call write_board('bbb','why', 'not working');

call find_word('테스트');
call find_word('wh');
call print_all();