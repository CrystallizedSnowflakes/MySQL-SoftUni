SELECT `town_id`, `name` FROM `towns`
WHERE `name` REGEXP '(?i)^[MKBE]'
ORDER BY `name`;

SELECT `town_id`, `name` FROM `towns`
WHERE LEFT(`name`, 1) IN ('M', 'K', 'B', 'E')
ORDER BY `name`;

SELECT `town_id`, `name` FROM `towns`
WHERE SUBSTRING(`name`, 1, 1) IN ('M', 'K', 'B', 'E')
ORDER BY `name`;