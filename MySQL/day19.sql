#그룹으로 묶어서 검색
#그룹함수사용: avg(), max(), sum(), min(), count()
#group by절: 그룹핑 기준
#having 절 : 그룹을 선택하는 절alter

use encore;

select department_id, avg(salary)
from employees
group by department_id
having avg(salary)>4000;
