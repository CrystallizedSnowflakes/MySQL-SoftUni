-- Add stored procedures usp_withdraw_money(account_id, money_amount) that operate in transactions. 
-- Make sure to guarantee withdraw is done only when balance is enough and money_amount is valid positive number. 
-- Work with precision up to fourth sign after decimal point. 
-- The procedure should produce exact results working with the specified precision.

DROP PROCEDURE IF EXISTS usp_withdraw_money;

DELIMITER //
CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19,4))
BEGIN
	START TRANSACTION; 
    IF(money_amount <= 0) OR
		money_amount > (SELECT balance FROM accounts WHERE id = account_id)
		THEN ROLLBACK;
    ELSE
		UPDATE accounts
        SET balance = balance - money_amount
        WHERE id = account_id;
        END IF;
        COMMIT;
END //
DELIMITER ;

CALL usp_withdraw_money(1, 100);
