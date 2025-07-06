#!/bin/bash

echo "$(cat beanin.txt)" | fold -w 80 -s
echo "============================================="
echo "Welcome to the Beans Server Dotfiles installer!"
echo "This script will install all necessary dependencies."
echo "============================================="

echo "Installing nala"
curl https://gitlab.com/volian/volian-archive/-/raw/main/install-nala.sh | bash
sudo apt install -t nala nala

# main dependencies
sudo nala update
sudo nala install git curl wget zsh tmux ripgrep bat unzip trash-cli build-essential python3-pip gpg rsync less stow
# fix batcat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# install tpm
read -p "Do you want to install tpm? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# install fzf
read -p "Do you want to install fzf? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# install zoxide
read -p "Do you want to install zoxide? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# install eza
read -p "Do you want to install eza? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo nala update
    sudo nala install eza
fi

# install starship
read -p "Do you want to install starship? ([y]/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ || $REPLY == "" ]]; then
    curl -sS https://starship.rs/install.sh | sh
    starship preset bracketed-segments -o ~/.config/starship.toml
fi

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
