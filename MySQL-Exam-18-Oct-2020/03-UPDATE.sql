-- Update all employees that hire after 2003(exclusive) year and not work in store Cardguard-5 and Veribet-14. 
-- Set their manager to be Carolyn Q Dyett (with id 3) and decrease salary with 500.


UPDATE employees AS e
SET e.salary = e.salary - 500, e.manager_id = 3
WHERE YEAR(e.hire_date) > 2003 
AND e.store_id NOT IN (SELECT s.id FROM stores AS s WHERE s.name IN('Cardguard','Veribet'));

-- -------------------------------------------------------------------------------------------

UPDATE employees AS e
JOIN stores AS s
ON e.store_id = s.id
SET e.salary = e.salary - 500, e.manager_id = 3
WHERE YEAR(e.hire_date) > 2003 AND s.name NOT IN('Cardguard','Veribet');