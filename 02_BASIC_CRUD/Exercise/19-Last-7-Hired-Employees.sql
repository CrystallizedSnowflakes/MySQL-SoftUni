SELECT `first_name`, `last_name`, substring(hire_date, 1, 19) FROM employees
ORDER BY `hire_date` DESC
LIMIT 7; 