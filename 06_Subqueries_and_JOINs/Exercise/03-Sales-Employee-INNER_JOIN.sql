# SELECT
-- employee_id
-- first_name
-- last_name
-- department_name
# Sort the result by employee_id in descending order. Select only employees from the "Sales" department


SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    d.name AS department_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    d.name = 'Sales'
ORDER BY e.employee_id DESC;