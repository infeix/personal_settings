#!/bin/bash

sudo apt-get install git curl powerline htop gitk firefox

## Install Neo Vim with some plugin
sudo apt-get install neovim git

mkdir ~/tmp
cd ~/tmp
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

## Install Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable

## Install Slack
sudo snap install slack --classic

## Install Sublime Text
sudo snap install sublime-text --classic

## Install keepass
sudo add-apt-repository ppa:jtaylor/keepass
sudo apt-get update
sudo apt-get install keepass2

## Install zsh
sudo apt-get install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp -ru . ~
rm ~/terminal_settings.png
rm ~/install.sh
rm ~/README.md

