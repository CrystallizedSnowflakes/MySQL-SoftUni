# Create a stored procedure udp_clientinfo which accepts the following parameters:
-- full_name
# And extracts data about the client with the given full name.
# Aside from the full_name, the procedure should extract the client's age, bank account number and balance.
# The account’s salary should have "$" prefix.

DROP PROCEDURE IF EXISTS udp_clientinfo;

DELIMITER //
CREATE PROCEDURE udp_clientinfo(IN client_name VARCHAR(50))
BEGIN
	SELECT cl.full_name, 
		cl.age, ba.account_number, 
        CONCAT('$', ba.balance) AS balance 
	FROM clients AS cl
    LEFT JOIN bank_accounts AS ba
    ON cl.id = ba.client_id
    WHERE cl.full_name = client_name;
END //

DELIMITER ;

CALL udp_clientinfo('Hunter Wesgate');