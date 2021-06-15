# Create a stored procedure udp_find_playmaker which accepts the following parameters:
-- min_dribble_points 
-- team_name (with max length 45)
# And extracts data about the players with the given skill stats (more than min_dribble_points), 
# played for given team (team_name) and have more than average speed for all players. 
# Order players by speed descending. Select only the best one.
# Show all needed info for this player: full_name, age, salary, dribbling, speed, team name.


DROP PROCEDURE IF EXISTS udp_find_playmaker;

DELIMITER //
CREATE PROCEDURE udp_find_playmaker(IN min_dribble_points INT, team_name VARCHAR(45))
BEGIN
	SELECT CONCAT_WS(' ', p.first_name, p.last_name) AS full_name, p.age, p.salary, sd.dribbling, sd.speed, t.name
	FROM teams AS t
	JOIN players AS p
	ON t.id = p.team_id
	JOIN skills_data AS sd
	ON sd.id = p.skills_data_id
	WHERE sd.dribbling > min_dribble_points AND t.name = team_name
	ORDER BY sd.speed DESC
	LIMIT 1;
END //
DELIMITER ;

CALL udp_find_playmaker (20, 'Skyble');

-- full_name    | age | salary   | dribbling | speed | team_name |
-- ---------------------------------------------------------------
-- Royal Deakes | 19  | 49162.77 | 33        | 92    | Skyble    |