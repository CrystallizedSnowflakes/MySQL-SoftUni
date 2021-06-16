# Extract from the database those photos that their upload day is 10 and summarize their description. 
# The summary must be 30 symbols long plus "..." at the end. 
# Order the results by date descending order. 

SELECT 
    CONCAT(LEFT(p.description, 30), '...') AS summary, 
    p.date
FROM
    photos AS p
WHERE
    DAY(p.date) = 10
ORDER BY p.date DESC;