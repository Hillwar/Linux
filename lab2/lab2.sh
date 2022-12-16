#1
fdisk /dev/sda/
# n, p, 3, +300MB, w

##2
#cd $HOME
#blkid /dev/sda3 > uuid
#
##3
#mke2fs -t ext4 -b 4096 /dev/sda3
#
##4
#dumpe2fs -h /dev/sda3
#
##5
#tune2fs -i 2m -c 2 /dev/sda3
#
##6
#mkdir /mnt/newdisk
#mount -t ext4 /dev/sda3 /mnt/newdisk
#
##7
#ln -s /mnt/newdisk $HOME/newdisk
#
##8
#mkdir $HOME/newdisk/ttt
#
##9
#vim /etc/fstab
## /dev/sda3 /mnt/newdisk ext4 noatime,noexec 0 0
#reboot
#cd $HOME/mnt/newdisk && touch a.sh && chmod u+x a.sh
#./a.sh
## Permission denied
#
##10
#umount /dev/sda3
#fdisk /dev/sda
##d, 3, n, p, 3, +350MB, N, w
#reboot
#
##11
#e2fsck -n /dev/sda3
#
##12
#fdisk /dev/sda
## n ; p ; enter ; +12MB ; w
#mke2fs -t ext4 -b 4096 /dev/sda4
#tune2fs -J location=dev/sda4 /dev/sda3
#
##13
#fdisk /dev/sda
## d, 4, d, 3, w
#reboot
#fdisk /dev/sda
## n, p, 3, default, +100Mb, n, p, 4, default, +100Mb, w
#
##14
#pvcreate /dev/sda3 /dev/sda4
#vgcreate volumegroup /dev/sda3 /dev/sda4
#lvcreate -n localvolume -L 150Mb volumegroup
#mke2fs -t ext4 /dev/volumegroup/localvolume
#mkdir $HOME/mnt/supernewdisk
#mount -t ext4 /dev/volumegroup/localvolume $HOME/mnt/supernewdisk
#
##15
#mkdir /mnt/share
#mount.cifs //192.168.0.101/Users/ugolnikov/lab2 /mnt/share/ -o user=ugolnikov
#
##16
#vim /etc/fstab
## /mnt/share/ cifs user=ugolnikov,rw 0 0