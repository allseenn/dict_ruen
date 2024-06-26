# Russian-English dictionary (DICT format)
## Description

Its modified/improved [fork](https://github.com/vlakhadzhi/smirniczkij-dict.git) of Russian-English dictionary by Smirniczkij in DICT format (.index, .dict.dz) used by DICTD server (/usr/share/dictd).
 
Was tested on:
- Ubuntu 20.04.6 LTS
- Ubuntu 22.04.3 LTS
- Ubuntu 23.04
- Ubuntu 24.04 LTS

## Easy installation with script

Just copy code below to terminal
```
wget -O install.sh https://github.com/allseenn/dict_ruen/raw/master/install.sh && bash install.sh && rm install.sh
```

Installation procedure will be in automatic mode. Answer questions in terminal and enter sudo password.

You will get ability to translate:
- Russian to English
- English to Russian
- English spellchecker
- Web tranlate with yandex

## Installation from source 

1. Install git and dict format utility
```
apt install git dictfmt
```
2. Clone remote repo to local
```
git clone https://github.com/allseenn/dict_ruen.git
```
3. Goto local repo in **src** folder
```
cd dict_ruen/src
```
4. Exec bash script to build dictionary
```
./build
```
5. Change user to root
```
sudo su
```
6. Copy compiled dictionary files to DICTD folder
```
cp ru_en-smirniczkij.dict.dz ru_en-smirniczkij.index /usr/share/dictd
```
7. Add new dictionary to DICTD config
```
 dictdconfig -w
```
8. Restart DICTD service
```
systemctl restart dictd
```
9. Check that **ru_en-smirniczkij** is present in dictionary list
```
dict -D
```
10. If all installed properly you could use command line or GUI dict client
```
dict Привет
```

## Installing from tarball

1. Change user to root
```
sudo su
```
2. Go to DICTD server folder
```
cd /usr/share/dictd
```
3. Download tarball with dictionary files from repo to local
```
wget https://github.com/allseenn/dict_ruen/raw/master/ru_en-smirniczkij.tar.gz
```
4. Extract tarball
```
tar -xf ru_en-smirniczkij.tar.gz
```
5. Delete tarball
```
rm ru_en-smirniczkij.tar.gz
```
6. Add new dictionary to DICTD config
```
 dictdconfig -w
```
7. Restart DICTD service
```
systemctl restart dictd
```
8. Check that **ru_en-smirniczkij** is present in dictionary list
```
dict -D
```
9. If all installed properly you could use command line or GUI dict client
```
dict Привет
```
