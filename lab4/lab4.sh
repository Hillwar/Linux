#!/bin/bash

echo 1
dnf groupinstall "Development Tools"

sleep 15

echo 2
tar -xzvf bastet-0.43.tgz
sudo yum install boost-devel 2>>/dev/null
sudo yum install ncurses-devel 2>>/dev/null
cd bastet-0.43
make
echo "install:[\n TAB] cp ~/lab4/bastet/bastet /usr/bin [\n TAB] chmod 775 /usr/bin/bastet" >> Makefile
make install

sleep 15

echo 3
dnf list installed > ~/task3.log

sleep 15

echo 4
dnf deplist gcc > ~/task4_1.log
rpm -q --whatrequires libgcc > ~/task4_2.log

sleep 15
echo 5
yum install createrepo 2>>/dev/null
mkdir localrepo
cd localrepo
cp checkinstall-1.6.2-3.el6.1.x86_64.rpm ~/localrepo/checkinstall-1.6.2-3.el6.1.x86_64.rpm
createrepo ~/localrepo
cd /etc/yum.repos.d
touch localrepo.repo
echo -e "[localrepo]\nname=localrepo\nbaseurl=file:///root/localrepo/\nenabled=1\ngpgcheck=0" > localrepo.repo

sleep 15
echo 6
dnf repolist all > ~/task6.log

sleep 15
echo 7
cd /etc/yum.repos.d/
for f in *; do
	mv "$f" "$(echo "$f" | sed s/repo/oldrepos/)";
done
mv localrepo.oldrepos localrepo.repo
dnf list available
dnf install checkinstall.x86_64

sleep 15
echo 8
cp fortunes-ru_1.52-2_all.deb ~/fortunes-ru_1.52-2_all.deb
yum install alien 2>>/dev/null
alien --to-rpm ~/fortunes-ru_1.52-2_all.deb
rpm -i ~/fortunes-ru-1.52-3.noarch.rpm

sleep 15
echo 9
dnf download nano 2>>/dev/null
dnf install https://extras.getpagespeed.com/release-el8-latest.rpm 2>>/dev/null
dnf install rpmrebuild 2>>/dev/null

rpmrebuild -enp nano-2.9.8-1.el8.x86_64.rpm

cd ~/rpmbuild/RPMS/x86_64/
yum remove nano
rpm -i newnano-2.9.8-1.el8.x86_64.rpm