# A photographer wants to take pictures of products that have old pictures. 
# You must select all of the products that have a description more than 100 characters long description, and 
# a picture that is made before 2019 (exclusive) and the product price being more than 20. 
# Select a short description column that consists of first 10 characters of the picture's description plus '…'. 
# Order the results by product price in descending order.

SELECT 
    p.name AS product_name,
    p.price,
    p.best_before,
    CONCAT(LEFT(p.description, 10), '...') AS short_description,
    pic.url
FROM
    products AS p
        JOIN
    pictures AS pic ON p.picture_id = pic.id
WHERE
    CHAR_LENGTH(p.description) > 100
        AND YEAR(pic.added_on) < 2019
        AND p.price > 20
ORDER BY p.price DESC;