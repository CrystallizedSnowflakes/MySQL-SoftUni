# Create a user defined function with the name udf_courses_by_client (phone_num VARCHAR (20)) 
# that receives a client’s phone number and returns the number of courses that clients have in database.


DROP FUNCTION IF EXISTS udf_courses_by_client;

DELIMITER //
CREATE FUNCTION udf_courses_by_client(phone_num VARCHAR (20))
RETURNS INT DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(cor.id) FROM courses AS cor
			LEFT JOIN clients AS cl
			ON cor.client_id = cl.id
            WHERE cl.phone_number = phone_num
			GROUP BY cl.id);
END //

DELIMITER ;

SELECT udf_courses_by_client ('(803) 6386812') as `count`;
SELECT udf_courses_by_client ('(831) 1391236') as `count`;
SELECT udf_courses_by_client ('(704) 2502909') as `count`;

SELECT COUNT(cor.id) FROM courses AS cor
LEFT JOIN clients AS cl
ON cor.client_id = cl.id
WHERE cl.phone_number = '(803) 6386812'
GROUP BY cl.id;
