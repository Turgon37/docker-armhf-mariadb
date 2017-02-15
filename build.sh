#!/usr/bin/env bash

DOCKER_IMAGE=turgon37/armhf-mariadb
BUILD_TIME=$(date --rfc-2822)

echo "[[ Build ${DOCKER_IMAGE} docker image ]]"
docker build --build-arg BUILD_TIME="$BUILD_TIME" \
             --tag ${DOCKER_IMAGE}:latest \
             .

docker push ${DOCKER_IMAGE}:latest
