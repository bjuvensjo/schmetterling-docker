#!/usr/bin/env bash

docker login --username=bjuvensjo
docker rmi -f bjuvensjo/schmetterling 
docker build --no-cache -t bjuvensjo/schmetterling .
docker push bjuvensjo/schmetterling 
