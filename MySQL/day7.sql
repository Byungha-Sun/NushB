use encore;

select employee_id, last_name, salary
from employees
where salary > (select salary from employees where last_name = 'Abel');

create table job_grades(
gra char(1) primary key,
lowest_sal int,
highest_sal int);

show tables;
desc job_grades;

insert into job_grades values('A',1000,2999);
insert into job_grades values('B',3000,5999);
insert into job_grades values('C',6000,9999);
insert into job_grades values('D',10000,14999);
insert into job_grades values('E',15000,24999);
insert into job_grades values('F',25000,40000);

select * from job_grades;

select employee_id, last_name, salary, gra
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal;

select department_id, max(salary)
from employees
group by department_id
having max(salary)>10000;

select last_name
from employees 
where salary> (select salary
		       from employees
               where last_name='Abel');
               

select last_name, job_id, salary
from employees
where job_id=(select job_id from employees where employee_id =141)
and salary > (select salary from employees where employee_id=143);

select last_name, job_id, salary
from employees
where salary=(select min(salary) from employees);

create table test1(
id varchar(20) primary key,
pwd varchar(20) not null,
name varchar(20)
);

insert into test1 values ('aaa','111', 'namea');
insert into test1(name,pwd,id) values('nameb','222','bbb');
insert into test1(id,pwd) values ('ccc','333');
insert into test1 values('ddd','444',null);

insert into test1 values ('eee','555','namee',sysdate());


alter table test1
add column(hire_date date);

desc test1;

select * from test1;


-- 다른 테이블의 구조를 복사해서 테이블 생성. 행은 복사하지 말고
create table emp
as 
select * from employees 
where 1=0;

select * from emp; 

insert into emp
select * from employees where job_id like '%REP%';

#update 테이블  set 컬럼명=새값, 컬럼명=새값 where 조건;

update test1 set name='namec' where id = 'ccc'; 
update test1 set name='named', hire_date=sysdate() where id='ddd';

update test1 set name=default where id='bbb';
select * from test1;

set sql_safe_updates=0;

#Merge
