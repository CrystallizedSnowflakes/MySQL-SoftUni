# Extract from the SoftUni Stores System database, info about all of the employees. 
# Order the results by employees hire date in descending order.

SELECT first_name, middle_name, last_name, salary, hire_date FROM employees
ORDER BY hire_date DESC;
