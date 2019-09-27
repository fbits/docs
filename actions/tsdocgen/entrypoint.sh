#!/bin/sh -l

apt-get update
apt-get install -y curl gnupg gnupg2 gnupg1 git
curl -sL https://deb.nodesource.com/setup_11.x | bash -
apt-get install -y nodejs npm
npm install typedoc --save-dev --global
npm install type2docfx --save-dev --global
mkdir _package
#rm -rf docfx_project/api/*.yml
npm install $TARGET_PACKAGE --prefix _package
typedoc --mode file --json _output.json _package/node_modules/${TARGET_PACKAGE}/${TARGET_SOURCE_PATH} --ignoreCompilerErrors --includeDeclarations --excludeExternals
type2docfx _output.json docfx_project/api/

echo "_package/node_modules/${TARGET_PACKAGE}/${TARGET_SOURCE_PATH}"

# Do some cleanup.
rm -rf _package
rm -rf _output.json

remote_repo="https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
remote_branch="master"

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git add . --force
#git status
git remote rm origin || true
git remote add origin "${remote_repo}"

git commit -m "Deploy ${GITHUB_REPOSITORY} to ${GITHUB_REPOSITORY}:$remote_branch"
git push --force "${remote_repo}" master:${remote_branch}
