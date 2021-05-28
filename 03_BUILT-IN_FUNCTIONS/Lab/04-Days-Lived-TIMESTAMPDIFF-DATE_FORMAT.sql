SELECT CONCAT(`first_name`, ' ', `last_name`) AS 'Full Name', 
DATE_FORMAT(`born`, '%Y %b %D') AS 'Born',
DATE_FORMAT(`died`, '%Y %b %D') AS 'Died',
TIMESTAMPDIFF(YEAR, `born`, IFNULL(`died`, NOW())) AS 'Days Lived' 
FROM `authors`;