-- Some of the files are Directories, because they are a parent to some file.
-- Try to find those, which aren’t.
-- Extract from the database all of the files, which are NOT a parent to any other file.
-- Extract the size of the file and add “KB” to the end of it.
-- ORDER the results ascending by file id.
-- Required Columns: id (files), name, size

SELECT 
    f.id, f.name, CONCAT(f.size, 'KB') AS 'size'
FROM
    files AS f
        LEFT JOIN
    files AS p 
    ON f.id = p.parent_id
WHERE
    p.id IS NULL;