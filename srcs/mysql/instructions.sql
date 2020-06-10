USE wordpress;
UPDATE wp_options SET option_value = 'http://CLUSTER_IP:5050' WHERE option_id BETWEEN 1 AND 2;

USE mysql;
CREATE USER 'wp_admin'@'%';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_admin'@'%' WITH GRANT OPTION;
SET PASSWORD FOR 'wp_admin'@'%' = PASSWORD('secret');
FLUSH PRIVILEGES;
