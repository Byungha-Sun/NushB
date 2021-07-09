use test;

#테이블 생성
create table tba(
num integer primary key,
name char(10) not null
);

#insert: 테이블에 한 줄 추가
insert into tba values(1, 'aaa');
insert into tba values(2, 'bbb');
insert into tba values(3, 'ccc');
insert into tba values(4, 'ddd');

#검색
select * from tba;

desc encore.board;
select * from encore.board;
select * from encore.member;