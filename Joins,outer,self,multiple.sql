-- joins 
select *
FROM employee_demographics
;
#single tabel
Select *
FROM employee_salary
; 
# single tabel

select *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
; #employee id 2 is missing as Ron Swanson doesn't exist on employee demonographics but only on employee salary!

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	on dem.employee_id = sal.employee_id
;

-- Outer joins
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	on dem.employee_id = sal.employee_id
; #Vi mangler stadig info på RON da vi sammenligner data fra dem som gør sig gældende i sal. 

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	on dem.employee_id = sal.employee_id
; #Når man trækker fra højre, så vil man kunne se at data fra højre tabel som ikke gør sig gældende på venstre tabel vil være null
# Det vil sige at data fra sal som ikke gør sig gældende i dem er afbilledet som null i dem

-- SELF join

Select * 
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
; #secret santa, asign employee to the next in row

Select emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name as last_name_santa,

emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name as last_name_emp

FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id +1 = emp2.employee_id
; #LESLIE får igen gaver, da denne bliver NULL, så her skal man indsætte et UNION eller COALESCE


-- Joining multiple tables together
SELECT *
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departmens pd
	ON sal.dept_id = pd.department_id
;

select * 
FROM parks_departments
;

