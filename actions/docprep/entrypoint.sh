#!/bin/sh -l

echo "Updating..."
apt-get update
apt-get install -y git unzip wget gnupg gnupg2 gnupg1

# Check in changes.
git config --global user.email "$GH_EMAIL"
git config --global user.name "$GH_USER"

echo "${GH_EMAIL}"
echo "$GH_USER"
echo ${GITHUB_ACTOR}
echo ${GITHUB_REPOSITORY}

git add . --force
#git status
git commit -m "Update auto-generated documentation."
git push origin master
