-- PROCEDURE without parameter

DROP PROCEDURE IF EXISTS usp_select_employees_by_seniority;

DELIMITER $$
CREATE PROCEDURE usp_select_employees_by_seniority()
BEGIN
  SELECT * 
  FROM employees
  WHERE ROUND((DATEDIFF(NOW(), hire_date) / 365.25)) < 15;
END $$
DELIMITER ;

CALL usp_select_employees_by_seniority();