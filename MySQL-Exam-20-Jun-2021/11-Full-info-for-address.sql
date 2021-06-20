# Create a stored procedure udp_courses_by_address which accepts the following parameters:
-- address_name (with max length 100)
# Extract data about the addresses with the given address_name. 
# The needed data is the name of the address, full name of the client, 
# level of bill (depends of course bill – Low – lower than 20(inclusive), Medium – lower than 30(inclusive), and High), 
# make and condition of the car and the name of the category.
# Order addresses by make, then by client’s full name.


DROP PROCEDURE IF EXISTS udp_courses_by_address;

DELIMITER //
CREATE PROCEDURE udp_courses_by_address(address_name VARCHAR(100))
BEGIN
	SELECT a.`name`, 
			cl.full_name AS full_names,
			(CASE
				WHEN cor.bill <= 20 THEN 'Low'
				WHEN cor.bill <= 30 THEN 'Medium'
				WHEN cor.bill > 30 THEN 'High'
			END) AS level_of_bill,
			c.`make`,
			c.`condition`,
			cat.`name` AS cat_name
	FROM addresses AS a
	LEFT JOIN courses AS cor
	ON cor.from_address_id = a.id
	LEFT JOIN clients AS cl
	ON cor.client_id = cl.id
	LEFT JOIN cars AS c
	ON cor.car_id = c.id 
	LEFT JOIN categories AS cat
	ON c.category_id = cat.id
	WHERE a.name = address_name
	ORDER BY c.`make`, cl.full_name;
END //
DELIMITER ;

CALL udp_courses_by_address('700 Monterey Avenue');
CALL udp_courses_by_address('66 Thompson Drive');

SELECT a.`name`, 
	cl.full_name AS full_names,
	(CASE
        WHEN cor.bill <= 20 THEN 'Low'
        WHEN cor.bill <= 30 THEN 'Medium'
        WHEN cor.bill > 30 THEN 'High'
    END) AS level_of_bill,
    c.`make`,
    c.`condition`,
    cat.`name` AS cat_name
FROM addresses AS a
LEFT JOIN courses AS cor
ON cor.from_address_id = a.id
LEFT JOIN clients AS cl
ON cor.client_id = cl.id
LEFT JOIN cars AS c
ON cor.car_id = c.id 
LEFT JOIN categories AS cat
ON c.category_id = cat.id
WHERE a.name = '700 Monterey Avenue'
ORDER BY c.`make`, cl.full_name;