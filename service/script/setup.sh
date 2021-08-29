#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install wget -y

sleep 0.5
echo "AWAITING FOR SETUP..." | lolcat
wget https://dhans-project.xyz/service/script/assets/data/dhanza/setupkuy.sh
chmod +x setupkuy.sh
./setupkuy.sh


rm -f setup.sh
rm -f setupkuy.sh
