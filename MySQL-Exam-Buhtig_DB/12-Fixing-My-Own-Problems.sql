-- Extract from the database, for every user – the count of commits he has on issues that were assigned to him.
-- ORDER the results descending by commits (count of commits), and ascending by user id.
-- Required Columns: id (users), username, commits (count of commits)

SELECT 
    u.id,
    u.username,
    SUM(IF(c.contributor_id = u.id, 1, 0)) AS commits
FROM
    users AS u
        LEFT JOIN
    issues AS i ON u.id = i.assignee_id
        LEFT JOIN
    commits AS c ON i.id = c.issue_id
GROUP BY u.id
ORDER BY commits DESC , u.id;