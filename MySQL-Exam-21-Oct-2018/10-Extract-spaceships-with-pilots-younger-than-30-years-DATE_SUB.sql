-- Extract from the database those spaceships, which have pilots, younger than 30 years old. 
-- In other words, 30 years from 01/01/2019. Sort the results alphabetically by spaceship name.

SELECT 
    s.name, s.manufacturer
FROM
    spaceships AS s
        JOIN
    journeys AS j 
    ON s.id = j.spaceship_id
        JOIN
    travel_cards AS tc 
    ON j.id = tc.journey_id
        JOIN
    colonists AS c 
    ON tc.colonist_id = c.id
WHERE
    YEAR(c.birth_date) > YEAR(DATE_SUB('2019-01-01', INTERVAL 30 YEAR))
        AND tc.job_during_journey = 'Pilot'
ORDER BY s.name;