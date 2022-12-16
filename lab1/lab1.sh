#!/bin/bash

# 1
cd $HOME
mkdir test 2>>/dev/null

# 2, 3
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

# 3
echo $dirs >>test/list
echo $files >>test/list

# 4
mkdir test/links 2>>/dev/null

#5
ln $HOME/test/list $HOME/test/links/list_hlink 2>>/dev/null

#6
ln -s $HOME/test/list $HOME/test/links/list_slink 2>>/dev/null

#7
echo "7."
echo "Number of hard links to list_hlink"
find -samefile test/links/list_hlink | wc | awk '{ print $1 }'
echo "Number of hard links to list"
find -samefile test/list | wc | awk '{ print $1 }'
echo "Number of hard links to list_slink"
find -samefile test/links/list_slink | wc | awk '{ print $1 }'

#8
wc test/list | awk '{ print $1 }' >>test/links/list_hlink

#9
echo "9."
cmp test/links/list_hlink test/links/list_slink && echo YES

#10
mv test/list test/list1

#11 Вопрос
echo "11."
cmp -s test/links/list_hlink test/links/list_slink && echo YES

#12 Вопрос
ln $HOME/test/links $HOME/links_hlink 2>>/dev/null

#13
find /etc -type f -name *.conf >list_conf 2>>/dev/null

#14
find /etc -type d -name *.d >list_d 2>>/dev/null

#15
cat list_conf >list_conf_d
cat list_d >>list_conf_d

#16
cd test
mkdir .sub 2>>/dev/null

cd ../

#17
cp list_conf_d test/.sub

#18
cp -b list_conf_d test/.sub

#19
echo "19.start"
ls -aR test
echo "19.end"
#20
man man >man.txt

#21
mkdir man_parts 2>>/dev/null
cd man_parts
split -b 1k ../man.txt
cd ../

#22
mkdir test/man.dir 2>>/dev/null

#23
mv man_parts/* test/man.dir

#24
cat test/man.dir/??? >test/man.dir/man.txt

#25
echo "25."
cmp -s man.txt test/man.dir/man.txt && echo YES

#26
echo "dfjksg90\/43r/'ew][;=4-" >newfile
cat man.txt >>newfile
mv newfile man.txt
echo "98rf4[;4]f[0o4-ki9d^&Y*" >>man.txt

#27
diff -u man.txt test/man.dir/man.txt >man_difference

#28
mv man_difference test/man.dir

#29
echo "29."
patch test/man.dir/man.txt <test/man.dir/man_difference

#30
echo "#30"
cmp -s man.txt test/man.dir/man.txt && echo YES
