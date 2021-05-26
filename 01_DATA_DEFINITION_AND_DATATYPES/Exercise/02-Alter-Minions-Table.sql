ALTER TABLE `minions`
CHANGE COLUMN `age` `age` INT UNSIGNED NULL;

ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL;

ALTER TABLE `minions`
ADD CONSTRAINT `fk_town_id`
	FOREIGN KEY (`town_id`)
    REFERENCES `towns` (`id`)
	ON DELETE RESTRICT
	ON UPDATE CASCADE;
    
ALTER TABLE `towns`
CHANGE COLUMN `town_id` `id` INT NOT NULL AUTO_INCREMENT;
    
#fk_minions_towns from table minions refer to table towns
ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL,
ADD CONSTRAINT `fk_minions_towns` 
	FOREIGN KEY `minions` (`town_id`)
    REFERENCES `towns` (`id`);
    
 

