
#!/bin/sh
## install influx on debian
## https://docs.influxdata.com/influxdb/v1.7/introduction/installation/

# run as su

# curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
# source /etc/lsb-release
# echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
# apt update -y && sudo apt-get install influxdb influxdb-client -y
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.7.1_amd64.deb
sudo dpkg -i influxdb_1.7.1_amd64.deb
service influxdb start

wget https://dl.influxdata.com/chronograf/releases/chronograf_1.7.3_amd64.deb
dpkg -i chronograf_1.7.3_amd64.deb

wget https://dl.influxdata.com/telegraf/releases/telegraf_1.9.0-1_amd64.deb
dpkg -i telegraf_1.9.0-1_amd64.deb
service telegraf start
telegraf config > telegraf.conf
