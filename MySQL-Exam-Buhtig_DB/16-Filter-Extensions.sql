-- Create a stored procedure udp_findbyextension which accepts the following parameters:
-- extension
-- And extracts all files that have the given extension. (like index.html for example)
-- The procedure should extract the file’s id, name and size.
-- The file’s size should have “KB” attached to it as a suffix.
-- The files should be ordered ascending by file id.

DROP PROCEDURE IF EXISTS udp_findbyextension;

DELIMITER $$
CREATE PROCEDURE udp_findbyextension(extension VARCHAR(100))
BEGIN
    SELECT 
        f.id, 
        f.name AS 'caption', 
        CONCAT(f.size, 'KB') AS 'user'
    FROM 
        `files` AS f 
    WHERE 
        f.name LIKE (CONCAT('%', extension))
    ORDER BY f.id;
END $$
DELIMITER ;

CALL udp_findbyextension('html');