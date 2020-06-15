#!/bin/bash

printf 'Waiting for mysql'
until mysql
do
	echo "."
	sleep 1
done
printf '\n'

CLUSTER_IP=$(cat /tmp/cluster_ip)

# sending commands into instructions.sql
cat << EOF > instructions.sql
USE wordpress;
UPDATE wp_options SET option_value = "http://$CLUSTER_IP:5050" WHERE option_id BETWEEN 1 AND 2;
USE mysql;
CREATE USER 'wp_admin'@'%';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_admin'@'%' WITH GRANT OPTION;
SET PASSWORD FOR 'wp_admin'@'%' = PASSWORD('secret');
FLUSH PRIVILEGES;
EOF

# sending instructions into mysql
MYSQL="mysql -u root"
$MYSQL -e 'CREATE DATABASE wordpress;'
$MYSQL wordpress < /tmp/wordpress.sql
$MYSQL < instructions.sql

rm -f instructions.sql