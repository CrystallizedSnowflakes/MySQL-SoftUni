SELECT `first_name`, `last_name` FROM `employees`
WHERE NOT(`department_id` = 4);

SELECT `first_name`, `last_name` FROM `employees`
WHERE `department_id` != 4;