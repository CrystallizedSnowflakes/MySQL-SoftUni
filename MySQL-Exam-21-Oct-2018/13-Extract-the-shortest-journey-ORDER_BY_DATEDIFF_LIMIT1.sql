-- Extract from the database the shortest journey, its destination spaceport name, planet name and purpose.

SELECT 
    j.id,
    p.name AS planet_name,
    s.name AS spaceport_name,
    j.purpose AS journey_purpose
FROM
    journeys AS j
        JOIN
    spaceports AS s ON j.destination_spaceport_id = s.id
        JOIN
    planets AS p ON s.planet_id = p.id
ORDER BY DATEDIFF(journey_end, journey_start)
LIMIT 1;