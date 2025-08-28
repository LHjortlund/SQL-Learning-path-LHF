-- Group By, learning on how to use group by

select *
from employee_demographics;

select gender
from employee_demographics
GROUP BY gender
;

select gender, AVG(age)
from employee_demographics
GROUP BY gender
;

select occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

select gender, AVG(age), MAX(age), min(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- ORDER BY, learning how to use order by in sql

select *
FROM employee_demographics
ORDER BY first_name ASC
;

select *
FROM employee_demographics
ORDER BY first_name DESC #descending
;

select *
FROM employee_demographics
ORDER BY gender
;

select *
FROM employee_demographics
ORDER BY gender, age
;

select *
FROM employee_demographics
ORDER BY gender, age DESC
;