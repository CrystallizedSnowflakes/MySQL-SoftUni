-- TRIGGERS
-- Create another table – logs(log_id, account_id, old_sum, new_sum). 
-- Add a trigger to the accounts table that enters a new entry into the logs table every time the sum on an account changes.

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs`(
	log_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    account_id INT(11) NOT NULL,
    old_sum DECIMAL(19,4) NOT NULL,
    new_sum DECIMAL(19,4) NOT NULL,
    CONSTRAINT fk_logs_accounts 
    FOREIGN KEY(account_id) REFERENCES accounts(id)
);

DROP TRIGGER IF EXISTS tr_balance_updated;

DELIMITER //
CREATE TRIGGER tr_balance_updated
AFTER UPDATE -- When? - BEFORE /AFTER Event? -UPDATE /DELETE/ INSERT
ON accounts -- Where it will be attached
FOR EACH ROW
BEGIN
	IF OLD.balance <> NEW.balance THEN
		INSERT INTO `logs` (account_id, old_sum, new_sum)
		VALUES (OLD.id, OLD.balance, NEW.balance);
    END IF;
END//
DELIMITER ;

CALL usp_transfer_money(2, 1, 100);
CALL usp_transfer_money(1, 2, 10);

SELECT * FROM `logs`;
