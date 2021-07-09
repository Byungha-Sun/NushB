use encore;

-- #제약조건 검색
-- select * from information_schema.table_constraints;

-- #제약조건 삭제
-- alter table 테이블명
-- drop constraint 제약조건 이름;

-- alter table 테이블명
-- drop foreign key 제약조건이름;

-- #제약조건 추가
-- #primary key  추가
-- alter table 테이블명
-- add constraint [사용할 제약조건이름] primary key(컬럼명);

-- #foreign key 추가
-- alter table 테이블명
-- add constraint [사용할 제약조건이름] foreign key(컬럼명)
-- references 부모테이블(컬럼명) [on delete set null/ on delete cascade] 등등 ;

-- #not null 제약조건 추가 > modify로 수정해줘야함!
-- alter table 테이블명
-- modify 컬럼명 [타입] constraint [사용할 제약조건 이름] not null 

-- 뷰: 가상 테이블 (테이블에 다이렉트를 접근하는게 아니라, 창문을 통해 일부분만 제공) ->쓰기 작업은 왠만하면 하지 마라!
-- 1. 복잡한 쿼리를 가상 테이블인 뷰로 만들면 사용이 간다해진다.
-- 2. 보안(사용자의 레벨에 따라서 접근 레벨 분류 가능)
-- 3. 데이터의 독립성을 유지

#생성
-- create [or replace] view 뷰이름
-- as
-- (서브쿼리)

create view view_80
as
select employee_id as emp_id, last_name as name, salary 
from employees
where department_id=80; 

select * from view_80;
update view_80 set name='aaa' where emp_id=145;

select last_name from employees where employee_id=145;

create or replace view emp_view
as 
select last_name, department_name, city,salary
from employees join departments
using (department_id)
join locations
using (location_id);

select * from emp_view;

/*
인덱스: 빠른 검색을 제공하기 위해 지정된 컬럼값을 완전 B트리로 구성
제약조건 primary key, unique을 만들면 자동 생성됨
인덱스 설정할 컬럼: 수정,삭제가 잘 일어나지 않고 테이블에 많은 수의 행이 있지만, 검색 where 절에서 사용하는 컬럼으로 이 컬럼으로 검색된 행이 몇줄 안되는 컬럼.

create index 인덱스명 on 테이블명 (컬럼명)
*/

/*
함수 저장 프로시저
create procedure 이름(파라메터 리스트)
begin
	실행문
end

===========
함수 호출
call 함수명()
*/

set @a=10;
select @a;

set @enum=(select employee_id from employees where last_name='Abel');
select @enum;

select employee_id, salary into @enum, @sal from employees where last_name='Abel';
select @enum, @sal;

call p1(145);

call p2(100,@ename);
select @ename;

call p3(80);

call p4(100);

#부서번호 10 '개발1팀'
#부서번호 20 '개발2팀'
#부서번호 30 '개발3팀'
#부서번호 40 '개발4팀'
#이와 '디자인팀'
#사원의 사번을 받아서 그 사원의 ...

call p6(200);

call p7(5);

call p9(3);

call p8(4);

show global variables like 'log_bin_trust_function_creators';
SET GLOBAL log_bin_trust_function_creators = 1;

select f1('Abel');

/*
트리거 : insert, update, delete 동작이 실행될때마다 이 동작 전이나 후에 실행할 코드를 등록하는 방법
생성
create trigger 트리거이름
(after/before) 동작(insert/update/delete) 
on 테이블명 
for each row
*/

select * from emp1;

delimiter $$
create trigger insert_emp_trig 
after insert 
on emp1
for each row
begin
	set @msg=concat(new.name, '님 새로 추가됨');
end$$ 
delimiter ;
#->> emp1에 insert 할때마다 실행

insert into emp1 values(203,'dddd',6335,80);
select @msg;

create table emp1_back(
num int auto_increment primary key,
id int,
cmd varchar(20),
old_sal int,
new_sal intger_membersget_membersget_memberdel_member
);
desc emp1_back

delimiter $$
create trigger backup_emp1_trig 
after insert 
on emp1
for each row
begin
	insert into emp1_back (id,cmd,new_sal) values(new.emp_id, 'insert', new.sal);
end$$ 
delimiter ;

insert into emp1 values(204,'wert',3000,80);
select @msg;
select * from emp1_back;

select * from member;