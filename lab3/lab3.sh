#!/bin/bash

echo 1
awk -F: '{ print "user",$1,"has id", $3 }' /etc/passwd >work3.log

read -p "Продолжить?" x

echo 2
sudo chage -l root | grep "Last password change" | awk '{print $5, $6, $7}' >>work3.log

read -p "Продолжить?" x

echo 3
getent group | cut -d : -f1 | sed -z 's/\n/,/g;s/,$/\n/' >>work3.log

read -p "Продолжить?" x

echo 4
echo "Be careful!" | sudo tee -a /etc/skel/readme.txt

read -p "Продолжить?" x

echo 5
sudo useradd -p 12345678 u1

read -p "Продолжить?" x

echo 6
sudo groupadd g1 2>>/dev/null

read -p "Продолжить?" x

echo 7
sudo usermod -a -G g1 u1

read -p "Продолжить?" x

echo 8
echo user >>work3.log
cat /etc/passwd | grep "u1" | awk 'BEGIN{FS=":"} {print $1, $3}' >>work3.log
echo groups >>work3.log
cat /etc/group | grep "u1" | awk 'BEGIN{FS=":"} {print $1, $3}' >>work3.log

read -p "Продолжить?" x

echo 9
sudo usermod -a -G g1 root

read -p "Продолжить?" x

echo 10
echo "users in g1:" >>work3.log
cat /etc/group | grep "g1" | awk 'BEGIN{FS=":"} {print $4}' >>work3.log

read -p "Продолжить?" x

echo 11
sudo usermod -s /usr/bin/mc u1

read -p "Продолжить?" x

echo 12
sudo useradd -p 87654321 u2

read -p "Продолжить?" x

echo 13
sudo mkdir /home/test13
sudo cp work3.log /home/test13/work3-1.log
sudo cp work3.log /home/test13/work3-2.log

read -p "Продолжить?" x

echo 14

sudo usermod -a -G g1 u2 2>>/dev/null

sudo chown -R u1 /home/test13

sudo chgrp -R g1 /home/test13

sudo chmod 750 /home/test13
sudo chmod 640 /home/test13/* 2>>/dev/null

read -p "Продолжить?" x

echo 15
sudo mkdir /home/test14 2>>/dev/null
sudo chown u1 /home/test14
sudo chmod 1777 /home/test14

read -p "Продолжить?" x

echo 16
cp /usr/bin/nano /home/test14
chown u1:u1 /home/test14/nano
sudo chmod a+s /home/test14/nano

read -p "Продолжить?" x

echo 17
sudo mkdir /home/test15 2>>/dev/null
echo "pin: 0000" | sudo tee -a /home/test15/secret_file
sudo chmod a-r /home/test15 2>>/dev/null
