#!/bin/bash
set -e

clear
wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.0_amd64.deb
sudo dpkg -i mongodb-compass_1.26.0_amd64.deb
rm -rf mongodb-compass_1.26.0_amd64.deb