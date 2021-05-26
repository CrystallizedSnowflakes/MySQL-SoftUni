ALTER TABLE `gamebar`.`products` 
ADD INDEX `my_fk_idx` (`category_id` ASC) INVISIBLE;
;

ALTER TABLE `products` 
ADD CONSTRAINT `fk_category_id`
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  
ALTER TABLE `employees` 
ADD COLUMN `salary` DECIMAL(10,2) NOT NULL;

ALTER TABLE `employees`
ALTER COLUMN `salary` SET DEFAULT 0;

ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(45) NOT NULL DEFAULT '';

ALTER TABLE `employees`
MODIFY COLUMN `middle_name` VARCHAR(100) NOT NULL DEFAULT '';

ALTER TABLE `employees`
DROP COLUMN `middle_name`;

ALTER TABLE `employees`
ADD CONSTRAINT pk_id
PRIMARY KEY (id);

ALTER TABLE `employees`
ADD CONSTRAINT uq_email
UNIQUE (email);