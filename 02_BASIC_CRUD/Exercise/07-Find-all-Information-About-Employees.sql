SELECT `employee_id` AS 'id',
`first_name` AS 'First Name',
`last_name` AS 'Last Name',
`middle_name` AS 'Middle Name',
`job_title` AS 'Job Title',
`department_id` AS 'Dept ID',
`manager_id` AS 'Mngr ID',
`hire_date` AS 'Hire Date',
`salary`,
`address_id`
FROM `employees`
WHERE `job_title` = 'Sales Representative'
ORDER BY `employee_id`;