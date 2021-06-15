-- Extract from the Football Scout Database (fsd) database, info about all of the players. 
-- Order the results by players - salary descending.

SELECT 
    first_name, age, salary
FROM
    players
ORDER BY salary DESC;