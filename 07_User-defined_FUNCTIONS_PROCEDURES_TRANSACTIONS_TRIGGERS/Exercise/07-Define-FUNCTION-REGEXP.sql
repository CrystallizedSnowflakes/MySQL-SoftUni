-- Define a function ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))  
-- that returns 1 or 0 depending on that if the word is a comprised of the given set of letters. 

DROP FUNCTION IF EXISTS ufn_is_word_comprised;

DELIMITER //
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BIT DETERMINISTIC
BEGIN
	DECLARE result BIT;
    SET result := word REGEXP(CONCAT('(?i)^[', set_of_letters, ']+$')); 
    RETURN result;
END //
DELIMITER ;

SELECT ufn_is_word_comprised('oistmiahf', 'Sofia');
SELECT ufn_is_word_comprised('oistmiahf', 'halves');
SELECT ufn_is_word_comprised('bobr', 'Rob');
SELECT ufn_is_word_comprised('pppp', 'Guy');