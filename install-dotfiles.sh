#!/bin/bash 
cp --archive ~/.zshrc ~/.zshrc-copy-$(date +%Y%m%d%H%M%S)
cp zshrc ~/.zshrc 

cp --archive ~/.tmux.conf ~/.tmux.conf-copy-$(date +%Y%m%d%H%M%S)
cp tmux.conf ~/.tmux.conf 

cp --archive ~/.gitconfig ~/.gitconfig-copy-$(date +%Y%m%d%H%M%S)
cp gitconfig ~/.gitconfig 

git clone https://github.com/NvChad/starter ~/.config/nvim 
cp --archive ~/.config/nvim/lua ~/.config/nvim/lua-copy-$(date +%Y%m%d%H%M%S)
cp nvchad ~/.config/nvim/lua 
