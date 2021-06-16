CREATE TABLE `teachers`(
	`teacher_id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(20) NOT NULL,	
    	`manager_id` INT NULL
);
-- insert before creating constraint
INSERT INTO `teachers` VALUES
(101, 'John', null),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101);

-- Self-Referencing
ALTER TABLE `teachers`
ADD CONSTRAINT fk_teachers_menagers
FOREIGN KEY(`manager_id`)
REFERENCES `teachers`(`teacher_id`);
