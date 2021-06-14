DROP FUNCTION IF EXISTS ufn_get_salary_level;

DELIMITER //
CREATE FUNCTION ufn_get_salary_level(salary_emp DECIMAL(19,4))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(10); 
    
	IF salary_emp < 30000 THEN SET result := 'Low';
	ELSEIF salary_emp BETWEEN 30000 AND 50000 THEN SET result := 'Average';
	ELSE SET result := 'High';
	END IF;
        
	RETURN result;
END//
DELIMITER ;

SELECT ufn_get_salary_level(13500.00);

