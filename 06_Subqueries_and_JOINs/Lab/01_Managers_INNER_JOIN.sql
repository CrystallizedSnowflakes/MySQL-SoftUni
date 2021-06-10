# Write a query to retrieve information about the managers – id, full_name, deparment_id and department_name. 
# Select the first 5 departments ordered by employee_id. 

SELECT 
    e.`employee_id` AS 'id',
    CONCAT(e.`first_name`, ' ', e.`Last_name`) AS 'full_name',
    d.`department_id`,
    d.`name` AS `department_name`
FROM
    `departments` AS d
        JOIN
    `employees` AS e ON d.`manager_id` = e.`employee_id`
ORDER BY e.`employee_id`
LIMIT 5;