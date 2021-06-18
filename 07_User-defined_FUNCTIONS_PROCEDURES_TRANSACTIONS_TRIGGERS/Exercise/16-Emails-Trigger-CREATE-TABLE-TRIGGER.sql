-- TRIGGERS
# Create another table – notification_emails(id, recipient, subject, body). 
# Add a trigger to logs table to create new email whenever new record is inserted in logs table. 
# The following data is required to be filled for each email:
-- recipient – account_id
-- subject – "Balance change for account: {account_id}"
-- body - "On {date (current date)} your balance was changed from {old} to {new}."

DROP TABLE IF EXISTS `notification_emails`;

CREATE TABLE `notification_emails`(
    `id` INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `recipient` INT(11) NOT NULL,
    `subject` VARCHAR(50) NOT NULL,
    `body` VARCHAR(255) NOT NULL
);

DROP TRIGGER IF EXISTS tr_notification_emails;

DELIMITER //
CREATE TRIGGER tr_notification_emails
AFTER INSERT -- When? - BEFORE /AFTER Event? -UPDATE /DELETE /INSERT
ON `logs` -- Where it will be attached
FOR EACH ROW
BEGIN
	INSERT INTO `notification_emails`(`recipient`, `subject`, `body`)
	VALUES (NEW.account_id, 
		CONCAT('Balance change for account: ', NEW.account_id), 
		CONCAT('On ', DATE_FORMAT(NOW(), '%b %d %Y at %r'), ' your balance was changed from ', 
			ROUND(NEW.old_sum, 2), ' to ', ROUND(NEW.new_sum, 2), '.'));
END//
DELIMITER ;

SELECT * FROM `notification_emails`;
