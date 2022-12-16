cd /etc/yum.repos.d/
for file in *; do
  if [[ $file != 'localrepo.repo' ]]; then
    mv "$file" "$(echo "$file" | sed s/\.oldrepos/\.repo/)";
  fi
done

rm -r ~/bastet-0.43

rm -r ~/localrepo

rm /etc/yum.repos.d/localrepo.repo