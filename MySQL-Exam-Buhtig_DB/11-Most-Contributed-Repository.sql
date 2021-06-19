-- Extract from the database, the top 1 repository in terms of count of contributors.
-- If there are 2 repositories have the same count of contributors, order them ascending, by id.
-- Required Columns: id (repositories), name (repositories), commits (count of commits),
--  contributors (count of contributors)

SELECT 
    cn.id, r.name, COUNT(c.id) AS commits, cn.contributors
FROM
    (SELECT 
        rc.repository_id AS id,
		COUNT(rc.contributor_id) AS contributors
    FROM
        repositories_contributors AS rc
    GROUP BY rc.repository_id) AS cn
        JOIN
    repositories AS r 
    ON cn.id = r.id
        LEFT JOIN
    commits AS c 
    ON cn.id = c.repository_id
GROUP BY cn.id
ORDER BY contributors DESC , r.id
LIMIT 1;