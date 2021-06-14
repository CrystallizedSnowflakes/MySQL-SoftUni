-- Write a function ufn_get_salary_level that receives salary of an employee and returns the level of the salary.
-- If salary is < 30000 return "Low"
-- If salary is between 30000 and 50000 (inclusive) return "Average"
-- If salary is > 50000 return "High"


DROP FUNCTION IF EXISTS ufn_get_salary_level;

DELIMITER //
CREATE FUNCTION ufn_get_salary_level(salary_emp DECIMAL(19,4))
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(10); -- declare variable
    SET result := 
		(CASE
			WHEN salary_emp < 30000 THEN 'Low'
			WHEN salary_emp BETWEEN 3000 AND 50000 THEN 'Average'
			ELSE 'High'
		END);
	RETURN result;
END//
DELIMITER ;
    
SELECT ufn_get_salary_level(13500.00);