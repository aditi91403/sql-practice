-- SUBQUERIES

SELECT *
FROM employee_salary
WHERE employee_id IN 
                ( SELECT employee_id
					FROM employee_salary
                    WHERE dept_id = 1)
;

SELECT *
FROM employee_salary;



SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;


SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;


SELECT *
FROM 
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
;


SELECT gender, AVG(`MAX(age)`)
FROM 
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
GROUP BY gender
;



SELECT AVG(max_age)
FROM 
(SELECT gender,
AVG(age) AS avg_age,
MAX(age) AS max_age, 
MIN(age) AS min_age,
COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
;


SELECT first_name, last_name
FROM employee_demographics dem
WHERE EXISTS( SELECT employee_id, salary
              FROM employee_salary sal
              WHERE sal.employee_id = dem.employee_id
              AND salary > 50000);