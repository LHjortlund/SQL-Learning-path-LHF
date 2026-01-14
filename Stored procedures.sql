-- stored procedures

#use Parks_and_Recreation;
select *
from employee_salary
where salary >= 50000;

create procedure large_salaries()
select *
from employee_salary
where salary >= 50000;

call large_salaries();

----

DELIMITER $$
create procedure large_salary2()
BEGIN
	select *
	from employee_salary
	where salary >= 50000;
	select *
	from employee_salary
	where salary >= 10000;
END $$
DELIMITER ;

call large_salary2();

