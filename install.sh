#!/bin/bash
# Prompts the user on which version to install, vim or neovim.
# Then install dependencies and stow the dotfiles.

read -p "Do you want to install the vim version? (y/n) " choice
case $choice in
y | Y)
    ./dependencies.sh
    ./vim.sh
    stow -t $HOME -d ../dots .
    echo "export EDITOR=vim" >>$HOME/.zsh_env
    echo "export SUDO_EDITOR=vim" >>$HOME/.zsh_env
    ;;
n | N)
    ./dependencies.sh
    ./nvim.sh
    echo "export EDITOR=nvim" >>$HOME/.zsh_env
    echo "export SUDO_EDITOR=$HOME/.local/nvim/bin/nvim" >>$HOME/.zsh_env
    stow -t $HOME -d ../dots .
    ;;
*) echo "Invalid choice" ;;
esac
