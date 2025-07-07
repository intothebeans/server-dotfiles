#!/bin/bash

install_nvim() {
    ARCH=$(uname -m)
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$ARCH.tar.gz -O nvim.tar.gz
    tar -xvf nvim.tar.gz
    mv ./nvim-linux-$ARCH/ $HOME/.local/nvim
    rm nvim.tar.gz
    ln -s $HOME/.local/nvim/bin/nvim $HOME/.local/bin/nvim
}

# install neovim
read -p "Do you want to install neovim? ([y]/n) " REPLY
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    install_nvim
fi

read -p "Do you want to update neovim? ([y]/n) " REPLY
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    if [[ $INSTALL_DIR ]]; then
        tar -czf $HOME/.local/nvim-backup-$(date +"%Y%m%d%H%M%S") $INSTALL_DIR
        rm -rf $INSTALL_DIR
    fi
    install_nvim
fi

# install nvm for plugins
read -p "Do you want to install nvm? ([y]/n) " REPLY
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi
