#!/bin/bash

VOLUME=$1
PASSWORD=$2
DOCKER_FILE=Dockerfile

TAG="hanoseok/aircomix-server:latest"

docker build \
  --build-arg VOLUME=$VOLUME \
  --build-arg PASSWORD=$PASSWORD \
  -t $TAG \
  -f $DOCKER_FILE .

docker push $TAG