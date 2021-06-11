-- PROCEDURE with INPUT /OUTPUT PARAMETERS

DELIMITER $$
USE soft_uni $$
CREATE PROCEDURE usp_add_numbers (IN a INT, IN b INT, OUT result INT)
BEGIN
   SET result := a + b;
END $$
DELIMITER ;

SET @answer = 0; -- create output variable
CALL usp_add_numbers(5, 6, @answer);
SELECT @answer;
