#!/bin/bash

#SSL
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=lafontai' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

#start service
#rc-service nginx start

printf "Nginx launched...\n"
nginx -g "daemon off;"
