sudo apt update -y
sudo apt upgrade -y

sudo apt install snapd -y
sudo snap install jdownloader2

# mount samba share
sudo apt-get install cifs-utils keyutils -y
sudo mkdir /mnt/external
# add the following to the /etc/fstab
