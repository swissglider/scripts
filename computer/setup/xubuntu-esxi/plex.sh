# get newest release of plex
# https://www.plex.tv/media-server-downloads/#plex-media-server
get https://downloads.plex.tv/plex-media-server-new/1.19.1.2645-ccb6eb67e/debian/plexmediaserver_1.19.1.2645-ccb6eb67e_amd64.deb

# install https://support.plex.tv/articles/200288586-installation/
sudo dpkg -i plexmediaserver_1.19.1.2645-ccb6eb67e_amd64.deb

# Install exfat
# https://itsfoss.com/mount-exfat/
sudo add-apt-repository universe
sudo apt update -y
sudo apt upgrade -y
sudo apt install exfat-fuse exfat-utils -y

# Install samba
#https://ubuntu.com/tutorials/install-and-configure-samba#1-overview
sudo apt install samba -y
# edit /etc/samba/smb.conf and add the following on the end
# [external]
#   comment = external HD
#   path = /media/diener/external
#   read only = no
#   browsable = yes
sudo service smbd restart
sudo ufw allow samba
sudo smbpasswd -a username
