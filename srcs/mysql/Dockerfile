# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/10 15:47:58 by lafontai          #+#    #+#              #
#    Updated: 2020/06/10 17:54:38 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update
RUN apk add mariadb mariadb-client
RUN rm -rf /var/cache/apk/*

COPY wordpress.sql /tmp/
COPY instructions.sql /tmp/
COPY cluster_ip /tmp/
COPY init.sh /tmp/
COPY init2.sh /tmp/

ENTRYPOINT sh /tmp/init.sh

EXPOSE 3306
