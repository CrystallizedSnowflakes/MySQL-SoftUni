# It is time for the stores to start working. All good employees already are in their stores. 
# But some of the employers are too expensive and we need to cut them, because of finances restrictions.
# Be careful not to delete managers they are also employees.
# Delete only those employees that have managers and a salary is more than 6000(inclusive)

DELETE FROM employees
WHERE salary >= 6000 AND manager_id IS NOT NULL;
