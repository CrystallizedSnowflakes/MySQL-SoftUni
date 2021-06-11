#Data insertion
INSERT INTO travel_cards(card_number, job_during_journey, colonist_id, journey_id)
    SELECT
      (
        CASE
          WHEN c.birth_date > '1980-01-01' THEN concat_ws('', year(c.birth_date), day(c.birth_date), substr(c.ucn, 1, 4))
          ELSE concat_ws('', year(c.birth_date), month(c.birth_date), substr(c.ucn, 7, 10))
        END
      ) AS card_number,
      (
        CASE
          WHEN c.id % 2 = 0 THEN 'Pilot'
          WHEN c.id % 3 = 0 THEN 'Cook'
          ELSE 'Engineer'
        END
      ) AS job_during_journey,
      c.id,
      (
        substr(c.ucn, 1,1)
      ) AS journey_id
    FROM colonists c
    WHERE c.id between 96 AND 100;

#Data update
UPDATE journeys
  SET purpose = (
      CASE
          WHEN id % 2 = 0 THEN 'Medical'
          WHEN id % 3 = 0 THEN 'Technical'
          WHEN id % 5 = 0 THEN 'Educational'
          WHEN id % 7 = 0 THEN 'Military'
          ELSE purpose
      END
  );

#Data deletion
DELETE FROM colonists
  WHERE id NOT IN (
    SELECT tc.colonist_id FROM travel_cards tc
  );

#Extract all travel order cards
SELECT tc.card_number, tc.job_during_journey
FROM travel_cards tc
ORDER BY  tc.card_number;

#Extract all colonists
SELECT c.id, concat_ws(' ', c.first_name, c.last_name) full_name, c.ucn
FROM colonists c
ORDER BY c.first_name, c.last_name, c.id;

#Extract all military journeys
SELECT j.id, j.journey_start, j.journey_end
FROM journeys j
WHERE j.purpose = 'Military'
ORDER BY j.journey_start;

#Extract all pilots
SELECT c.id, concat_ws(' ', c.first_name, c.last_name) full_name
FROM colonists c
JOIN travel_cards tc
ON c.id = tc.colonist_id
WHERE tc.job_during_journey = 'Pilot'
ORDER BY id;

#Count all colonists that are on technical journey
SELECT count(c.id) count
FROM colonists c
JOIN travel_cards tc
ON c.id = tc.colonist_id
JOIN journeys j
ON tc.journey_id = j.id
WHERE j.purpose = 'Technical';

#Extract the fastest ship
SELECT ship.name spaceship_name, port.name spaceport_name
FROM spaceships ship
JOIN journeys j on ship.id = j.spaceship_id
JOIN spaceports port ON j.destination_spaceport_id = port.id
ORDER BY ship.light_speed_rate DESC LIMIT 1;

#Extract spaceships with pilots younger than 30 years
SELECT s.name, s.manufacturer
FROM colonists c
JOIN travel_cards tc
ON tc.colonist_id = c.id
JOIN journeys j
on tc.journey_id = j.id
JOIN spaceships s
on j.spaceship_id = s.id
WHERE year(c.birth_date) > year(DATE_SUB('2019-01-01', INTERVAL 30 YEAR)) and tc.job_during_journey = 'Pilot'
ORDER BY s.name;

#Extract all educational mission planets and spaceports
SELECT p.name planet_name, sp.name spaceport_name
FROM planets p
JOIN spaceports sp
on p.id = sp.planet_id
JOIN journeys j on sp.id = j.destination_spaceport_id
WHERE j.purpose = 'Educational'
ORDER BY spaceport_name DESC ;

#Extract all planets and their journey count
SELECT pl.planet_name, count(pl.planet_name) journeys_count
FROM (
        SELECT p.name planet_name
        FROM planets p
        JOIN spaceports sp
        on p.id = sp.planet_id
        JOIN journeys j
        on sp.id = j.destination_spaceport_id
     ) pl
GROUP BY planet_name
ORDER BY journeys_count DESC, planet_name;

#Extract shortest journey
SELECT j.id, p.name planet_name, sp.name spaceport_name, j.purpose journey_purpose
FROM journeys j
JOIN spaceports sp on j.destination_spaceport_id = sp.id
JOIN planets p on sp.planet_id = p.id
ORDER BY DATEDIFF(j.journey_end, j.journey_start)
LIMIT 1;

#Extract the less popular job
SELECT tc.job_during_journey
FROM travel_cards tc
WHERE tc.journey_id =  (
  SELECT j.id
  FROM journeys j
  ORDER BY DATEDIFF(j.journey_end, j.journey_start) DESC
  LIMIT 1
)
GROUP BY tc.job_during_journey
ORDER BY count(tc.job_during_journey)
LIMIT 1;

#Get colonists count
DELIMITER //
CREATE FUNCTION udf_count_colonists_by_destination_planet(planet_name VARCHAR(30))
  RETURNS INT
  BEGIN
    DECLARE c_count INT;
    SET c_count := (
      SELECT count(c.id)
      FROM colonists c
      JOIN travel_cards tc on c.id = tc.colonist_id
      JOIN journeys j on tc.journey_id = j.id
      JOIN spaceports s on j.destination_spaceport_id = s.id
      JOIN planets p on s.planet_id = p.id
      WHERE p.name = planet_name
    );
    RETURN c_count;
  END //
DELIMITER ;


#Modify spaceship
DELIMITER //
CREATE PROCEDURE udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11))
  BEGIN
    if (SELECT count(ss.name) FROM spaceships ss WHERE ss.name = spaceship_name > 0) THEN
      UPDATE spaceships ss
        SET ss.light_speed_rate = ss.light_speed_rate + light_speed_rate_increse
        WHERE name = spaceship_name;
    ELSE
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
      ROLLBACK;
    END IF;
  END //
  
DELIMITER ;


