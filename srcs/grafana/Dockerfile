# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lafontai <lafontai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/06/11 18:19:10 by lafontai          #+#    #+#              #
#    Updated: 2020/06/12 11:40:04 by lafontai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-6.7.3.linux-amd64.tar.gz
RUN tar -zxf grafana-6.7.3.linux-amd64.tar.gz

COPY defaults.ini ./grafana-6.7.3/conf/defaults.ini
#COPY grafana.db ./grafana-6.7.3/data/grafana.db
COPY datasource.yaml ./grafana-6.7.3/conf/provisioning/datasources/
COPY dashboard.yaml ./grafana-6.7.3/conf/provisioning/dashboards/
COPY dashboards/ftps.json ./grafana-6.7.3/conf/provisioning/dashboards/
COPY dashboards/* ./grafana-6.7.3/conf/provisioning/dashboards/

#RUN mkdir -p /etc/grafana/provisioning/dashboards/

COPY init.sh /tmp/

ENTRYPOINT sh /tmp/init.sh

EXPOSE 3000
