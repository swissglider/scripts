#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install openssh-server -y

sudo apt autoremove open-vm-tools -y
sudo apt install open-vm-tools-desktop -y

sudo apt install vino -y
sudo apt install dconf-editor -y

#add RAM to the graficcard
# Add
# Requires=graphical.target
# After=graphical.target

# Under the Unit section of
# /etc/systemd/system/multi-user.target.wants/open-vm-tools.service
