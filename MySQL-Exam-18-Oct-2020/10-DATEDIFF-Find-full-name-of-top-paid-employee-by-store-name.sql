# Create a user defined function with the name udf_top_paid_employee_by_store(store_name VARCHAR(50)) 
# that receives a store name and returns the full name of top paid employee. 
# Full info must be in format:
# {first_name} {middle_name}. {last_name} works in store for {years of experience} years
# The years of experience is the difference when they were hired and 2020-10-18

DROP FUNCTION IF EXISTS udf_top_paid_employee_by_store;

DELIMITER //
CREATE FUNCTION udf_top_paid_employee_by_store(store_name VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	RETURN (SELECT 
				CONCAT(e.first_name, ' ', middle_name, '. ', last_name,
				' works in store for ',
				FLOOR(DATEDIFF('2020-10-18', hire_date) / 365.25),  # 2020 - YEAR(hire_date),
				' years') AS full_info
			FROM
			employees AS e
			JOIN
			stores AS s 
			ON e.store_id = s.id
			WHERE s.name = store_name
			ORDER by salary DESC
			LIMIT 1);
END //
DELIMITER ;

SELECT udf_top_paid_employee_by_store('Stronghold') as 'full_info';
SELECT udf_top_paid_employee_by_store('Keylex') as 'full_info';



