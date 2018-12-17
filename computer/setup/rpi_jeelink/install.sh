#!/bin/sh

# make su available and also for ssh
sudo su -
passwd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
service ssh restart

# change root bash behaviors
cp /home/pi/.bashrc .

# delete user pi
deluser pi

## usage:
## start as su (su -)
## ./configure_debian.sh <standard_user>
su -

# update time zone
timedatectl set-timezone Europe/Zurich

# update system
apt update -y && apt upgrade -y && apt dist-upgrade -y

# set wireless / hostname (jeelink) 
raspi-config
reboot
