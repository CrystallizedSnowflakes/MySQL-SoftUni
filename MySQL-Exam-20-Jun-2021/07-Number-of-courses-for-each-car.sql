# Extract from the database all the cars and the count of their courses.
#  Also display the average bill of each course by the car, rounded to the second digit.
# Order the results descending by the count of courses, then by the car’s id. 
# Skip the cars with exactly 2 courses.


SELECT 
    c.id,
    c.`make`,
    c.`mileage`,
    COUNT(cor.id) AS count_of_courses,
    ROUND(AVG(cor.bill), 2) AS avg_bill
FROM
    cars AS c
        LEFT JOIN
    courses AS cor ON c.id = cor.car_id
GROUP BY c.id
HAVING count_of_courses != 2
ORDER BY count_of_courses DESC , c.id;