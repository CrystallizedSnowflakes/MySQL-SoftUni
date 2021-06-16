# Create a user defined function with the name udf_users_photos_count(username VARCHAR(30)) that receives a username and 
# returns the number of photos this user has upload.

DROP FUNCTION IF EXISTS udf_users_photos_count;

DELIMITER //
CREATE FUNCTION udf_users_photos_count(username VARCHAR(30))
RETURNS INT 
DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(DISTINCT up.photo_id)
			FROM users AS u
			LEFT JOIN users_photos AS up
			ON u.id = up.user_id
			WHERE u.username = username);
END //
DELIMITER ;

SELECT udf_users_photos_count('ssantryd') AS photosCount;

