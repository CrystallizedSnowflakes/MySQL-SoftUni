-- Extract from the database, the top 5 repositories, in terms of count of issues on them.
-- ORDER the results descending by issues (count of issues), and ascending by repository id.
-- Required Columns: id (repositories), name (repositories), issues (count of issues)

SELECT 
    r.id, r.name, COUNT(i.id) AS issues
FROM
    repositories AS r
        JOIN
    issues AS i ON r.id = i.repository_id
GROUP BY r.id
ORDER BY issues DESC , r.id
LIMIT 5;