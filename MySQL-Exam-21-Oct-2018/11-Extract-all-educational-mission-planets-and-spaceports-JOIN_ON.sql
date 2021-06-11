-- Extract from the database names of all planets and their spaceports, which have educational missions. 
-- Sort the results by spaceport name in descending order.

SELECT 
    p.name AS planet_name, s.name AS spaceport_name
FROM
    planets AS p
        JOIN
    spaceports AS s ON p.id = s.planet_id
        JOIN
    journeys AS j ON s.id = j.destination_spaceport_id
WHERE
    purpose = 'Educational'
ORDER BY spaceport_name DESC; 