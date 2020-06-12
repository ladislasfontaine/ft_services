# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/11 19:21:03 by lafontai          #+#    #+#              #
#    Updated: 2020/06/11 19:21:45 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update
RUN apk add influxdb

COPY init.sh /tmp/

ENTRYPOINT sh /tmp/init.sh

EXPOSE 8086
