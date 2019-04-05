#!/bin/sh
## install iobroker on debian
## http://www.iobroker.net/docu/?page_id=5106&lang=de

## node nodejs npm
# Using as root
apt --purge remove node
apt --purge remove nodejs
apt autoremove
reboot

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y build-essential libavahi-compat-libdnssd-dev libudev-dev libpam0g-dev nodejs
reboot

# install ioBroker and update it
curl -sL https://raw.githubusercontent.com/ioBroker/ioBroker/stable-installer/installer.sh | bash -
systemctl daemon-reload
systemctl enable iobroker
systemctl start iobroker

iobroker update
iobroker upgrade

# Configure the master:
# http://www.iobroker.net/docu/?page_id=3068&lang=de
iobroker multihost enable
#iobroker multihost browse
#sudo iobroker multihost connect
