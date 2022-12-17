#1
fdisk /dev/sda
# n p 3 +300MB w

#2
cd $HOME
blkid /dev/sda3 > uuid

#3
mke2fs -t ext4 -b 4096 /dev/sda3

#4
dumpe2fs -h /dev/sda3 > inf_sda3

#5
tune2fs -i 2m -c 2 /dev/sda3

#6
mkdir /mnt/newdisk
mount -t ext4 /dev/sda3 /mnt/newdisk

#7
ln -s /mnt/newdisk $HOME/newdisk

#8
mkdir $HOME/newdisk/temp

#9

echo "/dev/sdb1 /mnt/newdisk ext4 noexec,noatime 0 0" >> /etc/fstab

#10
fdisk /dev/sda
#d, 3, n, p, 3, +350MB, N, w
fdisk -l /dev/sda3 #проверка

#11
e2fsck -n /dev/sda3

#12
fdisk /dev/sda
# n p 4 default +12M w
mkfs.ext4 /dev/sda4
umount /dev/sda3
mke2fs -O journal_dev /dev/sda4
mke2fs -t ext4 -J device=/dev/sda4 /dev/sda3

#13
fdisk /dev/sda
#создаем раздел 6 +100M

fdisk /dev/sda
#создаем раздел 7 +100M

#14
pvcreate /dev/sda6 /dev/sda7
vgcreate group1 /dev/sda6 /dev/sda7
lvcreate -l 48 -n LVM1 group1
mkdir /mnt/supernewdisk
mkfs.ext4 /dev/group1/LVM1
mount /dev/group1/LVM1 /mnt/supernewdisk
# lvcreate - СОЗДАНИЕ ЛОГИЧЕСКИХ ТОМОВ LVM
# vgcreate - СОЗДАНИЕ ГРУППЫ РАЗДЕЛОВ LVM
# pvcreate - ИНИЦИАЛИЗАЦИЯ ФИЗИЧЕСКИХ LVM РАЗДЕЛОВ

#15
mkdir /mnt/shar
sudo yum install cifs-utils
mount.cifs //IP/Adminka /mnt/share -o user=USER password=PASSWORD

#16
Added to /etc/fstab: //IP/Adminka /mnt/share cifs user=USER,password=PASSWORD,rw,iocharset=utf8 0 0