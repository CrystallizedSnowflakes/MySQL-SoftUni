# Create a user defined function with the name udf_client_cards_count(name VARCHAR(30)) that receives a client's full name and 
# returns the number of cards he has.

DROP FUNCTION IF EXISTS udf_client_cards_count;

DELIMITER //
CREATE FUNCTION udf_client_cards_count(client_name VARCHAR(30))
RETURNS INT 
DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(ca.id) AS cards FROM clients AS cl
    LEFT JOIN bank_accounts AS ba
    ON cl.id = ba.client_id
    LEFT JOIN cards AS ca
    ON ba.id = ca.bank_account_id
    WHERE client_name = cl.full_name
    GROUP BY cl.full_name);

END //
DELIMITER ;

SELECT c.full_name, udf_client_cards_count('Baxy David') as `cards` FROM clients c
WHERE c.full_name = 'Baxy David';
