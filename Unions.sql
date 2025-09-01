-- Union, lets you combine rows together 

select first_name, last_name, 'Old' AS Label
From employee_demographics
where age > 50
UNION 
select first_name, last_name, 'Higly Paid Employee' AS Label
from employee_salary
WHERE salary > 70000
;

select first_name, last_name, 'Old Man' AS Label
From employee_demographics
where age > 40 AND gender = 'Male'
UNION
select first_name, last_name, 'Old Lady' AS Label
From employee_demographics
where age > 40 AND gender = 'Female'
UNION 
select first_name, last_name, 'Higly Paid Employee' AS Label
from employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;