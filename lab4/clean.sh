cd /etc/yum.repos.d/
for f in *; do
	mv "$f" "$(echo "$f" | sed s/.oldrepos/.repo/)";
done
rm localrepo.repo

rm -r ~/bastet-0.43

rm -r ~/localrepo

rm /etc/yum.repos.d/localrepo.repo