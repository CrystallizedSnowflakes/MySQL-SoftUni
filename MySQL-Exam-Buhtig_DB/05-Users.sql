-- Extract from the database, all of the users. 
-- ORDER the results ascending by user id.
-- Required Columns: id (users), username

SELECT 
    u.id, u.username
FROM
    users AS u
ORDER BY u.id;