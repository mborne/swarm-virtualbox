#!/bin/bash

docker-machine ssh manager docker run -d --name portainer -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer

MANAGER_IP=$(docker-machine ip manager)

echo "open http://${MANAGER_IP}:9000 in browser and change admin password!"

