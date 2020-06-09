# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/09 11:45:25 by lafontai          #+#    #+#              #
#    Updated: 2020/06/09 15:05:34 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk update
RUN apk add openssl pure-ftpd
RUN rm -rf /var/cache/apk/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 -subj '/C=FR/ST=75/L=Paris/O=42/CN=lafontai' -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
RUN chmod 777 /etc/ssl/private/pure-ftpd.pem

COPY cluster_ip /tmp/cluster_ip
COPY init.sh /tmp/init.sh

ENTRYPOINT sh /tmp/init.sh

EXPOSE 21 21000
