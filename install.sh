#!/bin/bash

sudo apt-get install git curl powerline htop gitk

# Install Neo Vim with some plugin
sudo apt-get install neovim git

mkdir ~/tmp
cd ~/tmp
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

