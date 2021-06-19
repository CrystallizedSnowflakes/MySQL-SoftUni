-- Extract from the database, all of the issues, and the users that are assigned to them,
-- so that they end up in the following format: {username} : {issueTitle}
-- ORDER the results descending by issue id.
-- Required Columns: id (issues), issue_assignee

SELECT 
    i.id,
    CONCAT_WS(' : ', u.username, i.title) AS 'issue_assignee'
FROM
    issues AS i
        JOIN
    users AS u 
    ON i.assignee_id = u.id
ORDER BY i.id DESC;