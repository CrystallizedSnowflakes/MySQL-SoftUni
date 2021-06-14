
-- Write a stored procedure usp_get_employees_from_town that accepts town_name as parameter 
-- and return the employees' first and last name that live in the given town. 
-- The result should be sorted by first_name then by last_name alphabetically and id ascending. 

DROP PROCEDURE IF EXISTS usp_get_employees_from_town ;

DELIMITER //
CREATE PROCEDURE usp_get_employees_from_town(IN town_name VARCHAR(50))
BEGIN
	SELECT first_name, last_name FROM employees
    JOIN addresses
    USING(address_id)
    JOIN towns AS t
    USING(town_id)
    WHERE t.name = town_name
    ORDER BY first_name, last_name, employee_id;
END//
DELIMITER ;

CALL usp_get_employees_from_town('Sofia');