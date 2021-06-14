-- Your task is to create a stored procedure usp_calculate_future_value_for_account
-- that uses the function from the previous problem to give an interest to a person's
-- account for 5 years, along with information about his/her account id, first name,
-- last name and current balance as it is shown in the example below. It should take
-- the account_id and the interest_rate as parameters. Interest rate should have
-- precision up to 0.0001, same as the calculated balance after 5 years. Be extremely
-- careful to achieve the desired precision!

DROP PROCEDURE IF EXISTS usp_calculate_future_value_for_account;

DELIMITER //
CREATE PROCEDURE usp_calculate_future_value_for_account(account_id INT, interest_rate DECIMAL(19,4))
BEGIN
    SELECT 
         a.id AS 'account_id',
         ah.first_name, 
         ah.last_name, 
         a.balance AS 'current_balance',
         ufn_calculate_future_value(a.balance, interest_rate, 5) AS 'balance_in_5_years'
    FROM
        account_holders AS ah
	JOIN
        accounts AS a 
	ON ah.id = a.account_holder_id
    WHERE a.id = account_id;
END //
DELIMITER ;

CALL usp_calculate_future_value_for_account(1, 0.1);