#!/bin/bash
# Installation script for russian-english dictionary for DICTD
HOST=localhost
sudo -i 

# Check if dict package is installed
if ! dpkg -l | grep -q "ii  dict "; then
    echo "Installing dict package..."
    sudo apt update
    sudo apt install dict -y
else
    echo "dict package is already installed."
fi

# Check if dictd package is installed
if ! dpkg -l | grep -q "ii  dictd "; then
    echo "Installing dictd package..."
    sudo apt update
    sudo apt install dictd -y
else
    echo "dictd package is already installed."
    systemctl start dictd
fi

cd /usr/share/dictd
sudo wget https://github.com/allseenn/dict_ruen/raw/master/ru_en-smirniczkij.tar.gz
sudo tar -xf ru_en-smirniczkij.tar.gz
sudo rm ru_en-smirniczkij.tar.gz

sudo dictdconfig -w
sudo systemctl restart dictd

if [ "$(dict -h $HOST -d абляут | grep ablaut | tr -d ' ')" == "ablaut" ]; then
    echo "Installation is successful"
else
    echo "Something went wrong"
fi
