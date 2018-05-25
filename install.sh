#!/bin/bash

sudo apt-get install curl

# Install Neo Vim with some plugin
sudo apt-get install neovim git

mkdir ~/tmp
cd ~/tmp
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim

echo 'if &compatible' >> ~/.config/nvim/init.vim
echo ' set nocompatible' >> ~/.config/nvim/init.vim
echo 'endif' >> ~/.config/nvim/init.vim
echo '" Add the dein installation directory into runtimepath' >> ~/.config/nvim/init.vim
echo 'set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'if dein#load_state('\''~/.cache/dein'\'')' >> ~/.config/nvim/init.vim
echo ' call dein#begin('\''~/.cache/dein'\'')' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo ' call dein#add('\''~/.cache/dein'\'')' >> ~/.config/nvim/init.vim
echo ' call dein#add('\''Shougo/deoplete.nvim'\'')' >> ~/.config/nvim/init.vim
echo ' if !has('\''nvim'\'')' >> ~/.config/nvim/init.vim
echo '   call dein#add('\''roxma/nvim-yarp'\'')' >> ~/.config/nvim/init.vim
echo '   call dein#add('\''roxma/vim-hug-neovim-rpc'\'')' >> ~/.config/nvim/init.vim
echo ' endif' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo ' call dein#end()' >> ~/.config/nvim/init.vim
echo ' call dein#save_state()' >> ~/.config/nvim/init.vim
echo 'endif' >> ~/.config/nvim/init.vim
echo '' >> ~/.config/nvim/init.vim
echo 'filetype plugin indent on' >> ~/.config/nvim/init.vim
echo 'syntax enable' >> ~/.config/nvim/init.vim
