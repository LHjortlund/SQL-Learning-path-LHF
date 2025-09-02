-- String functions

Select length('skyfall') 
; #her får du længden af et ord = 7

select first_name, LENGTH(first_name)
from employee_demographics
ORDER BY 2 DESC
;

-- UPPER / lower
Select upper('sky');

select lower('SKY');

select first_name, upper(first_name)
from employee_demographics
; 

-- trim

select trim('         sky         ');

select ltrim('        sky          ');

select rtrim('        sky          ');


-- substring

select first_name,
LEFT(first_name, 4),
right(first_name, 4),
substring(first_name, 3,2),
birth_date,
substr(birth_date, 6,2) AS birth_month
from employee_demographics;

-- Replace
select first_name, replace(first_name, 'a', 'z')
from employee_demographics;

-- locate
select locate('x','alexander');
#lokaliserer x i alexander og kommer med position


select first_name, locate('An', first_name)
from employee_demographics;
#tabellen giver værdi 1 for dem hvis fornavn indeholder An

-- concat
select first_name, last_name,
concat(first_name, ' ',last_name) AS 'full name'
from employee_demographics;
