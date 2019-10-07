#!/bin/sh

sudo wget https://github.com/dotnet/docfx/releases/download/v2.39.1/docfx.zip
sudo unzip docfx.zip -d _docfx

cd docfx_project
rm -rf obj/.cache/build/
mono ../_docfx/docfx.exe

cd ..
sudo rm -rf _docfx
sudo rm -f docfx.zip
