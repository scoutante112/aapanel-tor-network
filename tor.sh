#!/bin/bash

echo "deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse

deb http://archive.canonical.com/ubuntu focal partner
deb-src http://archive.canonical.com/ubuntu focal partner" > /etc/apt/sources.list

apt update
apt install gpg -y
wait
apt install apt-transport-https -y

echo "deb     [arch=amd64 signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org focal main
deb-src [arch=amd64 signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org focal main" > /etc/apt/sources.list.d/tor.list

wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null
wait
apt update
apt install tor deb.torproject.org-keyring -y

echo "HiddenServiceDir /var/lib/tor/hidden_service/
HiddenServicePort 80 127.0.0.1:80
HiddenServicePort 443 127.0.0.1:443" >> /etc/tor/torrc


service tor stop
wait
service tor start
wait
cat /var/lib/tor/hidden_service/hostname
systemctl enable tor

wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh 
wait
sudo sed -i 's/read -t 10 -p "Do/read -t 1 -p "Do/' install.sh
sudo sed -i 's/n): " yes/n): " n/' install.sh
sudo sed -i "/while/i go='y'" install.sh
wait
bash install.sh forum
wait
cat /var/lib/tor/hidden_service/hostname

