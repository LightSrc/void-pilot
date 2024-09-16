#!/bin/sh -e

# Installing prerequisites
sudo xbps-install -Sy git emacs ripgrep fd

# Installing Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# Ask the user if they want to add Doom to the PATH
read -p "Do you want to add doom to the PATH? (yes(recommended) / no): " answer

# Check the user's response
if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then

    # Add to the appropriate shell configuration file if it exists
    if [ -f ~/.bashrc ]; then
        echo 'export PATH="$HOME/.config/emacs/bin:$PATH"' >> ~/.bashrc
        bash -c 'source ~/.bashrc'
    fi

    if [ -f ~/.zshrc ]; then
        echo 'export PATH="$HOME/.config/emacs/bin:$PATH"' >> ~/.zshrc
        zsh -c 'source ~/.zshrc'
    fi

    if [ -f ~/.config/fish/config.fish ]; then
        echo 'set -Ux PATH $HOME/.config/emacs/bin $PATH' >> ~/.config/fish/config.fish
        fish -c '~/.config/fish/config.fish'
    fi

    echo "Doom has been added to the PATH."
else
    echo "Doom was not added to the PATH."
fi
