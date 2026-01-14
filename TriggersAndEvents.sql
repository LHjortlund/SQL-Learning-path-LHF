-- Triggers and Events

select *
from employee_demographics;

select *
from employee_salary;

drop trigger if exists employee_insert;
delimiter $$
create trigger employee_insert
	#specify which events
    after insert on employee_salary
    for each row 
BEGIN
	insert into employee_demographics (employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name);
END $$
delimiter ;

insert into employee_salary 
	(employee_id, first_name, last_name, occupation, salary, dept_id)
values(13, 'Jean-luc', 'Louisen', 'Expert CEO', '750000', null);

#test at det er korrekt insat
select *
from employee_demographics
where employee_id = 13;


-- Events - schedueled auto - automation in generel
#retire personer over 60

select *
from employee_demographics;

delimiter $$
create event delete_retirees
on schedule every 30 second
do
BEGIN
	select * #ændre dette til delete
    from employee_demographics
    where age >= 60;
END $$
delimiter ;

show variables like 'event%';