# When the user has the same id as its photo, it is considered Lucky User. Extract from the database all lucky users. 
# Extract id_username (concat id + " " + username) and email of all lucky users. Order the results ascending by user id.

SELECT 
    CONCAT_WS(' ', u.id, u.username) AS id_username, u.email
FROM
    users AS u
        JOIN
    users_photos AS up ON u.id = up.user_id
        JOIN
    photos AS p ON up.photo_id = p.id
WHERE
    p.id = u.id
ORDER BY u.id;

-- --------------------------------------------------------------
SELECT 
    CONCAT_WS(' ', u.id, u.username) AS id_username, u.email
FROM
    users AS u
        JOIN
    users_photos AS up ON u.id = up.user_id
WHERE
    up.user_id = up.photo_id
ORDER BY up.user_id;

-- ---------------------------------------------------------------
SELECT 
    CONCAT_WS(' ', u.id, u.username) AS id_username, u.email
FROM
    users AS u
WHERE u.id IN (SELECT up.user_id FROM users_photos AS up
			WHERE up.user_id = up.photo_id)
ORDER BY u.id;