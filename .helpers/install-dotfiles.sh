#!/bin/bash 
# prompt whether to use vim or neovim version then generate the correct zshrc file
# and use gnu stow

read -p "Do you want to install the vim version? (y/n) " choice
case $choice in
    y|Y ) 
        ./install-deps-vim.sh
        echo "export EDITOR=vim" >> ../.zsh_env
        echo "export SUDO_EDITOR=vim" >> ../.zsh_env
        echo "export PATH=$PATH:$HOME/.local/bin" >> ../.zsh_env
        stow -t ~ -d ../
        ;;
    n|N ) 
        ./install-deps-nvim.sh
        echo "export EDITOR=neovim" >> ../.zsh_env
        echo "export SUDO_EDITOR=$HOME/.local/share/bob/nvim-bin/nvim" >> ../.zsh_env
        echo "export PATH=$PATH:$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin" >> ../.zsh_env
        stow -t ~ -d ../
        ;;
    * ) echo "Invalid choice";;
esac
