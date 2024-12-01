-- Ensure the database exists
CREATE DATABASE IF NOT EXISTS `${MYSQL_DATABASE}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Use the new database for subsequent operations
USE `${MYSQL_DATABASE}`;