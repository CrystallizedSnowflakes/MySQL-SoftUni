-- There are some pretty big HTML files in the Buhtig database… Unnaturally big.
-- Extract from the database all of the files, which have size, GREATER than 1000,
-- and their name contains “html”.
-- ORDER the results descending by size.
-- Required Columns: id (files), name, size

SELECT 
    f.id, f.name, f.size
FROM
    files AS f
WHERE
    f.size > 1000 AND f.name LIKE '%html%'
ORDER BY f.size DESC;