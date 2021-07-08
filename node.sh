#!/bin/bash
set -e

clear
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt update
sudo apt install nodejs -y