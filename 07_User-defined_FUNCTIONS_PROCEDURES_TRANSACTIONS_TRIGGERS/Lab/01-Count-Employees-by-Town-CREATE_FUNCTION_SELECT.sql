-- FUNCTION
-- Write a function ufn_count_employees_by_town(town_name) that accepts town_name as parameter 
-- and returns the count of employees who live in that town. 

DROP FUNCTION IF EXISTS ufn_count_employees_by_town;

DELIMITER //
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(50))
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE emp_count INT; -- declare variable
    
    SET emp_count := (SELECT COUNT(*) FROM employees AS e
			JOIN addresses AS a
			ON e.address_id = a.address_id -- FK = PK
			JOIN towns AS t
			USING (town_id)
			WHERE t.name = town_name);
            
	RETURN emp_count;
END//
DELIMITER ;
    
SELECT ufn_count_employees_by_town('Sofia');