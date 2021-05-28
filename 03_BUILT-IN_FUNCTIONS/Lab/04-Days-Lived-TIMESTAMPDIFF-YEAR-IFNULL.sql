SELECT CONCAT(`first_name`, ' ', `last_name`) AS 'Full Name', 
TIMESTAMPDIFF(YEAR, `born`, IFNULL(`died`, NOW())) AS 'Days Lived' 
FROM `authors`;