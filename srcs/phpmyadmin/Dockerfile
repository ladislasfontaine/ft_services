# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/11 09:11:15 by lafontai          #+#    #+#              #
#    Updated: 2020/06/11 10:37:16 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir -p /usr/share/webapps/
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz

RUN tar zxf /phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm /phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv /phpMyAdmin-5.0.2-all-languages /usr/share/webapps/phpmyadmin
RUN chmod -R 777 /usr/share/webapps/
RUN rm -rf /var/cache/apk/*

COPY config.inc.php /usr/share/webapps/phpmyadmin/
COPY init.sh /tmp/

ENTRYPOINT sh /tmp/init.sh

EXPOSE 5000
