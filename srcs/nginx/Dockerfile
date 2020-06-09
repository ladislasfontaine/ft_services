# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/04 09:41:47 by lafontai          #+#    #+#              #
#    Updated: 2020/06/09 08:51:27 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

# add nginx
RUN apk update
RUN apk add nginx openssl openssh
RUN mkdir -p /var/run/nginx
RUN rm -rf /var/cache/apk/*

# create new user and group
RUN adduser -D -g 'www' www

# create directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# ssl certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=lafontai' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# move files
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
COPY init.sh /tmp/init.sh
RUN chmod 777 /www/index.html
RUN chmod 755 /tmp/init.sh

ENTRYPOINT sh /tmp/init.sh

# open ports
EXPOSE 80 443 30001
