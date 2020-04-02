#!/bin/bash

# change to local user (not root)

cd
#Update
sudo apt update -y
sudo apt upgrade -y

#Influx DB
sudo wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt update -y
sudo apt install influxdb -y
sudo systemctl unmask influxdb.service
sudo systemctl start influxdb

# Influxdb Client
sudo apt install influxdb-client -y

# Chronograf
sudo apt install chronograf -y


# Grafana
sudo apt install -y adduser libfontconfig1
sudo apt install -y apt-transport-https
sudo apt install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update -y
sudo apt install grafana -y
sudo systemctl daemon-reload
sudo systemctl enable grafana-server.service

# Telegraf
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt install telegraf -y
sudo systemctl start telegraf
