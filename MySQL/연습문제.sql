# 5장 연습문제

#1. True
#2. False
#3. False

use encore;

#4. 
select round(max(salary)), round(min(salary)), round(sum(salary)), round(avg(salary))
from employees;

#5.
select job_id, round(max(salary)), round(min(salary)), round(sum(salary)), round(avg(salary))
from employees
group by job_id;

#6. 
select job_id, count(employee_id)
from employees
group by job_id;

#7
select count(distinct manager_id) as 'Number of Managers'
from employees;

#8
select round(max(salary)-min(salary)) as 'DIFFERENCE'
from employees;

#9
select manager_id, round(min(salary))
from employees
where manager_id is not null
and salary>=6000
group by manager_id
order by round(min(salary)) desc;

#10
select d.department_name, d.location_id, count(e.employee_id),round(avg(salary),2)
from employees e join departments d
on e.department_id=d.department_id
group by d.department_name;

#11  >> 작동안됨
select count(employee_id), 
(select count(employee_id) from employees where hire_date in (95) as 1995),
(select count(employee_id) from employees where hire_date in (96) as 1996),
(select count(employee_id) from employees where hire_date in (97) as 1997),
(select count(employee_id) from employees where hire_date in (98) as 1998)
from employees;

#답
select count(*), 
sum(if(hire_date like '2005%', 1, 0)) as '2005',
sum(if(hire_date like '2006%', 1, 0)) as '2006',
sum(if(hire_date like '2007%', 1, 0)) as '2007',
sum(if(hire_date like '2008%', 1, 0)) as '2008'
from employees;
						

#12 >>디코드 사용 맞나요..? 그리고 encore.decode does not exist 라는 에러 메세지 발생
select job_id, decode(department_id,20,sum(salary)),
			   decode(department_id,50,sum(salary)),
               decode(department_id,80,sum(salary)),
               decode(department_id,90,sum(salary)),
               sum(salary)
from employees
group by job_id;

#답
select job_id,
sum(case department_id when 20 then salary end) 'Dept20',
sum(case department_id when 50 then salary end) 'Dept50',
sum(case department_id when 80 then salary end) 'Dept80',
sum(case department_id when 90 then salary end) 'Dept90',
sum(salary) Total
from employees
group by job_id;



#6장 연습문제

#1. 
select last_name, hire_date
from employees
where department_id = (select department_id from employees where last_name ='Zlotkey')
and last_name != 'Zlotkey';

#2
select employee_id, last_name, round(salary)
from employees
where salary > (select avg(salary) from employees)
order by salary asc;

#3
select employee_id, last_name
from employees
where department_id in (select department_id
						from employees
                        where last_name like '%u%');
                        

#4
select e.last_name, e.department_id, e.job_id
from employees e join departments d
on e.department_id=d.department_id
where d.location_id=1700;

#5
select last_name, salary
from employees
where manager_id in (select employee_id from employees where last_name = 'King'); 

#6
select d.department_id, e.last_name, e.job_id
from employees e, departments d
where e.department_id=d.department_id
and d.department_id = (select department_id from departments where department_name='Executive');

#7
select employee_id, last_name, round(salary)
from employees
where department_id in (select department_id
						from employees
                        where last_name like '%u%')
and salary > (select avg(salary) from employees);
                        