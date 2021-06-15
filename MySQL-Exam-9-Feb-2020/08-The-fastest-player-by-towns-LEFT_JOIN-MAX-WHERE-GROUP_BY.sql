-- Extract from the database, the fastest player (having max speed), in terms of towns where their team played.
-- Order players by speed descending, then by town name.
-- Skip players that played in team ‘Devify’


SELECT 
    MAX(sd.speed) AS max_speed,
    t.name AS town_name,
    s.name AS stadium_name, -- incl. NULL values
    te.name AS team_name,   -- incl. NULL values
    p.first_name            -- incl. NULL values
FROM
    towns AS t
        LEFT JOIN
    stadiums AS s 
    ON t.id = s.town_id
        LEFT JOIN
    teams AS te 
    ON s.id = te.stadium_id
        LEFT JOIN
    players AS p 
    ON te.id = p.team_id
        LEFT JOIN
    skills_data AS sd 
    ON sd.id = p.skills_data_id
WHERE te.name != 'Devify'
GROUP BY t.id
ORDER BY max_speed DESC, t.name;

-- max_speed | town_name | stadium_name | team_name | first_name |
-- ---------------------------------------------------------------
-- 97        | Smolensk  | Dabjam       | Pixonyx   | Perren     |
-- 92        | Bromma    | Zoovo        | Skyble    | Glory      |
-- 92        | Luhua     | Kare         | Tanoodle  | NULL       |
-- NULL      | Zavolzh'ye| Jaxspan      | Eire      | NULL       |

SELECT 
    MAX(sd.speed) AS max_speed,
    t.name AS town_name
FROM
    towns AS t
        LEFT JOIN
    stadiums AS s 
    ON t.id = s.town_id
        LEFT JOIN
    teams AS te 
    ON s.id = te.stadium_id
        LEFT JOIN
    players AS p 
    ON te.id = p.team_id
        LEFT JOIN
    skills_data AS sd 
    ON sd.id = p.skills_data_id
WHERE te.name != 'Devify'
GROUP BY t.id
ORDER BY max_speed DESC, t.name;

-- max_speed | town_name |
-- -----------------------
-- 97        | Smolensk  |
-- 92        | Bromma    |
-- 92        | Luhua     |
-- NULL      | Zavolzh'ye|



