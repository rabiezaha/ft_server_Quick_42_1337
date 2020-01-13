#!/bin/sh
mysql -e " CREATE DATABASE wordpress; 
CREATE USER admin@localhost IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON wordpress.* TO admin@localhost;
GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';
FLUSH PRIVILEGES;
"
