SELECT CONCAT(`first_name`, ' ', `last_name`) AS 'Full Name', 
TIMESTAMPDIFF(DAY, `born`, `died`) AS 'Days Lived' 
FROM `authors`;