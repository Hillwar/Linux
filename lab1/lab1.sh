#!/bin/bash

echo 1
cd $HOME
mkdir test

read -p "Продолжить?" x

echo 2
dirs=0
files=0

for str in $(ls -a /etc); do
  if [[ -d /etc/$str ]]; then
    echo "$str/"
    let dirs=$dirs+1

  elif [[ -f /etc/$str ]]; then
    echo "$str"
    if [[ $str = .* ]]; then
      let files=$files+1
    fi
  else
    echo "Nothing"
  fi
done >test/list

read -p "Продолжить?" x

echo 3
echo $dirs >>test/list
echo $files >>test/list

read -p "Продолжить?" x

echo 4
mkdir test/links

read -p "Продолжить?" x

echo 5
ln $HOME/test/list $HOME/test/links/list_hlink

read -p "Продолжить?" x

echo 6
ln -s $HOME/test/list $HOME/test/links/list_slink

read -p "Продолжить?" x

echo 7
echo "Number of hard links to list_hlink"
find -samefile test/links/list_hlink | wc | awk '{ print $1 }'
echo "Number of hard links to list"
find -samefile test/list | wc | awk '{ print $1 }'
echo "Number of hard links to list_slink"
find -samefile test/links/list_slink | wc | awk '{ print $1 }'

read -p "Продолжить?" x

echo 8
wc test/list | awk '{ print $1 }' >>test/links/list_hlink

read -p "Продолжить?" x

echo 9
cmp test/links/list_hlink test/links/list_slink && echo YES

read -p "Продолжить?" x

echo 10
mv test/list test/list1

read -p "Продолжить?" x

echo 11
cmp -s test/links/list_hlink test/links/list_slink && echo YES

read -p "Продолжить?" x

echo 12 Вопрос
ln $HOME/test/links $HOME/links_hlink

read -p "Продолжить?" x

echo 13
sudo find /etc -type f -name *.conf >list_conf

read -p "Продолжить?" x

echo 14
sudo find /etc -type d -name *.d >list_d

read -p "Продолжить?" x

echo 15
cat list_conf >list_conf_d
cat list_d >>list_conf_d

read -p "Продолжить?" x

echo 16
cd test
mkdir .sub

cd ../

read -p "Продолжить?" x

echo 17
cp list_conf_d test/.sub

read -p "Продолжить?" x

echo 18
cp -b list_conf_d test/.sub

read -p "Продолжить?" x

echo 19
ls -aR test

read -p "Продолжить?" x

echo 20
man man >man.txt

read -p "Продолжить?" x

echo 21
mkdir man_parts
cd man_parts
split -b 1k ../man.txt
cd ../

read -p "Продолжить?" x

echo 22
mkdir test/man.dir

read -p "Продолжить?" x

echo 23
mv man_parts/* test/man.dir

read -p "Продолжить?" x

echo 24
cat test/man.dir/??? >test/man.dir/man.txt

read -p "Продолжить?" x

echo 25
cmp -s man.txt test/man.dir/man.txt && echo YES

read -p "Продолжить?" x

echo 26
echo "dfjksg90\/43r/'ew][;=4-" >newfile
cat man.txt >>newfile
mv newfile man.txt
echo "98rf4[;4]f[0o4-ki9d^&Y*" >>man.txt

read -p "Продолжить?" x

echo 27
diff -u man.txt test/man.dir/man.txt >man_difference

read -p "Продолжить?" x

echo 28
mv man_difference test/man.dir

read -p "Продолжить?" x

echo 29
patch test/man.dir/man.txt <test/man.dir/man_difference

read -p "Продолжить?" x

echo 30
cmp -s man.txt test/man.dir/man.txt && echo YES
