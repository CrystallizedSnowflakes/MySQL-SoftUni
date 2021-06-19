# Update all clients which have the same id as the employee they are appointed to. 
# Set their employee_id with the employee with the lowest count of clients.
# If there are 2 such employees with equal count of clients, take the one with the lowest id.

UPDATE employees_clients as ec
JOIN
<<<<<<< HEAD
	(SELECT ec2.employee_id, COUNT(ec2.client_id) AS 'clients_count'
	FROM employees_clients as ec2 
	GROUP BY ec2.employee_id
	ORDER BY clients_count, ec2.employee_id
	LIMIT 1) AS tbl
=======
    	(SELECT ec2.employee_id, COUNT(ec2.client_id) AS 'clients_count'
	FROM employees_clients as ec2 
	GROUP BY ec2.employee_id
	ORDER BY clients_count, ec2.employee_id
        LIMIT 1) AS tbl
>>>>>>> 32c5245c5bffe64da0264922cb00a8f63f773bfe
SET ec.employee_id = tbl.employee_id
WHERE ec.employee_id = ec.client_id;

-- -------------------------------------------------------

UPDATE employees_clients ec
SET ec.employee_id = (SELECT tbl.employee_id 
		FROM 
		(SELECT ec2.employee_id, COUNT(ec2.client_id) AS 'clients_count' 
			FROM employees_clients ec2
			GROUP BY ec2.employee_id
			ORDER BY COUNT(ec2.client_id), ec2.employee_id
			LIMIT 1) AS tbl)
WHERE ec.employee_id = ec.client_id;
<<<<<<< HEAD

-- --------------------------------------------------------

UPDATE employees_clients AS ec
SET ec.employee_id = (
	SELECT tbl.employee_id FROM (SELECT * FROM employees_clients) AS tbl
    GROUP BY employee_id
    ORDER BY COUNT(tbl.client_id) ASC, tbl. employee_id ASC
    LIMIT 1
)
WHERE ec.employee_id = ec.client_id;
=======
>>>>>>> 32c5245c5bffe64da0264922cb00a8f63f773bfe
