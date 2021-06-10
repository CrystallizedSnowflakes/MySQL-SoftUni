# SELECT
-- employee_id
-- first_name
-- manager_id
-- manager_name
# Filter all employees with a manager who has id equal to 3 or 7.


SELECT 
    e.employee_id,
    e.first_name,
    e.manager_id,
    m.first_name AS manager_name
FROM
    employees AS e
        JOIN
    employees AS m ON e.manager_id = m.employee_id
WHERE
    e.manager_id IN (3 , 7)
ORDER BY e.first_name;

------------------------------------------

SELECT 
    e.employee_id,
    e.first_name,
    m.employee_id,
    m.first_name AS manager_name
FROM
    employees AS e
        JOIN
    employees AS m ON e.manager_id = m.employee_id
WHERE
    e.manager_id IN (3 , 7)
ORDER BY e.first_name;
