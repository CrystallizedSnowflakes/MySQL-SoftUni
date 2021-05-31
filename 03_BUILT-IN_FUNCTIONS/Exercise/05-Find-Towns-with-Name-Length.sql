SELECT `name` FROM towns
WHERE `name` REGEXP '^.{5,6}$'
ORDER BY `name`;

SELECT `name` FROM towns
WHERE CHAR_LENGTH(`name`) IN (5, 6)
ORDER BY `name`;

SELECT `name` FROM towns
WHERE CHAR_LENGTH(`name`) >= 5 AND CHAR_LENGTH(`name`) <= 6
ORDER BY `name`;

SELECT `name` FROM towns
WHERE CHAR_LENGTH(`name`) BETWEEN 5 AND 6
ORDER BY `name`;