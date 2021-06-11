-- PROCEDURE

-- Create a user defined stored procedure with the name 
-- udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50),light_speed_rate_increse INT(11)) 
-- that receives a spaceship name and light speed increase value 
-- and increases spaceship light speed only if the given spaceship exists. 
-- If the modifying is not successful rollback any changes and throw an exception 
-- with error code ‘45000’ and message: “Spaceship you are trying to modify does not exists.” 

DROP PROCEDURE IF EXISTS udp_modify_spaceship_light_speed_rate;

#Modify spaceship
DELIMITER //
CREATE PROCEDURE udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11))
	BEGIN
		IF (SELECT count(ss.name) FROM spaceships ss
		WHERE ss.name = spaceship_name > 0) THEN
			UPDATE spaceships ss
			SET ss.light_speed_rate = ss.light_speed_rate + light_speed_rate_increse
			WHERE ss.name = spaceship_name;
		ELSE
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
			ROLLBACK;
	END IF;
END//
DELIMITER ;

CALL udp_modify_spaceship_light_speed_rate('Anarchy', 10);