#!/bin/bash

# how to use this Script:
# wget -O - https://git.io/fCxqS | bash

#update system
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y

#BIOS update
sudo fwupdmgr get-devices
sudo fwupdmgr refresh
sudo fwupdmgr get-updates
sudo fwupdmgr update


#uninstall unused apps
sudo apt remove -y --purge evince* thunderbird chromium-browser libreoffice* aisleriot webbrowser-app rhythmbox shotwell*
sudo apt remove -y --purge gnome-mahjongg gnome-sudoku gnome-calendar gnome-mines
sudo apt -y autoremove
sudo apt clean

#install additionals
sudo apt install -y openssh-server terminator

#update chrome
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#sudo apt update
#sudo apt install google-chrome-stable
#sudo apt --only-upgrade install google-chrome-stable

#install development environment
# ToDo:
# install visual code studio
# install vcs plugins and configuration
# install firefox and configure as developer
# install docker
# install docker compose
# install python docker env
# install node docker env
# ev. install virtualbox
