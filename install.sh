#!/bin/bash
# Installation script for russian-english dictionary for DICTD
DICTD_HOST=localhost

# Check if dict package is installed
if ! dpkg -l | grep -q "ii  dict "; then
    echo "Installing dict package..."
    sudo apt update
    sudo apt install dict mueller7accent-dict aspell-ru xfce4-dict -y
else
    echo "dict package is already installed."
fi

# Copy config for xfce4-dictd
wget https://github.com/allseenn/dict_ruen/raw/master/xfce4-dict.rc -O ~/.config/xfce4-dict/xfce4-dict.rc
kill $(ps aux | grep xfce4-dict-plugi[n] | awk '{ print $2 }')

# Check if dictd package is installed
if ! dpkg -l | grep -q "ii  dictd "; then
    echo "Installing dictd package..."
    sudo apt update
    sudo apt install dictd -y
else
    echo "dictd package is already installed."
    sudo systemctl enable dictd
    systemctl start dictd
fi

cd /usr/share/dictd
sudo wget https://github.com/allseenn/dict_ruen/raw/master/ru_en-smirniczkij.tar.gz
sudo tar -xf ru_en-smirniczkij.tar.gz
sudo rm ru_en-smirniczkij.tar.gz

sudo dictdconfig -w
sudo systemctl restart dictd
sleep 3
if [ "$(dict -h $DICTD_HOST абляут | grep ablaut | tr -d ' ')" == ablaut ]; then
    echo "Installation is successful"
else
    echo "Something went wrong"
fi

read -n 1 -s -r -p "Press any key to continue..."
