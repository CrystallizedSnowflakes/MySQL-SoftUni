# Extract from the database, all of the clients. Order the results ascending by client id.

SELECT id, full_name FROM clients
ORDER BY id;