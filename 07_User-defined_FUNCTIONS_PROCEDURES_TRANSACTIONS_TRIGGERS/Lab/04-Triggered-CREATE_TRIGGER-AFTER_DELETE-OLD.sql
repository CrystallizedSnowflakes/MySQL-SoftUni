-- TRIGGERS
-- Create a table deleted_employees(employee_id PK, first_name,last_name,middle_name,job_title,deparment_id,salary) 
-- that will hold information about fired(deleted) employees from the employees table. 
-- Add a trigger to employees table that inserts the corresponding information in deleted_employees. 

DROP TABLE IF EXISTS deleted_employees;

CREATE TABLE deleted_employees(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) DEFAULT NULL,
    job_title VARCHAR(50) NOT NULL,
    department_id INT(10) DEFAULT NULL,
    salary DECIMAL(19,4) NOT NULL
);

DROP TRIGGER IF EXISTS tr_deleted_employees;

DELIMITER //
CREATE TRIGGER tr_deleted_employees
AFTER DELETE -- When? - BEFORE /AFTER
ON employees -- Where it will be attached
FOR EACH ROW
BEGIN
	INSERT INTO deleted_employees (first_name, last_name, middle_name, job_title, department_id, salary)
    VALUES (OLD.first_name, OLD.last_name, OLD.middle_name, OLD.job_title, OLD.department_id, OLD.salary);
END//
DELIMITER ;

DELETE FROM employees 
WHERE
    employee_id = 1;
