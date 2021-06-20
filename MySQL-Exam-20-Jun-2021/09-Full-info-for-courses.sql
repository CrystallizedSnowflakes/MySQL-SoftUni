# The headquarters want us to make a query that shows the complete information about all courses in the database. 
# The information that they need is the address, if the course is made in the Day (between 6 and 20(inclusive both)) 
# or in the Night (between 21 and 5(inclusive both)), 
# the bill of the course, the full name of the client, the car maker, the model and the name of the category.
# Order the results by course id.


SELECT 
    a.name,
    (CASE
        WHEN HOUR(cor.start) BETWEEN 6 AND 20 THEN 'Day'
        WHEN HOUR(cor.start) BETWEEN 0 AND 5 THEN 'Night'
        WHEN HOUR(cor.start) BETWEEN 21 AND 23 THEN 'Night'
    END) AS day_time,
    cor.bill,
    cl.full_name,
    c.make,
    c.model,
    cat.`name` AS category_name
FROM
    courses AS cor
        LEFT JOIN
    addresses AS a ON cor.from_address_id = a.id
        LEFT JOIN
    clients AS cl ON cor.client_id = cl.id
        LEFT JOIN
    cars AS c ON cor.car_id = c.id
        LEFT JOIN
    categories AS cat ON c.category_id = cat.id
ORDER BY cor.id;
