# Write a query to count the number of employees who receive salary higher than the average. 

SELECT COUNT(`employee_id`) AS `average_salary` FROM `employees`
WHERE `salary` > (
SELECT AVG(`salary`)  FROM `employees`);