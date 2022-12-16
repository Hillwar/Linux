cd /etc/yum.repos.d/
for file in *; do
  if [[ $file != 'localrepo.repo' ]]; then
    sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/$file
  fi
done
rm localrepo.repo

rm -r ~/bastet-0.43

rm -r ~/localrepo

rm /etc/yum.repos.d/localrepo.repo