# Extract from the database, 5 most commented photos with their count of comments. 
# Sort the results by commentsCount, descending, then by id in ascending order.

SELECT 
    p.id,
    p.date AS date_and_time,
    p.description,
    COUNT(c.id) AS c_count
FROM
    photos AS p
        JOIN
    comments AS c 
    ON p.id = c.photo_id
GROUP BY p.id
ORDER BY c_count DESC , p.id
LIMIT 5;