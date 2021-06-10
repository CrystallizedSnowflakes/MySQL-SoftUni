# SELECT
-- first_name
-- last_name
-- hire_date
-- dept_name
# Filter only employees hired after 1/1/1999 and from either the "Sales" or the "Finance" departments. Sort the result by hire_date (ascending).


SELECT 
    e.first_name, e.last_name, e.hire_date, d.name AS dept_name
FROM
    employees AS e
        JOIN
    departments AS d ON e.department_id = d.department_id
WHERE
    e.hire_date >= '1999-01-02'
        AND d.name IN ('Sales' , 'Finance')
ORDER BY e.hire_date; 