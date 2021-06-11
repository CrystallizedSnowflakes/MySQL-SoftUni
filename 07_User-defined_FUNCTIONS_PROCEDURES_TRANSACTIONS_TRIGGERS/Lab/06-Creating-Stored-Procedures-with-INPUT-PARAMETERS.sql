-- PROCEDURE with parameters

DROP PROCEDURE usp_select_employees_by_seniority;

DELIMITER $$
CREATE PROCEDURE usp_select_employees_by_seniority(IN min_years_at_work INT)
BEGIN
  SELECT first_name, last_name, hire_date,
    ROUND(DATEDIFF(NOW(),DATE(hire_date)) / 365.25,0) AS 'years'
  FROM employees
  WHERE ROUND(DATEDIFF(NOW(),DATE(hire_date)) / 365.25,0) > min_years_at_work
  ORDER BY hire_date;
END $$

CALL usp_select_employees_by_seniority(15);
