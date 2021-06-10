# SELECT
-- employee_id
-- first_name
-- salary
-- department_name
# Filter only employees with salary higher than 15000. Return the first 5 rows sorted by department_id 
# in descending order.


SELECT 
    e.employee_id,
    e.first_name,
    e.salary,
    d.name AS department_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;