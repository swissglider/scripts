#!/bin/bash

cd
sudo apt update -y ; sudo apt full-upgrade -y ; sudo apt autoremove -y ; sudo apt autoclean -y ; sudo apt clean -y

#node.js
#######################################################################
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

#redis
#######################################################################
sudo apt-get install redis-server -y
# vi /etc/redis/redis.conf
# set bind 0.0.0.0

#iobroker
#######################################################################
sudo apt-get install -y build-essential libavahi-compat-libdnssd-dev libudev-dev libpam0g-dev
curl -sL https://iobroker.net/install.sh | bash -
mkdir /opt/iobroker/backups

iobroker stop
iobroker update
iobroker update all
iobroker update self
iobroker upgrade
iobroker upgrade all
iobroker upgrade self
iobroker start

iobroker setup custom
# Current configuration:
# - Objects database:
#   - Type: file
#   - Host/Unix Socket: 0.0.0.0
#   - Port: 9001
# - States database:
#   - Type: redis
#   - Host/Unix Socket: 0.0.0.0
#   - Port: 6379
# - Data Directory: ../../iobroker-data/
