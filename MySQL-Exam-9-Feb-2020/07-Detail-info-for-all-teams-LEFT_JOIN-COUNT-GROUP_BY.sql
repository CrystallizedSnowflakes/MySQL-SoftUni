-- Extract from the database all of the teams and the count of the players that they have.
-- Order the results descending by count of players, then by fan_base descending. 

SELECT 
    t.name AS team_name,
    t.established,
    t.fan_base,
    COUNT(p.id) AS players_count
FROM
    teams AS t
        LEFT JOIN
    players AS p ON t.id = p.team_id
GROUP BY t.id
ORDER BY players_count DESC , fan_base DESC; 