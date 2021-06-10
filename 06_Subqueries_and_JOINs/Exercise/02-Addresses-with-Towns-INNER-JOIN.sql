# SELECT
-- first_name
-- last_name
-- town
-- address_text
# Sort the result by first_name in ascending order then by last_name. Select first 5 employees


SELECT 
    e.first_name, e.last_name, t.name AS town, a.address_text
FROM
    addresses AS a
        JOIN
    employees AS e ON a.address_id = e.address_id
        JOIN
    towns AS t ON a.town_id = t.town_id
ORDER BY first_name , last_name
LIMIT 5;


SELECT 
    e.first_name, e.last_name, t.name AS town, a.address_text
FROM
    employees AS e
        JOIN
    addresses AS a ON a.address_id = e.address_id
        JOIN
    towns AS t ON a.town_id = t.town_id
ORDER BY first_name , last_name
LIMIT 5;