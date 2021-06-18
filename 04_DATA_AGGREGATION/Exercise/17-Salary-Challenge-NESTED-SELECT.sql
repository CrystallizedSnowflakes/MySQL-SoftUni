SELECT e.`first_name`, e.`last_name`, e.`department_id` FROM `employees` AS e
WHERE `salary` > (
    SELECT AVG(e2.`salary`) FROM `employees` AS e2
    WHERE e2.`department_id` = e.`department_id`
    GROUP BY e2.`department_id`)
ORDER BY e.`department_id`, e.`employee_id`
LIMIT 10; 
