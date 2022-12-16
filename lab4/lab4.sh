#!/bin/bash

#1
sudo apt-get install build-essential

#2
tar -xzvf bastet-0.43.tgz
sudo apt-get install libboost-dev
sudo apt-get install libncurses5-dev libncursesw5-dev
sudo apt-get install libboost-program-options-dev
cd bastet-0.43
make

echo -e "install:\n\tinstall ./bastet /usr/bin \n\t chmod 775 /usr/bin/bastet" >> Makefile
sudo make install

cd ../

#3
apt list --installed > task3.log

#4
apt depends gcc > task4_1.log
apt rdepends libgcc > task4_2.log

#5
sudo mkdir /root/localrepo
sudo cp checkinstall-1.6.2-3.el6.1.x86_64.rpm /root/localrepo
sudo apt install createrepo-c
sudo createrepo-c ~/localrepo
#cd /etc/yum.repos.d
#echo -e "[localrepo]\nname=localrepo\nbaseurl=file:///root/localrepo/\nenabled=1\ngpgcheck=0" > localrepo.repo

##6
#dnf repolist all > ~/task6.log
#
##7
#cd /etc/yum.repos.d/
#for f in *; do
#	mv "$f" "$(echo "$f" | sed s/repo/repdis/)";
#done
#mv localrepo.repdis localrepo.repo
#dnf install ~/localrepo/checkinstall-1.6.2-3.el6.1.x86_64.rpm
#
##8
#cp /mnt/share/fortunes-ru_1.52-2_all.deb ~/fortunes-ru_1.52-2_all.deb
#
#tar -xf /mnt/share/alien_8.95.tar.xz -C ~
#dnf install perl
#cd alien-8.95
#perl Makefile.PL; make; make install
#
#cd ~
#alien --to-rpm ~/fortunes-ru_1.52-2_all.deb
#dvnf install --force ~/fortunes-ru-1.52-3.noarch.rpm
#
##9
#dnf download nano
#
#dnf install https://extras.getpagespeed.com/release-el8-latest.rpm
#dnf install rpmrebuild
#
#rpmrebuild -enp nano-2.9.8-1.el8.x86_64.rpm
#
#cd ~/rpmbuild/RPMS/x86_64/
#yum remove nano
#rpm -i newnano-2.9.8-1.el8.x86_64.rpm