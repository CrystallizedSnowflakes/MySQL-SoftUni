# Some of the clients have not used the services of our company recently, so we need to remove them from the database.	
# Delete all clients from clients table, that do not have any courses and 
# the count of the characters in the full_name is more than 3 characters. 


DELETE FROM clients
WHERE id NOT IN(SELECT client_id FROM courses)
AND CHAR_LENGTH(full_name) > 3;

SELECT client_id FROM courses;