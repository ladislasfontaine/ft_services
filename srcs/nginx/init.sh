#!/bin/bash

#echo "admin:secret" | chpasswd
#printf "Bienvenue à toi !\n\n" > /etc/motd
#/usr/sbin/sshd

printf "Nginx launched...\n"
nginx -g "daemon off;"
