# Write a query that returns the value of the lowest average salary of all departments.


SELECT 
    AVG(e.salary) AS 'min_average_salary'
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
GROUP BY d.department_id
ORDER BY `min_average_salary`
LIMIT 1;

-- -------------------------------------------------------

SELECT 
    AVG(e.salary) AS 'min_average_salary'
FROM
    employees AS e
GROUP BY e.department_id
ORDER BY `min_average_salary`
LIMIT 1;