# SELECT
-- country_code
-- mountain_range
# Filter the count of the mountain ranges in the United States, Russia and Bulgaria. 
# Sort result by mountain_range count in decreasing order.


SELECT 
    mc.country_code, COUNT(m.mountain_range) AS 'mountain_range'
FROM
    mountains_countries AS mc
        JOIN
    mountains AS m ON mc.mountain_id = m.id
        JOIN
    countries AS c ON mc.country_code = c.country_code
WHERE
    c.country_name IN ('United States' , 'Russia', 'Bulgaria')
GROUP BY mc.country_code
ORDER BY `mountain_range` DESC;