-- Create a stored procedure udp_commit which accepts the following parameters:
-- username, password, message, issue_id
-- And checks the following things:
-- If the username does NOT exist in the users table:
--  Throw an exception with error code ‘45000’ and message ‘No such user!’.
-- If the password does NOT match the username in the users table:
--  Throw an exception with error code ‘45000’ and message ‘Password is incorrect!’.
-- If there is no issue with the given id in the issues table:
--  Throw an exception with error code ‘45000’ and message ‘The issue does not exist!’.
-- If all checks pass, extract the id of the corresponding user,
-- from the users table, then the repository_id of the issue, from the issues table,
-- and INSERT a new commit into the commits table with the extracted data.
-- The procedure should also update the issue’s status to ‘closed’.

DROP PROCEDURE IF EXISTS udp_commit;

DELIMITER $$
CREATE PROCEDURE udp_commit
    (username VARCHAR(30), password VARCHAR(30), message VARCHAR(255), issue_id INT)
BEGIN
    START TRANSACTION;
    
    IF ((SELECT COUNT(u.id) FROM `users` AS u WHERE u.username = username) = 0) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'No such user!';
        ROLLBACK;
    ELSEIF ((SELECT u.password FROM `users` AS u WHERE u.username = username) <> password) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Password is incorrect!';
        ROLLBACK;
    ELSEIF ((SELECT COUNT(i.id) FROM `issues` AS i WHERE i.id = issue_id) = 0) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'The issue does not exist!';
        ROLLBACK;
    ELSE
        INSERT INTO `commits` 
            (`message`, `issue_id`, `repository_id`, `contributor_id`)
        VALUES
            (message,
            issue_id,
            (SELECT i.repository_id FROM `issues` AS i WHERE i.id = issue_id),
            (SELECT u.id FROM `users` AS u WHERE u.username = username));
        UPDATE `issues` AS i 
        SET 
            i.issue_status = 'closed'
        WHERE
            i.id = issue_id;
        COMMIT;
    END IF;
END $$
DELIMITER ;

CALL udp_commit('WhoDenoteBel', 'ajmISQi*', 'Fixed issue: blah', 2);