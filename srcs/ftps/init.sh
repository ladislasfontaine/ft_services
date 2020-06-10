#!/bin/bash

IP_ADDRESS=$(cat /tmp/cluster_ip)

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/C=FR/ST=France/L=Paris/O=42/OU=lafontai/CN=ft_services"
chmod 777 /etc/ssl/private/pure-ftpd.pem

# define user and password
adduser -D "$FTPS_USER"
echo "$FTPS_USER:$FTPS_PASSWORD" | chpasswd

/usr/sbin/pure-ftpd -j -Y 2 -p 21000:21000 -P "$IP_ADDRESS"