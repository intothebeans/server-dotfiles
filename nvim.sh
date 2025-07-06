#!/bin/bash

# install neovim
read -p "Do you want to install neovim? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    ARCH=$(uname -m)
    wget https://github.com/MordechaiHadad/bob/releases/download/v4.1.1/bob-linux-$ARCH.zip -O bob.zip
    unzip bob.zip
    mv ./bob-linux-$ARCH/bob $HOME/.local/bin/
    rm bob.zip
    sudo chmod +x $HOME/.local/bin/bob
    sudo $HOME/.local/bin/bob use latest
fi

# install nvm for plugins
read -p "Do you want to install nvm? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
fi
