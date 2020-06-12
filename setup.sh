#!/bin/bash

# PASSWORDS
# FTPS			user:secret
# PhpMyAdmin	wp_admin:secret
# Wordpress		admin:secret
# grafana		admin:admin

# VARIABLES
# Colors
INFORMATION="\033[01;33m"
SUCCESS="\033[1;32m"
ERROR="\033[1;31m"
RESET="\033[0;0m"
# Services
services=(		\
 	nginx		\
	ftps		\
	mysql		\
	wordpress	\
	phpmyadmin	\
	grafana		\
	influxdb	\
	telegraf	\
)

# sudo usermod -aG docker $(whoami);
# make sure VM has 2 CPU cores

restart_service()
{
	kubectl delete deploy $1-deployment
	kubectl delete service $1-service
	eval $(minikube -p minikube docker-env)
	docker rmi -f $1
	docker build -t $1 srcs/$1/
	kubectl apply -f srcs/$1/$1.yaml
	printf "$SUCCESS Restarted $1\n"
}

for i in 0 $#
do
	if [ "$i" = "0" ]; then
		continue
	fi
	case "${!i}" in
		"-nginx")
			restart_service nginx
			exit 0
		;;
		"-ftps")
			restart_service ftps
			exit 0
		;;
		"-wordpress")
			restart_service wordpress
			exit 0
		;;
		"-mysql")
			restart_service mysql
			exit 0
		;;
		"-phpmyadmin")
			restart_service phpmyadmin
			exit 0
		;;
		"-grafana")
			restart_service grafana
			exit 0
		;;
		"-influxdb")
			restart_service influxdb
			exit 0
		;;
		"-telegraf")
			restart_service telegraf
			exit 0
		;;
		*)
			continue
		;;
	esac
done

minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000
CLUSTER_IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable metrics-server

echo "$CLUSTER_IP" > srcs/ftps/cluster_ip
echo "$CLUSTER_IP" > srcs/mysql/cluster_ip
sed -i "s/REPLACE_IP/$CLUSTER_IP/g" srcs/telegraf/telegraf.yaml
#echo "UPDATE data_source SET url = 'http://$CLUSTER_IP:8086'" | sqlite3 srcs/grafana/grafana.db
eval $(minikube -p minikube docker-env)

printf "$SUCCESS
███████ ████████      ███████ ███████ ██████  ██    ██ ██  ██████ ███████ ███████ 
██         ██         ██      ██      ██   ██ ██    ██ ██ ██      ██      ██      
█████      ██         ███████ █████   ██████  ██    ██ ██ ██      █████   ███████ 
██         ██              ██ ██      ██   ██  ██  ██  ██ ██      ██           ██ 
██         ██ ███████ ███████ ███████ ██   ██   ████   ██  ██████ ███████ ███████    
																	(by lafontai)       
$RESET"

echo "Building images:"
for service in "${services[@]}"
do
	printf "\n\n	> $service:"
	printf "\n		Building new image..."		
	docker build -t $service srcs/$service > /dev/null
	if [[ $service == "nginx" ]]
	then
		kubectl delete -f srcs/ingress/ingress.yaml >/dev/null 2>&1
		printf "\n		Creating ingress for nginx..."
		kubectl apply -f srcs/ingress/ingress.yaml > /dev/null
	fi
	kubectl delete -f srcs/$service/$service.yaml > /dev/null 2>&1
	printf "\n		Creating container..."
	kubectl apply -f srcs/$service/$service.yaml > /dev/null
	printf "\n	✅ $service done"
done

# minikube dashboard

# TESTS

# FTPS
# sudo apt-get install filezilla
# filezilla ftp://user:secret@172.17.0.2:21
# passive mode needed to transfer files

# GRAFANA
# db params 172.17.0.2:8086 telegraf:secret

printf "$SUCCESS
Minikube IP address: $CLUSTER_IP\n\n$RESET"
