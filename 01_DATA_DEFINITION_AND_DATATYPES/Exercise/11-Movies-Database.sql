CREATE DATABASE movies;
USE movies;
CREATE TABLE `directors`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`director_name` VARCHAR(45) NOT NULL,
`notes` TEXT
);
CREATE TABLE `genres`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`genre_name` VARCHAR(45) NOT NULL,
`notes` TEXT
);
CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`category_name` VARCHAR(45) NOT NULL,
`notes` TEXT
);
CREATE TABLE `movies`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`title` VARCHAR(200) NOT NULL,
`director_id` INT NOT NULL,
`copyright_year` YEAR,
`length` INT(3),
`genre_id` INT,
`category_id` INT,
`rating` FLOAT,
`notes` TEXT-- ,
-- CONSTRAINT fk_movies_directors
-- FOREIGN KEY (`director_id`) REFERENCES `directors`(`id`),
-- CONSTRAINT fk_movies_genres
-- FOREIGN KEY (`genre_id`) REFERENCES `genres`(`id`),
-- CONSTRAINT fk_movies_categories
-- FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)
);
INSERT INTO `directors` (`id`,`director_name`) VALUES
(1, 'Victor Fleming'),
(2, 'Simon McQuoid'),
(3, 'Jon Watts'),
(4, 'Ethan Coen'),
(5, 'David Fincher');
INSERT INTO `genres` (`id`,`genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Comedy'),
(4, 'Fantasy'),
(5, 'Drama');
INSERT INTO `categories` (`id`,`category_name`) VALUES
(1, 'Historical'),
(2, 'Horror'),
(3, 'Romance'),
(4, 'Thriller'),
(5, 'Mystery');
INSERT INTO `movies` VALUES
(1, 'Gone with the Wind', 1, '1939', 238, 5, 3, 8.1, 'SUPER'),
(2, 'Mortal Kombat', 2, '2021', 140, 1, 4, 6.2, NULL),
(3, 'Spider-Man: Homecoming', 3, '2017', 133, 2, 5, 7.4, NULL),
(4, 'The Big Lebowski', 4, '1999', 119, 3, 4, 8.1, 'GOOD'),
(5, 'Gone Girl', 5, '2014', 149, 1, 5, 8.1, NULL);