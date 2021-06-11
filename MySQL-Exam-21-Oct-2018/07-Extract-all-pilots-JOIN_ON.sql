-- Extract from the database all colonists, which have a pilot job. Sort the result by id, ascending.

SELECT 
    c.id, CONCAT_WS(' ', c.first_name, c.last_name) AS full_name
FROM
    colonists AS c
        JOIN
    travel_cards AS tc 
    ON c.id = tc.colonist_id
WHERE
    job_during_journey = 'Pilot'
ORDER BY c.id;