#!/bin/bash

#1
dnf groupinstall "Development Tools"

##2
#tar -xzvf bastet-0.43.tgz
#sudo yum install boost-devel
#sudo yum install ncurses-devel
#cd bastet-0.43
#make
#
#echo -e "install:\n\tinstall ./bastet /usr/bin" >> Makefile
#make install
#
##3
#dnf list installed > ~/task3.log
#
##4
#dnf deplist gcc > ~/task4_1.log
#rpm -q --whatrequires libgcc > ~/task4_2.log
#
##5
#yum install createrepo
#mkdir -p localrepo
#cd localrepo
#cp checkinstall-1.6.2-3.el6.1.x86_64.rpm ~/localrepo/checkinstall-1.6.2-3.el6.1.x86_64.rpm
#createrepo ~/localrepo
#cd /etc/yum.repos.d
#touch localrepo.repo
#echo -e "[localrepo]\nname=localrepo\nbaseurl=file:///root/localrepo/\nenabled=1\ngpgcheck=0" > localrepo.repo
#
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
#cp fortunes-ru_1.52-2_all.deb ~/fortunes-ru_1.52-2_all.deb
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