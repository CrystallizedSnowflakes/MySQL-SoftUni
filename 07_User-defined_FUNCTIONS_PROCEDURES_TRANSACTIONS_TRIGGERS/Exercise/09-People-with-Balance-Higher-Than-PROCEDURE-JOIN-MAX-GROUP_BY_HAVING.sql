-- Your task is to create a stored procedure usp_get_holders_with_balance_higher_than that accepts a number as a parameter 
-- and returns all people who have more money in total of all their accounts than the supplied number. 
-- The result should be sorted by account_holders.id ascending. 

DROP PROCEDURE IF EXISTS usp_get_holders_with_balance_higher_than;

DELIMITER //
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(IN salary_level DECIMAL(19, 4))
BEGIN
	SELECT ah.first_name, ah.last_name FROM account_holders AS ah
    JOIN accounts AS a
    ON a.account_holder_id = ah.id
    GROUP BY a.account_holder_id
    HAVING SUM(a.balance) > salary_level
    ORDER BY ah.id;
END//
DELIMITER ;

CALL usp_get_holders_with_balance_higher_than(7000);