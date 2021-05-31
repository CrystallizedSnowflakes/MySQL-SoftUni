SELECT `town_id`, `name` FROM towns
WHERE `name` REGEXP '(?i)^[^RBD]'
ORDER BY `name`;

SELECT `town_id`, `name` FROM towns
WHERE LEFT(`name`, 1) NOT IN ('R', 'B', 'D')
ORDER BY `name`;

SELECT `town_id`, `name` FROM towns
WHERE SUBSTRING(`name`, 1, 1) NOT IN ('R', 'B', 'D')
ORDER BY `name`;