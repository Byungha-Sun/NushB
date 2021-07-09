use encore;

-- 연습문제 2장
 
-- 1 
  desc employees;
 select last_name, salary 
 from employees
 where salary>12000;

-- 2
select last_name, department_id
from employees
where employee_id=176; 

--  3
select last_name, salary
from employees
where salary not between 5000 and 12000;

-- 4
select last_name, job_id, hire_date
from employees
where date(hire_date) between 20-02-98 and 1-05-98
order by hire_date desc;

-- 5
select last_name, department_id
from employees
where department_id in (20,50)
order by last_name; 

-- 6
select last_name 'Employee', salary  'Montly Salary'
from employees
where salary between 5000 and 12000
and department_id in (20,50);

-- 7
select last_name, hire_date
from employees
where hire_Date in (94);

-- 8
select last_name, job_id
from employees
where manager_id is null;
 
 -- 9
 select last_name,salary,commission_pct
 from employees
 where commission_pct is not null
 order by commission_pct desc;
 
 -- 10
 select last_name
 from employees
 where last_name like '__a%';
 
 -- 11
 select last_name
 from employees
 where last_name like '%a%' 
 and last_name like '%e%';
 
 -- 12
 select last_name, job_id,salary
 from employees
 where job_id in ('ST_CLERK', 'SA_REP')
 and salary not in (2500,3500,7000);
 
 -- 13
-- select * from employees; 
select last_name 'Employee', salary 'Monthly Salary', commission_pct 'COMMISSION_PCT'
from employees
where commission_pct=0.2;

-- 4장 연습문제
-- 1
select e.last_name, e.department_id, d.department_name
from employees e join departments d
using (department_id); 

-- 2
-- desc departments;
select e.job_id, d.location_id
from employees e join departments d
using (department_id)
where department_id=80;

-- 3
desc locations;
select e.last_name, d.department_name, d.location_id, l.city
from employees e join departments d
on e.department_id= d.department_id
join locations l
on d.location_id = l.location_id;

-- 4
select e.last_name, d.department_name
from employees e join departments d
on e.department_id=d.department_id
where last_name like '%a%';

desc departments;
select * from employees;

-- 5
select e.last_name, e.job_id, e.department_id, d.department_name
from employees e join departments d
on e.department_id= d.department_id
join locations l
on d.location_id = l.location_id
where l.city='Toronto';

-- 6
select e1.last_name as 'Employee', e1.employee_id as 'EMP#', e2.last_name as 'Manager', e2.employee_id as 'MGR#'
from employees e1, employees e2
where e1.manager_id = e2.employee_id;

-- 7 >출력안됨 (원인 모르겠음)
select e1.last_name as 'Employee', e1.employee_id as 'EMP#', e2.last_name as 'Manager', e2.employee_id as 'MGR#'
from employees e1
left outer join employees e2
on (e1.employee_id=e2.employee_id);

select e.employee_id as 'EMP'. e.last_name as 'Employee', m.employee_id as 'MGR', m.last_name as 'Manager'
from employees e left outer join employees m
on e.manager_id=m.employee_id;

-- 8
select e1.department_id 'Department' , e1.last_name 'Employee' , e2.last_name 'Colleague'
from employees e1 join employees e2
on e1.department_id=e2.department_id
where e1.last_name <> e2.last_name;

-- 9 > job_grades라는 테이블 없음
desc job_grades;
select e.last_name, e.job_id, d.department_name, e.salary, g.gra
from employees e join departments d
using (department_id)
join job_grades g
on e.salary between g.lowest_sal and g.highest_sal;

-- 10 >Davies의 입사날짜를 직접 찾아서 그 값보다 큰 값을 구하는 query작성은 쉽지만 "Davies의 입사날짜"를 한줄로 구현하는 코드가 어렵습니다.

select e2.last_name, e2.hire_date
from employees e1 join employees e2
on e1.hire_date < e2.hire_date 
where e1.last_name = 'Davies';

-- 11
select e1. last_name, e1.hire_date, e2.last_name, e2.hire_date
from employees e1, employees e2
where  e1.manager_id=e2.employee_id
and e1.hire_date < e2.hire_date;



