#!/bin/sh
## install iobroker on debian
## http://www.iobroker.net/docu/?page_id=5106&lang=de

##-----------------------------------------------------------------------
## Install Node --> see new Version on https://nodejs.org/en/
##-----------------------------------------------------------------------
# Using as root
curl -sL https://deb.nodesource.com/setup_11.x | bash -
apt install -y build-essential libavahi-compat-libdnssd-dev libudev-dev libpam0g-dev nodejs
reboot

mkdir /opt/iobroker
chmod 777 /opt/iobroker
cd /opt/iobroker
sudo npm install iobroker --unsafe-perm
systemctl daemon-reload
systemctl enable iobroker
systemctl start iobroker

##-----------------------------------------------------------------------
## install the following adapter:
## - 