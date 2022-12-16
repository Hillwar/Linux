#!/bin/bash

#1
dnf groupinstall "Development Tools"

#2
tar -xzvf bastet-0.43.tgz
sudo yum install boost-devel
sudo yum install ncurses-devel
cd bastet-0.43
make
echo "install:[\n TAB] cp ~/lab4/bastet/bastet /usr/bin [\n TAB] chmod 775 /usr/bin/bastet" >> Makefile
make install

#3
dnf list installed > ~/task3.log

#4
dnf deplist gcc > ~/task4_1.log
rpm -q --whatrequires libgcc > ~/task4_2.log

#5
yum install createrepo
mkdir localrepo
cd localrepo
cp checkinstall-1.6.2-3.el6.1.x86_64.rpm ~/localrepo/checkinstall-1.6.2-3.el6.1.x86_64.rpm
createrepo ~/localrepo
cd /etc/yum.repos.d
touch localrepo.repo
echo -e "[localrepo]\nname=localrepo\nbaseurl=file:///root/localrepo/\nenabled=1\ngpgcheck=0" > localrepo.repo

#6
dnf repolist all > ~/task6.log

#7
cd /etc/yum.repos.d/
for f in *; do
	mv "$f" "$(echo "$f" | sed s/repo/oldrepos/)";
done
mv localrepo.oldrepos localrepo.repo
dnf list available
dnf install checkinstall.x86_64

#8
cp fortunes-ru_1.52-2_all.deb ~/fortunes-ru_1.52-2_all.deb
yum install alien
alien --to-rpm ~/fortunes-ru_1.52-2_all.deb
rpm -i ~/fortunes-ru-1.52-3.noarch.rpm

#9
dnf download nano
dnf install https://extras.getpagespeed.com/release-el8-latest.rpm
dnf install rpmrebuild

rpmrebuild -enp nano-2.9.8-1.el8.x86_64.rpm

cd ~/rpmbuild/RPMS/x86_64/
yum remove nano
rpm -i newnano-2.9.8-1.el8.x86_64.rpm