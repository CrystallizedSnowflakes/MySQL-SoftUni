-- PROCEDURE with INOUT PARAMETERS

DROP PROCEDURE usp_increment;

DELIMITER $$
USE soft_uni $$
CREATE PROCEDURE usp_increment (INOUT result INT)
BEGIN
   SET result := result + 1;
END $$
DELIMITER ;

SET @answer = 0; -- create output variable
CALL usp_increment(@answer);
SELECT @answer;