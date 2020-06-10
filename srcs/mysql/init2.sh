#!/bin/bash

CLUSTER_IP=$(cat /tmp/cluster_ip)

sed -i "s/CLUSTER_IP/$CLUSTER_IP/g" /tmp/instructions.sql

printf 'Waiting for mysql...'
until mysql
do
	printf "."
	sleep 1
done
printf '\n'

MYSQL="mysql -u root"
$MYSQL -e 'CREATE DATABASE wordpress;'
$MYSQL wordpress < /tmp/wordpress.sql
$MYSQL < /tmp/instructions.sql