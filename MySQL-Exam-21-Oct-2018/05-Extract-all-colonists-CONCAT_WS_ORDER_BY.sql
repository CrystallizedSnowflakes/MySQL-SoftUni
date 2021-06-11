-- Extract from the database, all colonists. Sort the results by first name, them by last name, 
-- and finally by id in ascending order.

SELECT id, CONCAT_WS(' ', first_name, last_name) AS full_name, ucn FROM colonists
ORDER BY full_name, last_name, id;
