# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/09 11:45:25 by lafontai          #+#    #+#              #
#    Updated: 2020/06/10 13:54:11 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk update
RUN apk add openssl pure-ftpd
RUN rm -rf /var/cache/apk/*

COPY test.txt /home/user/
COPY cluster_ip /tmp/cluster_ip
COPY init.sh /tmp/init.sh

ENTRYPOINT sh /tmp/init.sh

EXPOSE 21 21000
