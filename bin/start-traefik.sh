#!/bin/bash

docker-machine ssh manager "docker network create --driver=overlay traefik"

docker-machine ssh manager "docker service create \
    --name traefik \
    --constraint=node.role==manager \
    --publish 80:80 --publish 8080:8080 \
    --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
    --network traefik \
    traefik \
    --docker \
    --docker.swarmmode \
    --docker.domain=swarm-manager.vbox \
    --docker.watch \
    --api"
    
