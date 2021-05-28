SELECT insert(`title`, LOCATE('The', `title`), 3, '***') AS 'Title' FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = 'The'
ORDER BY `id`;