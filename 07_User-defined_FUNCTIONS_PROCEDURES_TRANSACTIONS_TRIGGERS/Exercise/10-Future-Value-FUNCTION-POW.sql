-- Your task is to create a function ufn_calculate_future_value that accepts as parameters – 
-- sum (with precision, 4 digits after the decimal point), yearly interest rate (double) and number of years(int). 
-- It should calculate and return the future value of the initial sum. 
-- The result from the function must be decimal, with percision 4.
-- Using the following formula: FV = I x ((1 + R)^T)
-- I – Initial sum
-- R – Yearly interest rate
-- T – Number of years

DROP FUNCTION IF EXISTS ufn_calculate_future_value;

DELIMITER //
CREATE FUNCTION ufn_calculate_future_value(initial_sum DECIMAL(19,4), interest_rate DOUBLE, years INT)
RETURNS DECIMAL(19,4)
DETERMINISTIC
BEGIN
	DECLARE result DECIMAL(19,4); -- declare variable
    SET result := 
		initial_sum * POW((1 + interest_rate), years);
	RETURN result;
END//
DELIMITER ;
    
SELECT ufn_calculate_future_value(1000, 0.5, 5);