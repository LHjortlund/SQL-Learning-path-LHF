-- WHERE Clause

Select *
From employee_salary
WHERE first_name = 'Leslie'
;

Select *
From employee_salary
WHERE salary >= 50000
;

Select *
from employee_demographics
WHERE gender ='Female'
;

Select *
from employee_demographics
WHERE gender !='Female'
;

Select *
from employee_demographics
WHERE birth_date > '1985-01-01'
;

-- AND OR NOT -- Logical operators
Select *
from employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

Select *
from employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

Select *
from employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

Select * 
from employee_demographics
Where (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- Like statement 
-- % and _ (anything or specific value
select *
from employee_demographics
Where first_name LIKE '%er%'
;

select *
from employee_demographics
Where first_name LIKE 'a__'
;

select *
from employee_demographics
Where first_name LIKE 'a___%'
;

select *
from employee_demographics
Where birth_date LIKE '1989%'
;