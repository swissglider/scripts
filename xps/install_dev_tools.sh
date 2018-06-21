#!/bin/bash

# how to use this Script:
# wget -O - https://git.io/flFB9 | bash


sudo apt install -y firefox language-pack-de-base
sudo apt install -y filezilla

# install docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce
sudo gpasswd -aG $USER docker
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install etcher
echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee /etc/apt/sources.list.d/etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt-get update
sudo apt-get install -y etcher-electron


#install development environment
# ToDo:
# install visual code studio
# install vcs plugins and configuration
# install python docker env
# install node docker env
# ev. install virtualbox 
# install atom with plugins arduino
# install arduino edi
# OpenVPN client
# TreeSize oder soo
# HTML Entwicklungsumgebung
