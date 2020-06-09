#!/bin/bash

INFORMATION="\033[01;33m"
SUCCESS="\033[1;32m"
ERROR="\033[1;31m"
RESET="\033[0;0m"

# sudo usermod -aG docker $(whoami);
# make sure VM has 2 CPU cores
# CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

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
        *)
            continue
        ;;
    esac
done

minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000
# CLEAR EVERYTHING

# CREATE IMAGES
eval $(minikube -p minikube docker-env)
sudo docker build -t nginx srcs/nginx/

# DEPLOY

minikube addons enable ingress
minikube addons enable metrics-server

# minikube dashboard

kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/ingress/ingress.yaml
