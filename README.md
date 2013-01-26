smirniczkij-dict
================

Russian-English dictionary database in DICT format

Installation
------------
```
$ git clone https://github.com/vlakhadzhi/smirniczkij-dict.git
$ cd smirniczkij-dict
$ ./build
$ su
# mkdir -p /usr/local/share/dict
# cp smirniczkij-base.dict.* /usr/local/share/dict
# echo '
> database smirniczkij-base {
> data  /usr/local/share/dict/smirniczkij-base.dict.dz
> index /usr/local/share/dict/smirniczkij-base.index
> }' >>/etc/dictd.conf
# /etc/init.d/dictd restart
```
