# There are many employees in our shop system, but we need to find only the one that passes some specific criteria. 
# Extract from the database, the full name of employee, name of store that he works, address of store, and salary. 
# The employee's salary must be lower than 4000, the address of the store must contain '5' somewhere, 
# the length of the store name needs to be more than 8 characters and the employee’s last name must end with an 'n'.

SELECT 
    CONCAT_WS(' ', e.first_name, e.last_name) AS Full_name,
    s.name AS Store_name,
    a.name,
    e.salary
FROM
    employees AS e
        JOIN
    stores AS s 
    ON e.store_id = s.id
        JOIN
    addresses AS a 
    ON s.address_id = a.id
WHERE
    e.salary < 4000 AND a.name LIKE '%5%'
        AND CHAR_LENGTH(s.name) > 8
        AND RIGHT(e.last_name, 1) = 'n';