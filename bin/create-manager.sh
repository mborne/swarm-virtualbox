#!/bin/bash

docker-machine create --driver virtualbox manager

MANAGER_IP=$(docker-machine ip manager)
docker-machine ssh manager docker swarm init --advertise-addr $MANAGER_IP

