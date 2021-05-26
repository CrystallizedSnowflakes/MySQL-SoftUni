CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`category` VARCHAR(50) NOT NULL,
`daily_rate` FLOAT ,
`weekly_rate` FLOAT,
`monthly_rate` FLOAT,
`weekend_rate` FLOAT
);
INSERT INTO  `categories` VALUES
(1, 'A', 1.1, 7.7, NULL, 2.2),
(2, 'B', 1.5, 9.5, NULL, 3.0),
(3, 'C', 2.1, 14.7, NULL, 12.2);

CREATE TABLE `cars`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`plate_number` VARCHAR(10) NOT NULL UNIQUE,
`make` VARCHAR(10),
`model` VARCHAR(10) NOT NULL,
`car_year` YEAR,
`category_id` INT NOT NULL,
`doors` INT(1) NOT NULL,
`picture` BLOB,
`car_condition` VARCHAR(20),
`available` BIT
);
INSERT INTO `cars` VALUES
(1, 'A1234AA', NULL, 'SEDAN', '2020', 1, 5, NULL, 'NEW', 1),
(2, 'B1234BB', NULL, 'COUPE', '2010', 2, 3, NULL, 'OLD', 1),
(3, 'C1233CC', NULL, 'BUS', '2019', 3, 3, NULL, 'NEW', 1);

CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(20) NOT NULL,
`last_name` VARCHAR(20) NOT NULL,
`title` VARCHAR(20) NOT NULL,
`notes` TEXT
);
INSERT INTO `employees` VALUES
(1, 'Ivan', 'Ivanov', 'sales', NULL),
(2, 'Peter', 'Petrov', 'support', NULL),
(3, 'Kaloyan', 'Dimitrov', 'mechanic', NULL);

CREATE TABLE `customers`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`driver_licence_number` INT NOT NULL UNIQUE,
`full_name` VARCHAR(20) NOT NULL,
`address` VARCHAR(100),
`city` VARCHAR(20) NOT NULL,
`zip_code` VARCHAR(10),
`notes` TEXT
);
INSERT INTO `customers` VALUES
(1, '123321123', 'Koko Kokov', NULL, 'Sofia', '1212', NULL),
(2, '123456789', 'Bob Bobov', NULL, 'Bobbovo', '4444', NULL),
(3, '987654321', 'Roro Rorov', NULL, 'Rorovo', '8899', NULL);

CREATE TABLE `rental_orders`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`employee_id` INT,
`customer_id` INT,
`car_id` INT,
`car_condition` VARCHAR(20),
`tank_level` FLOAT,
`kilometrage_start` INT,
`kilometrage_end` INT,
`total_kilometrage` INT,
`start_date` DATE,
`end_date` DATE,
`total_days` INT,
`rate_applied` VARCHAR(20),
`tax_rate` INT,
`order_status` VARCHAR(20),
`notes` TEXT
-- ,
-- CONSTRAINT fk_rental_orders_employees
-- FOREIGN KEY (`employee_id`) REFERENCES `employees`(`id`),
-- CONSTRAINT fk_rental_orders_customers
-- FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`),
-- CONSTRAINT fk_rental_orders_cars
-- FOREIGN KEY (`car_id`) REFERENCES `cars`(`id`)
);
INSERT INTO `rental_orders` VALUES
(1, 1, 1, 1, 'NEW', 60.8, 12000, 12500, 12500, '2008-11-11', '2008-11-21', 10, NULL, NULL, NULL, NULL),
(2, 2, 2, 2, 'OLD', 90.8, 120000, 120500, 120500, '2008-11-11', '2008-11-21', 10, NULL, NULL, NULL, NULL),
(3, 3, 3, 3, 'NEW', 150.8, 100000, 125000, 125000, '2008-11-11', '2008-11-21', 10, NULL, NULL, NULL, NULL);
