CREATE TABLE users(
`id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
`username` VARCHAR(30) NOT NULL,
`password` VARCHAR(26) NOT NULL,
`profile_picture` BLOB,
`last_login_time` DATETIME, 
`is_deleted` BIT(1) 
);

#DATETIME - format: YYYY-MM-DD HH:MI:SS
INSERT INTO `users` (`username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES
('pipilota', '123abc', NULL, '2008-11-11 13:23:44', 0),
('pipilota', '123abc', NULL, '2008-11-11 13:23:44', 0),
('lilikom', '098ijn', NULL, '2008-11-11 13:55:44', 1),
('soklin', 'kilomnj', NULL, '2008-11-11 13:56:41', 1),
('wekert', 'anb908', NULL, '2008-11-11 14:04:23', 0),
('dokum', '234567', NULL, '2008-11-11 14:11:36', 1);
