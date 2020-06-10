# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/09 15:23:38 by lafontai          #+#    #+#              #
#    Updated: 2020/06/10 15:07:54 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update
RUN apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir -p /usr/share/webapps/
RUN wget https://wordpress.org/latest.tar.gz -o latest.tar.gz
RUN mv /latest.tar.gz.1 /tmp/

COPY wp-config.php /tmp/
COPY init.sh /tmp/

ENTRYPOINT sh /tmp/init.sh

EXPOSE 5050
