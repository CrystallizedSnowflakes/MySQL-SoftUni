/*
•	id – unique number for every person there will be no more than 2(31)-1people. (Auto incremented)
•	name – full name of the person will be no more than 200 Unicode characters. (Not null)
•	picture – image with size up to 2 MB. (Allow nulls)
•	height –  In meters. Real number precise up to 2 digits after floating point. (Allow nulls)
•   FLOAT(5,2), #nums of digits, digits after the floating point
•	weight –  In kilograms. Real number precise up to 2 digits after floating point. (Allow nulls)
•	gender – Possible states are m or f. (Not null)
•	birthdate – (Not null)
•	biography – detailed biography of the person it can contain max allowed Unicode characters. (Allow nulls)
*/

CREATE TABLE `people`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`picture` BLOB,
`height` FLOAT(5,2),
`weight` FLOAT(5,2),
`gender` CHAR(1) NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT  
);

INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) VALUES
(1, 'Nona', NULL, 170, 60, 'f', '1981-10-21', 'writer'),
(2, 'Tina', NULL, 165, 50, 'f', '1982-11-22', 'singer'),
(3, 'Paul', NULL, 188, 70, 'm', '1980-04-28', 'skier'),
(4, 'Lola', NULL, 171, 61, 'f', '1986-09-24', NULL),
(5, 'Rob', NULL, 167, 57, 'm', '1988-03-01', 'climber');
