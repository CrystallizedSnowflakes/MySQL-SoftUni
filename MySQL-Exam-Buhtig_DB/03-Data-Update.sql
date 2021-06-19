# UPDATE all contributors to repositories which have the same id (value) as the repository they contribute to.
# SET them as a contributor to the repository with the lowest id (by value) which has no contributors.
# If there aren’t any repositories with no contributors do nothing.

SELECT * FROM repositories_contributors
WHERE contributor_id = repository_id; -- 1, 3, 7, 9
-- ------------------------------------------------------
SELECT *  -- ! we need only 1 valie (r.id)
FROM repositories AS r
LEFT JOIN repositories_contributors AS rc
ON r.id = rc.repository_id
WHERE rc.repository_id IS NULL
ORDER BY r.id
LIMIT 1;
-- ----------------------------------------------------------

-- ERROR: 1093 You can't specify target table 'repositories_contributors' for update in FROM clause !!!

UPDATE repositories_contributors AS rc
SET rc.repository_id = (
	SELECT r.id
	FROM repositories AS r
	LEFT JOIN repositories_contributors AS rc
	ON r.id = rc.repository_id
	WHERE rc.repository_id IS NULL
	ORDER BY r.id
	LIMIT 1
    )
WHERE contributor_id = repository_id;

-- -------UPDATE------------------------------------------

UPDATE repositories_contributors AS rc
JOIN (
	SELECT r.id
	FROM repositories AS r
	LEFT JOIN repositories_contributors AS rc
	ON r.id = rc.repository_id
	WHERE rc.repository_id IS NULL
	ORDER BY r.id
	LIMIT 1
    ) AS tbl
SET rc.repository_id = tbl.id
WHERE contributor_id = repository_id;
