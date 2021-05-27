SELECT `country_name`, `country_code`, 
CASE 
    WHEN `currency_code` = 'EUR' THEN 'Euro'
    ELSE 'Not Euro'
END AS `currency` FROM `countries`
ORDER BY `country_name` ASC;

SELECT `country_name`, `country_code`, 
IF(`currency_code` = 'EUR', 'Euro', 'Not Euro') AS 'currency' FROM `countries`
ORDER BY `country_name` ASC;
