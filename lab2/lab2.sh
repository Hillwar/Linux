echo 1
fdisk /dev/sda
echo  n p 3 +300MB w

read -p "Продолжить?" x

echo 2
cd $HOME
blkid /dev/sda3 >uuid

read -p "Продолжить?" x

echo 3
mke2fs -t ext4 -b 4096 /dev/sda3

read -p "Продолжить?" x

echo 4
dumpe2fs -h /dev/sda3 >inf_sda3

read -p "Продолжить?" x

echo 5
tune2fs -i 2m -c 2 /dev/sda3

read -p "Продолжить?" x

echo 6
mkdir /mnt/newdisk
mount -t ext4 /dev/sda3 /mnt/newdisk

read -p "Продолжить?" x

echo 7
ln -s /mnt/newdisk $HOME/newdisk

read -p "Продолжить?" x

read -p "Продолжить?" x

echo 8
mkdir $HOME/newdisk/temp

read -p "Продолжить?" x

echo 9
echo "/dev/sdb1 /mnt/newdisk ext4 noexec,noatime 0 0" >>/etc/fstab

read -p "Продолжить?" x

echo 10
fdisk /dev/sda
#d, 3, n, p, 3, +350MB, N, w
fdisk -l /dev/sda3 #проверка

read -p "Продолжить?" x

echo 11
e2fsck -n /dev/sda3

read -p "Продолжить?" x

echo 12
fdisk /dev/sda
# n p 4 default +12M w
mkfs.ext4 /dev/sda4
umount /dev/sda3
mke2fs -O journal_dev /dev/sda4
mke2fs -t ext4 -J device=/dev/sda4 /dev/sda3

read -p "Продолжить?" x

echo 13
fdisk /dev/sda
#создаем раздел 6 +100M

read -p "Продолжить?" x

fdisk /dev/sda
#создаем раздел 7 +100M

read -p "Продолжить?" x

echo 14
pvcreate /dev/sda6 /dev/sda7
vgcreate group1 /dev/sda6 /dev/sda7
lvcreate -l 48 -n LVM1 group1
mkdir /mnt/supernewdisk
mkfs.ext4 /dev/group1/LVM1
mount /dev/group1/LVM1 /mnt/supernewdisk
# lvcreate - СОЗДАНИЕ ЛОГИЧЕСКИХ ТОМОВ LVM
# vgcreate - СОЗДАНИЕ ГРУППЫ РАЗДЕЛОВ LVM
# pvcreate - ИНИЦИАЛИЗАЦИЯ ФИЗИЧЕСКИХ LVM РАЗДЕЛОВ

read -p "Продолжить?" x

echo 15
mkdir /mnt/shar
sudo yum install cifs-utils
mount.cifs //IP/Adminka /mnt/share -o user=USER password=PASSWORD

read -p "Продолжить?" x

echo 16
Added to /etc/fstab: //IP/Adminka /mnt/share cifs user=USER,password=PASSWORD,rw,iocharset=utf8 0 0
