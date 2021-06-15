-- FUNCTION

-- Create a user defined function with the name udf_count_colonists_by_destination_planet (planet_name VARCHAR (30)) 
-- that receives planet name and returns the count of all colonists sent to that planet.

DELIMITER //
CREATE FUNCTION udf_count_colonists_by_destination_planet(planet_name VARCHAR (30)) 
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE colonists_count INT;
    
    SET colonists_count := (SELECT COUNT(*) FROM colonists AS c
			JOIN travel_cards AS tc
			ON c.id = tc.colonist_id 
			JOIN journeys AS j
			ON tc.journey_id = j.id
            		JOIN spaceports AS s
            		ON j.destination_spaceport_id = s.id
            		JOIN planets AS p
           		 ON s.planet_id = p.id
			WHERE p.name = planet_name);
            
	RETURN colonists_count;
END//
DELIMITER ;

SELECT udf_count_colonists_by_destination_planet('Otroyphus');

SELECT p.name, udf_count_colonists_by_destination_planet('Otroyphus') AS count
FROM planets AS p
WHERE p.name ='Otroyphus';
