CREATE DATABASE IF NOT EXISTS `soft_uni` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `soft_uni`;


CREATE TABLE IF NOT EXISTS `addresses` (
  `address_id` int(10) NOT NULL AUTO_INCREMENT,
  `address_text` varchar(100) NOT NULL,
  `town_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `PK_Addresses` (`address_id`),
  KEY `fk_addresses_towns` (`town_id`),
  CONSTRAINT `fk_addresses_towns` FOREIGN KEY (`town_id`) REFERENCES `towns` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `manager_id` int(10) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `PK_Departments` (`department_id`),
  KEY `fk_departments_employees` (`manager_id`),
  CONSTRAINT `fk_departments_employees` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `job_title` varchar(50) NOT NULL,
  `department_id` int(10) NOT NULL,
  `manager_id` int(10) DEFAULT NULL,
  `hire_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `salary` decimal(19,4) NOT NULL,
  `address_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `PK_Employees` (`employee_id`),
  KEY `CL_FirstName` (`first_name`),
  KEY `fk_employees_departments` (`department_id`),
  KEY `fk_employees_employees` (`manager_id`),
  KEY `fk_employees_addresses` (`address_id`),
  CONSTRAINT `fk_employees_addresses` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  CONSTRAINT `fk_employees_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `fk_employees_employees` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `employees_projects` (
  `employee_id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`),
  UNIQUE KEY `PK_EmployeesProjects` (`employee_id`,`project_id`),
  KEY `fk_employees_projects_projects` (`project_id`),
  CONSTRAINT `fk_employees_projects_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_employees_projects_projects` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `start_date` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `end_date` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `PK_Projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;