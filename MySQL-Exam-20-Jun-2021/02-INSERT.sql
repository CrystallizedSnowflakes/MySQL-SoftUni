# When drivers are not working and need a taxi to transport them, they will also be registered at the database as customers.
# You will have to insert records of data into the clients table, based on the drivers table. 
# For all drivers with an id between 10 and 20 (both inclusive), insert data in the clients table with the following values:
-- full_name – get first and last name of the driver separated by single space
-- phone_number – set it to start with (088) 9999 and the driver_id multiplied by 2
# Example – the phone_number of the driver with id = 10 is (088) 999920


INSERT INTO clients(full_name, phone_number)
	SELECT 
		CONCAT(d.first_name, ' ', d.last_name) AS full_name,
		CONCAT('(088) 9999', (d.id * 2)) AS phone_number
	FROM drivers AS d
	WHERE d.id BETWEEN 10 AND 20;
	