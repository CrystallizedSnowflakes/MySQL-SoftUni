# R.U.K. Bank is a sophisticated network. As such, it cannot allow procrastination and lazy behavior. 
# Delete all employees which do not have any clients. 

# SELECT COUNT(*) FROM employees;

DELETE FROM employees
WHERE id NOT IN (SELECT employee_id FROM employees_clients);

# SELECT COUNT(*) FROM employees;

-- ----------------------------------------

DELETE e FROM employees AS e
LEFT JOIN employees_clients AS ec 
ON e.id = ec.employee_id
WHERE ec.employee_id IS NULL; 