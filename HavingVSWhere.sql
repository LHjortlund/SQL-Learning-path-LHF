-- Having vs Where learning path

select gender, AVG(age)
FROM employee_demographics
GROUP BY gender
having AVG(age) > 40 
;


select occupation, AVG(salary)
from employee_salary
GROUP BY occupation
;

select occupation, AVG(salary)
from employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;
