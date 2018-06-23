#!/bin/bash

# installs all needed development tools for Ubuntu

sudo apt install -y firefox language-pack-de-base
sudo apt install -y filezilla

# install pip
sudo apt install -y python-pip python3-pip

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
sudo apt -y update
sudo apt install -y etcher-electron

# install vsc
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt -y update
sudo apt install -y code # or code-insiders

code --install-extension peterjausovec.vscode-docker
code --install-extension hookyqr.beautify
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-ceintl.vscode-language-pack-de
code --install-extension kenhowardpdx.vscode-gist
code --install-extension stephanvs.dot
code --install-extension joaompinto.vscode-graphviz
code --install-extension davidanson.vscode-markdownlint
code --install-extension jebbs.plantuml
code --install-extension ms-python.python
code --install-extension tht13.rst-vscode
code --install-extension azaugg.vscode-python-docstring
code --install-extension ms-python.python
code --install-extension yzhang.markdown-all-in-one

/usr/bin/python2.7 -m pip install -U pylint --user
/usr/bin/python3.6 -m pip install -U pylint --user

git config --global user.email "npm@mailschweiz.com"
git config --global user.name "swissglider"
git config --global credential.helper store

# add ssh key to github
# ssh-keygen -t rsa -b 4096 -C "npm@mailschweiz.com" # to ~/.ssh/github_id_rsa .
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/github_id_rsa


# install atom / platformio
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt update -y
sudo apt install -y atom clang

apm install autocomplete-clang
apm install platformio-ide

# install arduino ide
sudo apt install -y arduino
sudo adduser $USER dialout

# install virutalbox
sudo apt install -y virtualbox virtualbox-qt virtualbox-dkms


sudo apt -y purge
sudo apt -y autoremove
sudo apt -y clean

# Create environment
mkdir ~/
export DEV_PATH=/home/diener/developer

#install development environment
# ToDo:
# install python docker env
# install node docker env
# HTML Entwicklungsumgebung
# uninstall script
