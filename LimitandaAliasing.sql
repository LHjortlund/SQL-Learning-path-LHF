-- Limit and Aliasing learning SQL file

Select *
from employee_demographics
ORDER BY age DESC
limit 3
;
#Showing the top 3 oldest descending  

-- Aliasing

select gender, Avg(age) AS avg_age
from employee_demographics
GROUP BY gender
HAVING avg_age > 40
;
#name of the column has changed to avg_age