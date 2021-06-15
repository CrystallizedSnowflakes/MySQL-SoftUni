-- Create a user defined function with the name udf_stadium_players_count (stadium_name VARCHAR(30)) 
-- that receives a stadium’s name and returns the number of players that play home matches there.

DROP FUNCTION IF EXISTS udf_stadium_players_count;

DELIMITER //
CREATE FUNCTION udf_stadium_players_count(stadium_name VARCHAR(30))
RETURNS INT 
DETERMINISTIC
BEGIN
	DECLARE stadium_players_count INT;
    SET stadium_players_count := (SELECT COUNT(p.id) 
		FROM stadiums AS s
		LEFT JOIN teams AS t
		ON s.id = t.stadium_id
		LEFT JOIN players AS p
		ON t.id = p.team_id
        WHERE s.name = stadium_name);
    RETURN stadium_players_count;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS udf_stadium_players_count;

DELIMITER //
CREATE FUNCTION udf_stadium_players_count(stadium_name VARCHAR(30))
RETURNS INT 
DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(p.id) 
		FROM stadiums AS s
		LEFT JOIN teams AS t
		ON s.id = t.stadium_id
		LEFT JOIN players AS p
		ON t.id = p.team_id
        WHERE s.name = stadium_name);
END //
DELIMITER ;

SELECT udf_stadium_players_count ('Jaxworks') as `count`; 
SELECT udf_stadium_players_count ('Linklinks') as `count`; 