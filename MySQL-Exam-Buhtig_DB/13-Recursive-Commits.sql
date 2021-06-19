-- Extract from the database all files which are a parent to their parent.
-- In other words, file “a” is a parent to file “b” and file “b” is a parent to file “a”.
-- Extract the file name (but only the name, without the extension).
-- If its “index.html” you have to extract “index”, as “file”.
-- Extract the count of commits which hold the full file name (with extension)
-- in their messages as “recursive_count”.
-- ORDER the results ascending by file (file name).
-- Required Columns: file (fileName), recursive_count

SELECT 
    SUBSTRING_INDEX(f.name, '.', 1) AS file,
    COUNT(NULLIF(LOCATE(f.name, c.message), 0)) AS recursive_count
FROM
    files AS f
        JOIN
    files AS p 
    ON f.parent_id = p.id
        JOIN
    commits AS c
WHERE
    f.id <> p.id
    AND f.parent_id = p.id
    AND p.parent_id = f.id
GROUP BY f.name
ORDER BY f.name;
