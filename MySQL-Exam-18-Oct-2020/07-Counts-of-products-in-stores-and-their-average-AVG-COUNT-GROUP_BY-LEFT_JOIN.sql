# The managers needs to know in which stores sell different products and their average price.
# Extract from the database all of the stores (with or without products) and the count of the products that they have. 
# Also you can show the average price of all products (rounded to the second digit after decimal point) that sells in store.
# Order the results descending by count of products in store, then by average price in descending order and finally by store id.

SELECT 
    s.name,
    COUNT(p.id) AS product_count,
    ROUND(AVG(p.price), 2) AS avg
FROM
    stores AS s
        LEFT JOIN
    products_stores AS ps ON s.id = ps.store_id
        LEFT JOIN
    products AS p ON p.id = ps.product_id
GROUP BY s.name
ORDER BY product_count DESC , avg DESC , s.id; 
