SELECT `first_name`, `last_name`, `job_title` AS 'JobTitle' FROM `employees`
WHERE `salary` BETWEEN 20000 AND 30000
ORDER BY `employee_id`;

SELECT `first_name`,`last_name`,`job_title` FROM `employees` 
WHERE `salary` >= 20000 AND `salary` <= 30000
ORDER BY `employee_id` ;