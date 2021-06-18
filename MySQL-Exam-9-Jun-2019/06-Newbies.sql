# One of your bosses has requested a functionality which checks the newly employed – highly paid people.
# Extract from the database, all of the employees, which have salary greater than or equal to 100000 and 
# have started later than or equal to the 1st of January - 2018. 
# The salary should have a "$" as a prefix.
# Order the results descending by salary, then by id.

SELECT id,
	CONCAT(first_name, ' ', last_name) AS full_name,
	CONCAT('$', salary) AS salary,
	started_on
FROM employees
WHERE salary >= 100000 AND started_on >= '2018-01-01'
ORDER BY salary DESC, id;

