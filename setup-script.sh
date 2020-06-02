#!/bin/bash

#script to clone necessary github projects
cd ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/eunuch.git
vim -u NONE -c "helptags eunuch/doc" -c q

vim -c 'PluginInstall' -c 'qa!'
