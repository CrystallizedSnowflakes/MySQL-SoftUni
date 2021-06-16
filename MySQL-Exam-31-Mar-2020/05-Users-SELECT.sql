# Extract from the Insta Database (instd), info about all the users. 
# Order the results by age descending then by username ascending.


SELECT username, gender, age FROM users
ORDER BY age DESC, username;