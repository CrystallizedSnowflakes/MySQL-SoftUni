-- Extract from the database, for every repository – the count of users that have committed to it.
-- NOTE: 1 user may have more than 1 commit on the repository.
-- ORDER the results descending by users (count of users), and ascending by repository id.
-- Required Columns: id (repositories), name, users (count of users)

SELECT 
    r.id, r.name, COUNT(DISTINCT (c.contributor_id)) AS users
FROM
    repositories AS r
        LEFT JOIN
    commits AS c 
    ON r.id = c.repository_id
GROUP BY r.id
ORDER BY users DESC , r.id;
