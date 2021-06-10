# Find the count of all countries which don't have a mountain.

SELECT 
    COUNT(*) AS country_count
FROM
    countries AS c
        LEFT JOIN
    mountains_countries AS mc ON c.country_code = mc.country_code
WHERE
    mc.mountain_id IS NULL;
    
SELECT COUNT(*) AS country_count FROM countries
WHERE country_code NOT IN (
	SELECT country_code FROM mountains_countries);
     