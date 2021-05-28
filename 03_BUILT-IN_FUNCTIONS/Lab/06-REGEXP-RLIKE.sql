SELECT `id`, `title` FROM `books`
WHERE `title` REGEXP '^.*it.*$'; 
-- As You Like It
-- It
-- The Hobbit

SELECT `id`, `title` FROM `books`
WHERE `title` REGEXP '[tT]he'; 
-- The Mysterious Affair at Styles
-- Timon of Athens

SELECT `id`, `title` FROM `books`
WHERE `title` REGEXP '^.*[tT]he.*$'; 
-- The Mysterious Affair at Styles

SELECT `id`, `title` FROM `books`
WHERE `title` REGEXP '^.*\\s[tT]he\\s.*$'; 
-- The Murder at the Vicarage

SELECT `id`, `title` FROM `books`
WHERE `title` REGEXP '(?i)^.*\\s[tT]he\\s.*$'; 
-- The Murder at the Vicarage

SELECT `id`, `title` FROM `books`
WHERE `title` RLIKE '(?i)^.*\\s[tT]he\\s.*$'; 

SELECT `id`, `title` FROM `books`
WHERE REGEXP_LIKE(`title`, '(?i)^.*\\s[tT]he\\s.*$');

SELECT LTRIM(REGEXP_REPLACE(`title`, '\\s[Tt]he|[Tt]he\\s', ' *** ')) AS 'Title'
FROM `books`
WHERE REGEXP_LIKE(`title`, '(?i)^.*the.*$');