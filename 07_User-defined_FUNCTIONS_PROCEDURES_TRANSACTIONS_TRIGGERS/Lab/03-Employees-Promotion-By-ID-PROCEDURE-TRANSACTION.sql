-- TRANSACTION

DROP PROCEDURE IF EXISTS usp_raise_salary_by_id;

DELIMITER //
CREATE PROCEDURE usp_raise_salary_by_id(IN emp_id INT)
BEGIN
	START TRANSACTION;
    IF((SELECT COUNT(*) FROM employees
    WHERE employee_id = emp_id) <> 1)
    THEN ROLLBACK;
    ELSE
		UPDATE employees
        SET salary = salary * 1.05
        WHERE employee_id = emp_id;
	END IF;
    COMMIT;
END//
DELIMITER ;

CALL usp_raise_salary_by_id(268);
CALL usp_raise_salary_by_id(5001); -- invalid employee id => ROLLBACK
