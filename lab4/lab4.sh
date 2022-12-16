#!/bin/bash

echo 1
dnf groupinstall "Development Tools"

read -p "Продолжить?" x

echo 2
tar -xzvf bastet-0.43.tgz
sudo yum install boost-devel
sudo yum install ncurses-devel
cd bastet-0.43
make
echo "install:
	install ./bastet /usr/bin
	chmod 775 /usr/bin/bastet" >Makefile
make install

read -p "Продолжить?" x

echo 3
dnf list installed >~/task3.log

read -p "Продолжить?" x

echo 4
dnf deplist gcc >~/task4_1.log
rpm -q --whatrequires libgcc >~/task4_2.log

read -p "Продолжить?" x
echo 5
yum install createrepo
mkdir ~/localrepo
cd ~/localrepo
cp ~/Linux/lab4/checkinstall-1.6.2-3.el6.1.x86_64.rpm ~/localrepo
createrepo ~/localrepo
cd /etc/yum.repos.d
echo "[localrepo]
name=localrepo
baseurl=file:///root/localrepo
enabled=1
gpgcheck=0" >localrepo.repo

read -p "Продолжить?" x
echo 6
dnf repolist all >~/task6.log

read -p "Продолжить?" x
echo 7
cd /etc/yum.repos.d/
for file in *; do
  if [[ $file != 'localrepo.repo' ]]; then
    mv "$file" "$(echo "$file" | sed s/repo/old/)";
  fi
done
dnf install checkinstall.x86_64
dnf list available

for file in *; do
  if [[ $file != 'localrepo.repo' ]]; then
    mv "$file" "$(echo "$file" | sed s/old/repo/)";
  fi
done

read -p "Продолжить?" x
echo 8
cp ~/Linux/lab4/fortunes-ru_1.52-2_all.deb ~/fortunes-ru_1.52-2_all.deb

cd ~/Linux/lab4

tar -xvf alien_8.95.6.tar.xz
dnf install perl
cd alien-8.95.6
perl Makefile.PL; make; make install

cd ~
alien --to-rpm ~/fortunes-ru_1.52-2_all.deb
rpm -i --force ~/fortunes-ru-1.52-3.noarch.rpm

read -p "Продолжить?" x
echo 9

dnf install wget
wget http://mirror.ghettoforge.org/distributions/gf/el/7/plus/x86_64/nano-2.7.4-3.gf.el7.x86_64.rpm
dnf remove nano
dnf install nano-2.7.4-3.gf.el7.x86_64.rpm
nano
mv /usr/bin/nano /usr/bin/newnano
newnano