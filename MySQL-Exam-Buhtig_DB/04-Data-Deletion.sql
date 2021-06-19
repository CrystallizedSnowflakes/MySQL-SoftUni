# Buhtig is all about activity, and activity is expressed in issues. Issues indicate the constant process of development. 
# Naturally, inactive repositories are being treated as abandoned. DELETE all repositories which do NOT have any issues.

DELETE R FROM repositories AS r
LEFT JOIN issues AS i
ON r.id = i.repository_id
WHERE i.id IS NULL;

-- ----------------------------

DELETE FROM repositories AS r
WHERE (SELECT COUNT(*) FROM issues AS i WHERE i.id = r.id) = 0;