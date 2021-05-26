DROP DATABASE `gamebar`;

DROP TABLE `employees`;

ALTER TABLE `employees`
DROP CONSTRAINT pk_id;

ALTER TABLE `employees`
DROP FOREIGN KEY fk_id;

ALTER TABLE `employees`
ALTER COLUMN `salary`
DROP DEFAULT;