#!/bin/sh -l

echo "Updating..."
apt-get update
apt-get install -y git unzip wget gnupg gnupg2 gnupg1

# Install Mono 
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

# Check in changes.
git config --global user.email "$GH_EMAIL"
git config --global user.name "$GH_USER"

git init
git add . --force
git status
git commit -m "Update auto-generated documentation."
git push --set-upstream origin master
