#!/bin/bash

shutdown() {
  echo "Shutting Down"
  docker kill --signal 2 santricity
  docker rm -f santricity

  exit
}

trap shutdown SIGTERM SIGHUP SIGINT

docker rm -f santricity
docker run -v ~/git/docker-SANtricity-WebServicesProxy/SANtricityData:/opt/netapp/santricity_web_services_proxy \
           --name santricity -t -p 8080:8080 santricity-webservices-proxy:latest
