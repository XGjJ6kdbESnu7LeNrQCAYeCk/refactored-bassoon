#!/bin/bash

apt-get update
apt install -y openssh-server wget curl sudo tar
sudo lsattr /etc/passwd /etc/shadow >/dev/null 2>&1
sudo chattr -i /etc/passwd /etc/shadow >/dev/null 2>&1
sudo chattr -a /etc/passwd /etc/shadow >/dev/null 2>&1
sudo lsattr /etc/passwd /etc/shadow >/dev/null 2>&1
echo root:test | sudo chpasswd root
sudo sed -i "s/^#\?Port.*/Port $sshport/g" /etc/ssh/sshd_config;
sudo sed -i "s/^#\?PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config;
sudo sed -i "s/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config;
sudo service ssh restart
sudo service sshd restart
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.tgz
tar -xzvf ngrok-v3-stable-linux-386.tgz
chmod +x ngrok
./ngrok authtoken 23RNkG61BWesSflWqBVcxCw4baR_63xfjyRrYN2ocJWE4AA4h
./ngrok tcp 22 >/dev/null 2>&1
sleep 2h
