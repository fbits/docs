#!/bin/sh -l

# instala pacotes necessarios
apt-get update
apt-get install -y curl gnupg gnupg2 gnupg1 git

# instala nodejs
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs npm

# instala typedoc e type2docfx que geram o arquivo .yml de estrutura da documentacao
npm install typedoc --save-dev --global
npm install type2docfx --save-dev --global
mkdir _package
#rm -rf docfx_project/api/*.yml

npm install $TARGET_PACKAGE --prefix _package
typedoc --mode file --json _output.json _package/node_modules/${TARGET_PACKAGE}/${TARGET_SOURCE_PATH} --ignoreCompilerErrors --includeDeclarations --excludeExternals
type2docfx _output.json docfx_project/api/

echo "_package/node_modules/${TARGET_PACKAGE}/${TARGET_SOURCE_PATH}"

# remove arquivos que nao devem ir para o repositorio
rm -rf _package
rm -rf _output.json

# faz push das mudancas para a master
git config --global user.email "$GH_EMAIL"
git config --global user.name "$GH_USER"

git add . --force
git status
git commit -m "Update auto-generated documentation."
git push --set-upstream origin master
