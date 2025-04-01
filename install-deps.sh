#!/bin/bash 

# basic packages 
sudo apt update 
sudo apt install -y zsh tmux ripgrep batcat \
    unzip trash-cli build-essential \ 
    python3-pip python3-venv python3-pipx gpg

# install tpm 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 

# install neovim 
sudo add-apt-repository ppa:neovim-ppa/stable -y 
sudo apt update 
sudo apt install -y neovim 

# install fzf 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install 

# install zoxide 
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# install eza 
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza 

# install starship
curl -sS https://starship.rs/install.sh | sh 

# install nvm 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

# install rbenv 
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

