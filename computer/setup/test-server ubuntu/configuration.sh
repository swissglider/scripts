#!/bin/sh

# make su available and also for ssh
sudo su passwd
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# change root bash behaviors
sudo cp .bashrc /root/

## usage:
## start as su (su -)
## ./configure_debian.sh <standard_user>
su -

# update time zone
timedatectl set-timezone Europe/Zurich

# update system
apt update -y
apt upgrade -y
apt dist-upgrade -y

# change closing Laptop to be locked
echo 'HandleLidSwitch=lock' >> /etc/systemd/logind.conf
echo 'HandleLidSwitchDocker=lock' >> /etc/systemd/logind.conf
systemctl restart systemd-logind.service

## change the /etc/netplan/50-cloud-init.yaml file and add the following entries:
## network:
##     ethernets:
##         enp9s0:
##             addresses: [192.168.86.27/24]
##             gateway4: 192.168.86.1
##             nameservers:
##                     addresses: [8.8.8.8,8.8.4.4]
##             dhcp4: no
##             dhcp6: no
##     version: 2
##

## netplan apply
reboot
