#!/bin/bash

# install neovim
read -p "Do you want to install neovim? ([y]/n) " REPLY
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    ARCH=$(uname -m)
    wget https://github.com/neovim/neovim/releases/download/latest/nvim-linux-$ARCH.tar.gz -O nvim.tar.gz
    tar -xvf nvim.tar.gz
    mv ./nvim/ $HOME/.local/
    rm nvim.tar.gz
    ln -s $HOME/.local/nvim/bin/nvim $HOME/.local/bin/nvim
fi

# install nvm for plugins
read -p "Do you want to install nvm? ([y]/n) " REPLY
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi
