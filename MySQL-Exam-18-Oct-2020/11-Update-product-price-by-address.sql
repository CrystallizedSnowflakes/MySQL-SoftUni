# CREATE user define procedure udp_update_product_price (address_name VARCHAR (50)), that receives as parameter an address name.
# Increase the product's price with 100 if the address starts with 0 (zero) otherwise increase the price with 200.


DROP PROCEDURE IF EXISTS udp_update_product_price;

DELIMITER //
CREATE PROCEDURE udp_update_product_price (address_name VARCHAR (50))
BEGIN
    	DECLARE increase_level INT;
    
    	IF address_name LIKE '0%' THEN SET increase_level = 100;
    	ELSE SET increase_level = 200;
	    END IF;
    
    	UPDATE products AS p
    	SET price = price + increase_level
    	WHERE p.id IN (SELECT ps.product_id FROM addresses AS a
		    JOIN stores AS s ON a.id = s.address_id
                    JOIN products_stores AS ps ON ps.store_id = s.id
                    WHERE a.name = address_name
                    );
END //
DELIMITER ;

-- ----------------------------------------------------------------------
        
DELIMITER //
CREATE PROCEDURE udp_update_product_price (address_name VARCHAR (50))
BEGIN  
	DECLARE increase_level INT;
    	CASE LEFT(address_name, 1)
		WHEN '0' THEN SET increase_level := 100;
		ELSE SET increase_level := 200;
	END CASE;
	
	UPDATE products AS p
	JOIN products_stores  AS ps
		ON p.id = ps.product_id
	JOIN stores AS s
		ON s.id = ps.store_id
	JOIN addresses AS a
		ON a.id = s.address_id
	SET price = price + increase_level
	WHERE a.name = address_name;
END //
DELIMITER ;

-- ----------------------------------------------------------------------
        
DELIMITER //
CREATE PROCEDURE udp_update_product_price (address_name VARCHAR (50))
BEGIN   
	UPDATE products AS p
	JOIN products_stores  AS ps
		ON p.id = ps.product_id
	JOIN stores AS s
		ON s.id = ps.store_id
	JOIN addresses AS a
		ON a.id = s.address_id
	SET price = (
	    CASE LEFT(address_name, 1)
		WHEN '0' THEN price + 100
		ELSE price + 200
	    END)
	WHERE a.name = address_name;
END //
DELIMITER ;

CALL udp_update_product_price('07 Armistice Parkway');
SELECT name, price FROM products WHERE id = 15;

CALL udp_update_product_price('1 Cody Pass');
SELECT name, price FROM products WHERE id = 17;
