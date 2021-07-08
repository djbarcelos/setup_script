#!/bin/bash

#Funçoes

finish () {
echo "Continuar..."
read stop
clear
}

#Opções
googlechrome() {
clear
sudo apt-get update
sudo apt install wget

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
finish
}

ohMyZsh() {
clear
sudo apt-get update
sudo apt install curl
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
finish
}

docker() {
clear
sudo apt-get update
sudo apt install curl
curl -fsSl https://get.docker.com | sh
finish
}

mongo() {
clear
sudo apt install curl
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt update
sudo apt install mongodb-org
sudo systemctl start mongod.service
sudo systemctl enable mongod
mongo --version
#sudo systemctl status mongod
clear
echo "Instalação concluida..."
read a
}

chavesSsh(){
ssh-keygen

clear
finish
echo -n "Exibir chave SSH [Y/N]: "
read check
case $check in
	y|Y)clear 
	cat ~/.ssh/id_rsa.pub
	read a ;;
	n|N) clear; exit ;;
esac
}

nodeJS(){
clear
sudo apt update 
sudo apt upgrade
sudo apt install nodejs
nvm install v14.15.1
echo -n "NodeJS"; nodejs -v

finish
}

nvm(){
clear
#nvm
sudo apt install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
clear
#npm
sudo apt install npm
clear
#yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install yarn
sudo apt-get install --no-install-recommends yarn
clear
#ts
npm install -g typescript
clear
#Vesion install
echo -n 'yarn: ' 
yarn --version
echo -n 'npm: ' 
npm --version
finish
}

git(){
clear
sudo apt update 
sudo apt install git
clear
echo -n "Realizar configuração do GIT [Y/N]:"
read check
case $check in 
	y|Y) configGIT
	menu;;
	
	n|N) menu ;;
esac
}

configGIT () {
clear
echo "Nome Git"
echo -n " "
read LOG
echo "Email Git"
echo -n " "
read EMAIL
clear
echo "Nome: " $LOG " Email: " $EMAIL
echo -n "Confirmar Nome e Email [Y/N]:"
read check
case $check in 
	y|Y)
	git config --global user.name $LOG
	git config --global user.name $EMAIL 
	menu;;
	
	n|N) menu ;;
esac
}

vsCode(){
clear
sudo snap install --classic code
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add --
sudo add-apt-repository “deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main”
sudo apt install code
finish
}

redis(){
clear
sudo apt update
sudo apt install redis-server
finish
}

NoSQL(){
clear
wget https://s3.mongobooster.com/download/releasesv6/nosqlbooster4mongo-6.2.1.AppImage
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo dpkg -i appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo apt -f install
chmod a+x nosqlbooster4mongo-6.2.1.AppImage
./nosqlbooster4mongo-6.2.1.AppImage
rm -rf ./nosqlbooster4mongo-6.2.1.AppImage
rm -rf ./appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
finish
}

gnome(){
clear
sudo apt install gnome-session
sudo apt install gnome-shell-extension-dash-to-panel
sudo apt install $(apt search gnome-shell-extension | grep ^gnome | cut -d / -f1)
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
finish
}

angular(){
clear
echo "Precisa do npm"
read stop
npm install -g @angular/cli
finish
}

compass(){
clear
sudo apt-get update
sudo apt install wget

wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.0_amd64.deb
sudo dpkg -i mongodb-compass_1.26.0_amd64.deb
rm -rf mongodb-compass_1.26.0_amd64.deb
finish
}

postman(){
clear
sudo snap install postman
finish
}

remove(){
clear
sudo rm /var/lib/dpkg/lock-frontend ;
sudo rm /var/cache/apt/archives/lock ;
sudo apt update
finish
}

#Menu
menu () {
clear
echo "0. Remover Travas"
echo "1. Google-Chrome"
echo "2. Oh-My-Zsh"
echo "3. Docker"
echo "4. MongoDB"
echo "5. SSH"
echo "6. NodeJS"
echo "7. NVM - NPM - YARN - TypeScript"
echo "8. Git"
echo "9. VS Code"
echo "10. Redis"
echo "11. NoSQL"
echo "12. Gnome"
echo "13. Angular"
echo "14. Compass"
echo "15. Postman"
echo -n "Opção: "
read OPC
case $OPC in
#
	0) remove
	menu;;
#
	1) googlechrome 
	menu;;
#
	2) ohMyZsh
	menu;;
#
	3) docker
	menu;;
#
	4) mongo
	menu;;
#
	5) chavesSsh
	menu;;
#
	6) nodeJS
	menu;;
#
	7) nvm
	menu;;
#
	8) git
	menu;;
#
	9) vsCode
	menu;;
#
	10) redis
	menu;;
#
	11) NoSQL
	menu;;
#
	12) gnome
	menu;;
#
	13) angular
	menu;;
#
	14) compass
	menu;;
#
	15) postman
	menu;;
#
	*)clear; 
	exit;;
esac
}

#Função Principal
main () {
clear
echo "-----------------------"
echo "|       Bem Vindo     |"
echo "-----------------------"
echo " Versão: 0.0.1 "
echo " Dev: Diogo Jorge "
echo " Ultima atualização: 25 / 03 / 2021 "
read stop
menu
clear
}
main
