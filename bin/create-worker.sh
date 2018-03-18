#!/bin/bash

if [ -z "$1" ]; then
    echo "create-worker.sh <name>"
    exit 1
fi

WORKER_NAME=$1

SWARM_TOKEN=$(docker-machine ssh manager docker swarm join-token worker -q)
MANAGER_IP=$(docker-machine ip manager)
docker-machine create --driver virtualbox $WORKER_NAME
docker-machine ssh $WORKER_NAME docker swarm join --token $SWARM_TOKEN $MANAGER_IP:2377
