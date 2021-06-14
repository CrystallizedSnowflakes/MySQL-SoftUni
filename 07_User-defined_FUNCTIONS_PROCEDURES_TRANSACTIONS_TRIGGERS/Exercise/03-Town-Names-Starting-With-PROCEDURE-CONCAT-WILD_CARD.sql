-- Write a stored procedure usp_get_towns_starting_with that accept string as parameter 
-- and returns all town names starting with that string. The result should be sorted by town_name alphabetically.

DROP PROCEDURE IF EXISTS usp_get_towns_starting_with;

DELIMITER //
CREATE PROCEDURE usp_get_towns_starting_with(IN starts_with VARCHAR(50))
BEGIN
	SELECT name FROM towns
    WHERE name LIKE CONCAT(starts_with, '%')
    ORDER BY name;
END//
DELIMITER ;

CALL usp_get_towns_starting_with('b');