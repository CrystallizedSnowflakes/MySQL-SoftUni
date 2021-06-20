# Now, we need a more detailed information about drivers and their cars.
# Select all drivers and cars that they drive. Extract the driver’s first and last name from the drivers table 
# and the make, the model and the mileage from the cars table. 
# Order the result by the mileage in descending order, then by the first name alphabetically. 
# Skip all cars that have NULL as a value for the mileage.


SELECT 
    d.first_name, d.last_name, make, model, mileage
FROM
    drivers AS d
        LEFT JOIN
    cars_drivers AS cd ON d.id = cd.driver_id
        LEFT JOIN
    cars AS c ON c.id = cd.car_id
WHERE
    c.mileage IS NOT NULL
ORDER BY c.mileage DESC , d.first_name;