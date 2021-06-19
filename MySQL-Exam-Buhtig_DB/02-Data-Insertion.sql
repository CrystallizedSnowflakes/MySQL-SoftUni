# You will have to INSERT records of data into the issues table, based on the files table. 
# For files with id between 46 and 50 (inclusive), insert data in the issues table with the following values:
-- title – set it to “Critical Problem With {fileName}!”. Where the fileName is the name of the file.
-- issue_status – set it to “open”.
-- repository_id – MULTIPLY the id of the file by 2 and DIVIDE it by 3. ROUND the resulting value UP.
-- assignee_id – the file’s commit’s contributor’s id.


INSERT INTO issues(title, issue_status, repository_id, assignee_id) 
	SELECT 
		CONCAT('Critical Problem With ', f.name, '!') AS title,
        'open' AS issue_status,
        CEIL((f.id * 2) / 3) AS repository_id,
        (
			SELECT contributor_id 
			FROM commits AS c
			WHERE c.id = f.commit_id
        ) AS assigne_id
    FROM files AS f
    WHERE f.id BETWEEN 46 AND 50;
    
-- ---------------------------------------------------------

INSERT INTO issues 
    (title, issue_status, repository_id, assignee_id) 
    SELECT
        CONCAT('Critical Problem With ', f.name, '!'),
        'open' AS 'issue_status',
        CEIL(f.id * 2 / 3) AS 'repository_id',
        c.contributor_id AS 'assignee_id'
    FROM
        files AS f
            JOIN
        commits AS c 
        ON f.commit_id = c.id
    WHERE
        f.id BETWEEN 46 AND 50;

