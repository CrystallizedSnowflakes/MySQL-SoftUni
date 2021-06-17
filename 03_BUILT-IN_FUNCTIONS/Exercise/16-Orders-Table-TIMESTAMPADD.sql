SELECT product_name, order_date,
TIMESTAMPADD(DAY, 3, order_date) AS 'pay_due',
TIMESTAMPADD(MONTH, 1, order_date) AS 'deliver_due'
FROM orders;