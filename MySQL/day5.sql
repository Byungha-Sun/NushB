use encore;
select * from employees;

select first_name, department_id from employees where department_id=60;
select department_id, location_id from departments;

select department_id, department_name
from departments
where department_id <50;

select last_name, salary, salary+300 
from employees;

select last_name, job_id, salary, commission_pct 
from employees;

select last_name, salary
from employees
where salary between 2500 and 3500;

select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100,101,201);

select first_name
from employees
where first_name like '%s%';

select employee_id, last_name, job_id, salary
from employees
where salary>=10000 and job_id like '%man%';

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc;

select last_name, department_id, salary
from employees
order by department_id, salary desc;

select sysdate()
from dual;

select * from locations;

select department_id, department_name, location_id, city
from departments
natural join locations;


select employee_id, first_name, department_id, department_name
from employees
natural join departments;

select employee_id, last_name, location_id, d.department_id
from employees e join departments d
using (department_id);

select e.employee_id, l.city, d.department_name
from employees e
join departments d
on d.department_id=e.department_id
join locations l
on d.location_id=l.location_id;

select e.last_name, e.department_id, d.department_name
from employees e
left outer join departments d
on (e.department_id = d.department_id);



