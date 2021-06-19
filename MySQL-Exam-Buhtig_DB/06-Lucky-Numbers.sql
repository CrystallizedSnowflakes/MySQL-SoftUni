-- When a contributor has the same id as the repository he contributes to, it’s a lucky number. 
-- Extract from the database, all of the repositories, which have the same id as
-- their contributor. 
-- ORDER the results ascending by repository id.
-- Required Columns: repository_id, contributor_id

SELECT 
    *
FROM
    repositories_contributors AS rc
WHERE
    rc.contributor_id = rc.repository_id
ORDER BY rc.repository_id;