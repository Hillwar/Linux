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
    mv "$file" "$(echo "$file" | sed s/\.repo/\.oldrepos/)";
  fi
done
dnf install checkinstall.x86_64
dnf list available

read -p "Продолжить?" x
echo 8
cp ~/Linux/lab4/fortunes-ru_1.52-2_all.deb root
yum install alien
alien --to-rpm ~/fortunes-ru_1.52-2_all.deb
rpm -i ~/fortunes-ru-1.52-3.noarch.rpm

read -p "Продолжить?" x
echo 9
dnf download nano
dnf install https://extras.getpagespeed.com/release-el8-latest.rpm
dnf install rpmrebuild

rpmrebuild -enp nano-2.9.8-1.el8.x86_64.rpm

cd ~/rpmbuild/RPMS/x86_64/
yum remove nano
rpm -i newnano-2.9.8-1.el8.x86_64.rpm
