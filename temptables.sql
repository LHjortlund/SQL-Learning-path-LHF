-- Temporary tables lesson 

CREATE TEMPORARY TABLE temp_table 
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

select *
from temp_table;

insert into temp_table
values('Alex', 'Freberg', 'Lord of the Rings: The Two Towers');

select *
from temp_table;
#You have now created at temp table with information


-- another temp table
select *
from employee_salary
;
DROP TEMPORARY TABLE IF EXISTS salary_over_50k; #Lavede en fejl, så drop
create temporary table salary_over_50k
SELECT * 
from employee_salary
WHERE salary >= 50000
;

SELECT * 
from salary_over_50k;

