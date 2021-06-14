-- Write stored procedure usp_transfer_money(from_account_id, to_account_id, amount) 
-- that transfers money from one account to another. Consider cases when 
-- one of the account_ids is not valid, 
-- the amount of money is negative number, 
-- outgoing balance is enough or transferring from/to one 
-- and the same account. 
-- Make sure that the whole procedure passes without errors and if error occurs make no change in the database. 
-- Make sure to guarantee exact results working with precision up to fourth sign after decimal point.

DROP PROCEDURE IF EXISTS usp_transfer_money;

DELIMITER //
CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(19,4))
BEGIN
	START TRANSACTION; 
    IF(from_account_id = to_account_id) OR
		(SELECT id FROM accounts WHERE id = to_account_id) IS NULL OR
        (SELECT id FROM accounts WHERE id = from_account_id) IS NULL OR
        (SELECT balance FROM accounts WHERE id = from_account_id) < amount OR
		(amount <= 0)
		THEN ROLLBACK;
    ELSE
		UPDATE accounts
        SET balance = balance - amount
        WHERE id = from_account_id;
        UPDATE accounts
        SET balance = balance + amount
        WHERE id = to_account_id;
        END IF;
        COMMIT;
END //
DELIMITER ;

CALL usp_transfer_money(1, 2, 10);
