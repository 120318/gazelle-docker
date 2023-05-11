#!/bin/bash

export GAZELLE_PORT=9090
export OCELOT_PORT=34000
export PHPMYADMIN_PORT=9091
export PATH_TO_GAZELLE_REPO=../Oppaitime-Gazelle
export PATH_TO_CONFIG_FILES=./devconfig

rm -rf docker-compose.yml
envsubst < "template.yml" > "docker-compose.yml" && echo "Environment created!"

docker images --quiet --filter=dangling=true | xargs docker rmi
docker-compose up --build
