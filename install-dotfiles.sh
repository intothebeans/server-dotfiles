#!/bin/bash
# prompt whether to use vim or neovim version then generate the correct zshrc file
# and use gnu stow

read -p "Do you want to install the vim version? (y/n) " choice
case $choice in
y | Y)
    ./install-deps-vim.sh
    stow -t $HOME -d ../dots
    echo "export EDITOR=vim" >>$HOME/.zsh_env
    echo "export SUDO_EDITOR=vim" >>$HOME/.zsh_env
    echo "export PATH=$PATH:$HOME/.local/bin" >>$HOME/.zsh_env
    ;;
n | N)
    ./install-deps-nvim.sh
    echo "export EDITOR=neovim" >>$HOME/.zsh_env
    echo "export SUDO_EDITOR=$HOME/.local/share/bob/nvim-bin/nvim" >>$HOME/.zsh_env
    echo "export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin" >>$HOME/.zsh_env
    stow -t $HOME -d ../dots
    ;;
*) echo "Invalid choice" ;;
esac
