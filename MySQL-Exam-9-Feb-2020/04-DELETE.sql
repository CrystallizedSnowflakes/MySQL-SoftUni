-- As you remember at the beginning of our work, we promoted several football players to coaches. 
-- Now you need to remove all of them from the table of players in order for our database to be updated accordingly.	
-- Delete all players from table players, which are already added in table coaches. 

DELETE FROM players
WHERE age >= 45; 