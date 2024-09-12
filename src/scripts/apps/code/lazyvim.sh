#!/bin/sh -e

sudo xbps-install -Sy vim git neovim ripgrep fd

# required
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
[ -d ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
[ -d ~/.local/state/nvim ] && mv ~/.local/state/nvim ~/.local/state/nvim.bak
[ -d ~/.cache/nvim ] && mv ~/.cache/nvim ~/.cache/nvim.bak

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
