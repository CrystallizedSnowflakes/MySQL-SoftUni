-- FUNCTION IN PROCEDURE

DROP FUNCTION IF EXISTS diff_years;

DELIMITER //
CREATE FUNCTION diff_years(date1 DATETIME, date2 DATETIME)
RETURNS INT DETERMINISTIC
BEGIN
	RETURN ROUND(DATEDIFF(date1, date2) / 365.25);
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS usp_select_employees_by_seniority;

DELIMITER //
CREATE PROCEDURE usp_select_employees_by_seniority(IN years_employed INT)
BEGIN
  SELECT employee_id, first_name, last_name, hire_date,
    diff_years(NOW(), hire_date) AS years_at_work
  FROM employees
  WHERE diff_years(NOW(), hire_date) < years_employed;
END //
DELIMITER ;

CALL usp_select_employees_by_seniority(20);