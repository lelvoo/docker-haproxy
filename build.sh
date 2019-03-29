#!/bin/sh

set -e

VERSION=`cat Dockerfile | grep 'ARG HAPROXY_VERSION=' | awk -F '=' '{print $2}'`

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker build -t metowolf/haproxy .

docker images

docker push metowolf/haproxy
docker tag metowolf/haproxy metowolf/haproxy:$VERSION
docker push metowolf/haproxy:$VERSION
