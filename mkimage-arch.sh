#!/bin/zsh
echo "Creating initial Docker image"
docker build --force-rm=true -t mailsvb/archlinuxbuild -f DockerBuildFile .
docker run -it -d --name container_build mailsvb/archlinuxbuild
docker export container_build | docker import - mailsvb/archlinux
docker stop container_build
docker rm container_build
echo "Saving Docker image to tar file"
docker save mailsvb/archlinux:latest > ./arch-linux-latest.tar
echo "Deleting Docker images locally"
docker rmi mailsvb/archlinuxbuild:latest
docker rmi mailsvb/archlinux:latest
if [ -f "arch-linux-latest.tar.xz" ] ; then
  echo "Deleting old tar.xz file"
  rm arch-linux-latest.tar.xz
  git rm -f arch-linux-latest.tar.xz
fi

echo "Compressing tar file"
xz -z arch-linux-latest.tar

echo "Uploading to github"
chmod -v 644 arch-linux-latest.tar.xz
git add arch-linux-latest.tar.xz
git checkout --orphan new-master master
git commit -m "Auto Update"
git branch -M new-master master
git push -f origin master
