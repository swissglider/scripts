#!/bin/bash

# change to local user (not root)

sudo apt update -y
sudo apt upgrade -y

sudo apt install nginx -y

sudo mkdir -p /var/www/homeoverview/html
sudo chown -R $USER:$USER /var/www/homeoverview/html
sudo chmod -R 755 /var/www/homeoverview

echo HomeOverview > /var/www/homeoverview/html/index.html

sudo sed -i 's/# server_names_hash_bucket_size 64;/server_names_hash_bucket_size 64;/g' /etc/nginx/nginx.conf
sudo systemctl restart nginx
