#서브쿼리 사용하여 여러줄 insert

insert into emp1
select employee_id, last_name, salary, department_id
from employees
where department_id=80;

create table emp1 as 
select employee_id as emp_id, last_name as name, salary as sal, department_id as dept_id
from employees
where 1=0;

select * from emp1;
desc emp1;


insert into emp1 values(200,'aaa',500,70);

#alter table: 테이블 구조를 수정. 컬럼추가, 컬럼삭제, 컬럼수정, 제약조건 추가 등등..alter

alter table emp1
add foreign key(dept_id) references departments(department_id);

#emp_id 에 primary key 제약조건 추간 
alter table emp1
add primary key(emp_id);

delete from emp1 where dept_id <> 80;

set sql_safe_updates=0;

delete from emp1 where dept_id <>80;

delete from departments where department_id = 70;

#update 문
#update 테이블명 set 컬럼1= val1, 컬럼2=val2 ...where 조건;
select * from emp1;

update emp1 set sal=15000;

#delte 행 삭제 
delete from emp1 where name='Turker';


#트랜젝션 
set autocommit = 0; #자동커밋 해제
insert into emp1 values(200,'bbb',15000,70);
insert into emp1 values(201,'bbb',5000,90);
insert into emp1 values(202,'ddd',4000,100);

select * from emp1;

create table test2(
num int auto_increment primary key,
name varchar(20) not null,
address varchar(50) default '서울',
w_date datetime default now(),
msg varchar(200) 
);

desc test2;

insert into test2(name,address,msg) values('sun','남양주','뭐요!');
select * from test2;

update test2 set name='sunbyungha' where name='sun';


#테이블 수정: 테이블 구조 변경. 컬럼추가, 컬럼삭제, 컬럼의 타입이나 크기를 변경(값이 없을때)

#컬럼 추가
#alter table 테이블명
#add (컬럼명 타입(크기))

alter table test2
add (pwd varchar(10));

#컬럼변경 (타입이나 크기 변경)
#alter table 테이블명
#modify (컬럼명 새타입(새크기));

alter table test2
modify pwd varchar(20);

alter table test2
change pwd password varchar(20);
desc test2;

alter table test2
drop column password;

alter table test2
add col2 varchar(10);


#drop column은 한번에 컬럼 하나만 삭제가능
-- alter table test2
-- drop column col1,col2 ; > 작동안됨

alter table test2
rename new_test2;
desc new_test2;

delete from new_test2;
select * from new_test2; #delete는 rollback이 되지만, truncate은 불가능!
rollback;

#truncate 는 DDL 문장으로 rollback이 안됨, 전체행 삭제
truncate table new_test2;
rollback;

#게시판(num,writer,w_date,title,content) . 회원가입. 로그인. (id,pwd,name,email)

create table member(
id varchar(20) primary key,  # 이 줄의 대표값
pwd varchar(20) not null,    # null을 허용 안함
name varchar(20) not null,
email varchar(100) unique    # 중복허용안함
);

desc member;

insert into member values ('aaa','1234','sun','aaaa@gmail.com');
insert into member values ('bbb','5678','byung','bbb@gmail.com');
insert into member values ('ccc','1536','ha','ccc@gmail.com');

select * from member;

#게시판(num, writer, w_date, title, content)
create table board(
num int auto_increment primary key,
writer varchar(20),
w_date datetime,
title varchar(50),
content varchar(500),
constraint foreign key(writer) references member(id) on delete set null
);

insert into board (writer, w_date, title, content) 
values ('aaa',sysdate(),'화성가즈아','비트토렌트 진짜 제발 화성좀 가즈아');
desc board;
select * from board;

insert into board (writer, w_date, title, content) 
values ('aaa',sysdate(),'화성가즈아','비트토렌트 진짜 제발 화성좀 가즈아');

insert into board (writer, w_date, title, content) 
values ('bbb',sysdate(),'화성가즈아2','비트토렌트 진짜 제발 화성좀 가즈아2');

delete from member where id='bbb'; #bbb를 참조하는 값이 있기에 삭제 안됨! 

delete from board where writer='bbb'; #이거 실행하고 나면 위에 문장이 실행됨!


## >> 그래서 on delete cascade ! 

drop table board;

#on delte set null: 부모 테이블의 행 삭제시 이 줄을 참조하는 모든 줄의 값을 null로 셋팅

delete from member where id='aaa';