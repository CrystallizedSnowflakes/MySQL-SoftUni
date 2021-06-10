SELECT 
    e.`employee_id`,
    e.`first_name`,
    e.`last_name`,
    d.`name` AS 'department',
    a.`address_text` AS 'address',
    t.`name` AS 'town'
FROM
    `departments` AS d
        RIGHT JOIN
    `employees` AS e ON d.`department_id` = e.`department_id`
        JOIN
    `addresses` AS a ON e.`address_id` = a.`address_id`
        JOIN
    `towns` AS t ON a.`town_id` = t.`town_id`
ORDER BY e.`employee_id`;

-- ---------------------------------------------------------------

SELECT 
    e.`employee_id`,
    e.`first_name`,
    e.`last_name`,
    d.`name` AS 'department',
    a.`address_text` AS 'address',
    t.`name` AS 'town'
FROM
    `departments` AS d,
    `employees` AS e,
    `addresses` AS a,
    `towns` AS t
WHERE
    d.`department_id` = e.`department_id`
        AND e.`address_id` = a.`address_id`
        AND a.`town_id` = t.`town_id`
ORDER BY e.`employee_id`;