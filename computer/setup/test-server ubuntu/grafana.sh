# operate as su

wget https://dl.grafana.com/oss/release/grafana_5.4.0_amd64.deb
apt install -y adduser libfontconfig
dpkg -i grafana_5.4.0_amd64.deb

systemctl daemon-reload
systemctl start grafana-server

systemctl enable grafana-server.service

#  http://192.168.86.27:3000/
