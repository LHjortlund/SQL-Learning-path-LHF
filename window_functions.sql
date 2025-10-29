-- Window Functions

Select gender, avg(salary) AS avg_salary
From employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;
--  gennemsnits løn for hvert køn


Select gender, avg(salary) OVER(partition by gender)
From employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

Select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() OVER(partition by gender ORDER BY salary DESC) AS row_num,
RANK() OVER(partition by gender ORDER BY salary DESC) rank_num,
DENSE_RANK() OVER(partition by gender ORDER BY salary DESC) dense_rank_num
From employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;