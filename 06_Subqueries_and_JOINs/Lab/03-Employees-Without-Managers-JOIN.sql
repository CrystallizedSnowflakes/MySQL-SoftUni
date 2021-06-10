# Write a query to get information about employee_id, first_name, last_name, department_id 
# and salary for all employees who don't have a manager.


SELECT 
    e.`employee_id`,
    e.`first_name`,
    e.`last_name`,
    d.`department_id`,
    e.`salary`
FROM
    `employees` AS e
        JOIN
    `departments` AS d ON e.`department_id` = d.`department_id`
WHERE
    e.`manager_id` IS NULL;