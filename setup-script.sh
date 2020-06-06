#!/bin/bash

cd ~

if [ -d ~/.vim ]; then
    mkdir .vim
fi

function cloneNecessary () {
#
# clones modules which are needed for this vim configuration
#
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
    vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

    git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

    mkdir -p ~/.vim/pack/tpope/start
    cd ~/.vim/pack/tpope/start
    git clone https://tpope.io/vim/eunuch.git
    vim -u NONE -c "helptags eunuch/doc" -c q
}

read -r -p "Do you want to keep the vim-enhanced directory? (y/N): " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    cp -r vim-enhanced/.vim .
    cp vim-enhanced/.vimrc .
    cloneNecessary
    vim -c 'PluginInstall' -c 'qa!'
else
    cp -r vim-enhanced/.vim .
    cp vim-enhanced/.vimrc .
    rm -rf vim-enhanced/
    cloneNecessary
    vim -c 'PluginInstall' -c 'qa!'
fi
