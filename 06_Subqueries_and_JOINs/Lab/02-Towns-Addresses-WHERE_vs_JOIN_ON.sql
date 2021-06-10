# Write a query to get information about the addresses in the database, which are in San Francisco, Sofia or Carnation.
# Retrieve town_id, town_name, address_text. Order the result by town_id, then by address_id. 


SELECT a.`town_id`, t.`name` AS 'town_name', a.`address_text` FROM `addresses` AS a, `towns` AS t
WHERE a.`town_id` = t.`town_id` AND t.`name` IN('San Francisco', 'Sofia', 'Carnation')
ORDER BY a.`town_id`, a.`address_id`; 


SELECT 
    a.`town_id`, t.`name` AS 'town_name', a.`address_text`
FROM
    `addresses` AS a
        JOIN
    `towns` AS t ON a.`town_id` = t.`town_id`
        AND t.`name` IN ('San Francisco' , 'Sofia', 'Carnation')
ORDER BY a.`town_id` , a.`address_id`; 