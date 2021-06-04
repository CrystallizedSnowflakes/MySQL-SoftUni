CREATE TABLE `mountains`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL
);

CREATE TABLE `peaks`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `mountain_id` INT,
	CONSTRAINT fk_peaks_mountains
		FOREIGN KEY (`mountain_id`)
		REFERENCES `mountains`(`id`)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

-- DROP CONSTARINT

ALTER TABLE `peaks`
DROP FOREIGN KEY `fk_peaks_mountains`;

-- CREATE CONSTARINT
ALTER TABLE `peaks`
ADD CONSTRAINT fk_peaks_mountains
	FOREIGN KEY (`mountain_id`)
    REFERENCES `mountains`(`id`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;