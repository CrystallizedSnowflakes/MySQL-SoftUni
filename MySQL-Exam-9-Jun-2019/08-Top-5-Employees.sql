# Extract from the database, the top 5 employees, in terms of clients assigned to them.
# Order the results descending by count of clients, and ascending by employee id.

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS name,
    e.started_on,
    COUNT(ec.client_id) AS count_of_clients
FROM
    employees AS e
        JOIN
    employees_clients AS ec ON e.id = ec.employee_id
GROUP BY e.id
ORDER BY count_of_clients DESC , e.id
LIMIT 5;