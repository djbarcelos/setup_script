#!/bin/bash
set -e

clear
curl -fsSl https://get.docker.com | sh
sudo usermod -aG docker ${USER}

sudo docker container run -d --name mongo -p 27017:27017 mongo:4.4.6
sudo docker container run -d --name redis -p 6379:6379 redis:alpine