-- PROCEDURE

DROP PROCEDURE IF EXISTS usp_raise_salaries;

DELIMITER //
CREATE PROCEDURE usp_raise_salaries(IN department_name VARCHAR(50), IN percentage DOUBLE)
BEGIN
	UPDATE employees AS e JOIN departments AS d ON e.department_id = d.department_id 
    SET salary = salary * (1 + percentage / 100)
    WHERE d.name = department_name;
END//
DELIMITER ;

CALL usp_raise_salaries('Sales', 10);	