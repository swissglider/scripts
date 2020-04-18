sudo apt update -y
sudo apt upgrade -y

sudo apt install snapd -y
sudo snap install jdownloader2

# mount samba share
sudo apt install cifs-utils keyutils -y
sudo apt install unrar -y
sudo mkdir /mnt/external
# add the following to the /etc/fstab
//<<ip>>/<<shareName                 /mnt/external   cifs    credentials=/etc/win-credentials,uid=shareuser,gid=sharegroup,file_mode=0777,dir_mode=0777         0       0
# create the /etc/win-credentials
