-- Write a stored procedure usp_get_employees_by_salary_level that receive as parameter 
-- level of salary (low, average or high) and print the names of all employees that have given level of salary. 
-- The result should be sorted by first_name then by last_name both in descending order.

DROP PROCEDURE IF EXISTS usp_get_employees_by_salary_level;

DELIMITER //
CREATE PROCEDURE usp_get_employees_by_salary_level(IN level VARCHAR(10)) -- low, average, high
BEGIN
	SELECT first_name, last_name FROM employees
    WHERE ufn_get_salary_level(salary) = level
    ORDER BY first_name DESC, last_name DESC;
END //
DELIMITER ;

CALL usp_get_employees_by_salary_level('high');