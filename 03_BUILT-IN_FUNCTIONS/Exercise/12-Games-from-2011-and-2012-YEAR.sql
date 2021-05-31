SELECT name, SUBSTRING(start, 1, 10) AS 'start' FROM `games`
WHERE YEAR(`start`) IN (2011, 2012)
ORDER BY `start`, `name`
LIMIT 50;
