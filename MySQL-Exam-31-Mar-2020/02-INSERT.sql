# You will have to insert records of data into the addresses table, based on the users table. 
# For users with male gender, insert data in the addresses table with the following values:
-- address – set it to username of the user.
-- town – set it to password of the user.
-- country – set it to ip of the user. 
-- user_id – set it to age of the user. 


INSERT INTO addresses(address, town, country, user_id)
	SELECT username, password, ip, age 
    FROM users
    WHERE gender = 'M';