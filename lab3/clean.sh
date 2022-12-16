#!/bin/bash

rm -f work3.log
sudo rm -rf /home/test13
sudo rm -rf /home/test14
sudo rm -rf /home/test15

sudo gpasswd -d u1 g1 2>>/dev/null
sudo userdel -rf u1 2>>/dev/null
sudo userdel -rf u2 2>>/dev/null
sudo groupdel g1 2>>/dev/null
sudo rm /etc/skel/readme.txt 2>>/dev/null
