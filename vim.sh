#!/bin/bash

# install vim
read -p "Do you want to install vim? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    sudo nala install -y vim
fi

# install vim-plug
read -p "Do you want to install vim-plug? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
