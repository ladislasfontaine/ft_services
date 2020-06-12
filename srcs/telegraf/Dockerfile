# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/11 19:01:38 by lafontai          #+#    #+#              #
#    Updated: 2020/06/11 19:04:23 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN chmod +x telegraf/*
RUN cp telegraf/telegraf /usr/bin/
RUN rm -rf telegraf-1.13.3-static_linux_amd64.tar.gz telegraf/

COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY init.sh /tmp/

ENTRYPOINT sh /tmp/init.sh

EXPOSE 4999
