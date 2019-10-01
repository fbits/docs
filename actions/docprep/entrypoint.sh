#!/bin/sh -l

echo "Updating..."
#apt-get update
apt-get install -y gnupg gnupg2 gnupg1

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
apt update
apt install mono-complete --yes

# Get DocFX
wget https://github.com/dotnet/docfx/releases/download/v2.39.1/docfx.zip
unzip docfx.zip -d _docfx
cd docfx_project

# Build docs
mono ../_docfx/docfx.exe
cd ..
rm -rf _docfx
rm -f docfx.zip

#remote_repo="https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
#remote_branch="master"

#git config --global user.name "${GITHUB_ACTOR}"
#git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

#git add . --force

#git commit -m "Deploy ${GITHUB_REPOSITORY} to ${GITHUB_REPOSITORY}:$remote_branch"
#git push --force "${remote_repo}" master:${remote_branch}

#header=$(echo -n "ad-m:${INPUT_GITHUB_TOKEN}" | base64)
#git -c http.extraheader="AUTHORIZATION: basic $header" push origin HEAD:master
