#!/bin/bash
set -e
# Script de configuração do ambiente de desenvolvimento.
#
VERSION="1.0"
DEVELOPER="https://github.com/djbarcelos"
NAME_INSTALL=""
#
#
#Functions
start() {
    #Prerequisites
  sudo apt-get update
  sudo apt install wget
  sudo apt install npm
}
node() {
    # install NodeJS LTS
    NAME_INSTALL="NodeJS"
  curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
  sudo bash nodesource_setup.sh
  sudo apt install nodejs -y
  message
}

docker() {
    # install Docker LTS
    NAME_INSTALL="Docker"
  curl -fsSl https://get.docker.com | sh
  sudo usermod -aG docker ${USER}

  sudo docker container run -d --name mongo -p 27017:27017 mongo:4.4.6
  sudo docker container run -d --name redis -p 6379:6379 redis:alpine
  message
}

vsCode() {
    # install VSCode
    NAME_INSTALL="VSCode"
  sudo snap install --classic code
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add --
  sudo add-apt-repository “deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main”
  sudo apt install code
  message
}

compass() {
    # install Compass
    NAME_INSTALL="Compass"
  wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.0_amd64.deb
  sudo dpkg -i mongodb-compass_1.26.0_amd64.deb
  rm -rf mongodb-compass_1.26.0_amd64.deb
  message
}

postman() {
    # install Postman
    NAME_INSTALL="Postman"
  sudo snap install postman
  message
}

message() {
  clear
  echo "# Instalação do $NAME_INSTALL finalizada\n# Versão: $VERSION\n# Desenvolvedor: $DEVELOPER "
  for i in $(seq 1 1 5);
  do # Faça
  echo -n "."
  sleep 01
  done
}
#
#
#Main
setup() {
   start
   node
   docker
   vsCode
   compass
   postman
}
# Instalação de dependências
setup