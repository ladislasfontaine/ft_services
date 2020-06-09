#!/bin/bash

IP_ADDRESS=$(cat /tmp/cluster_ip)

# define user and password
adduser -D "$FTPS_USER"
echo "$FTPS_USER:$FTPS_PASSWORD" | chpasswd

/usr/sbin/pure-ftpd -j -Y 2 -p 21000:21000 -P "$IP_ADDRESS"