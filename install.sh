#!/bin/sh
DOWNLOAD_URL="https://github.com/LightSrc/void-pilot/releases/latest/download/void-pilot-x86_64-linux.tar.gz"

findArch() {
    case "$(uname -m)" in
        x86_64|amd64) arch="x86_64" ;;
        *) exit "Unsupported architecture"
    esac
}

if ! findArch; then
    exit 1
fi

zshrc_contains_void_pilot_path() {
    if grep -q "^export PATH=$HOME/void-pilot:\$PATH$" ~/.zshrc; then
        echo True
    else
        echo False
    fi
}

bashrc_contains_void_pilot_path() {
    if grep -q "^export PATH=$HOME/void-pilot:\$PATH$" ~/.bashrc; then
        echo True
    else
        echo False
    fi
}

if [ -d "$HOME/void-pilot" ]; then
    rm -rf $HOME/void-pilot
fi

curl -fsSL "$DOWNLOAD_URL" -o void-pilot-x86_64-linux.tar.gz
tar xfz "void-pilot-x86_64-linux.tar.gz" --directory $HOME
rm void-pilot-x86_64-linux.tar.gz
chmod +x $HOME/void-pilot

if [ -f ~/.bashrc ]; then
    if [ "$(bashrc_contains_void_pilot_path)" = "False" ]; then
        echo "export PATH=$HOME/void-pilot:\$PATH" >> ~/.bashrc
        bash -c 'source ~/.bashrc'
    else
        echo ".bashrc already contains PATH for void-pilot, skipping..."
    fi
fi

if [ -f ~/.zshrc ]; then
    if [ "$(zshrc_contains_void_pilot_path)" = "False" ]; then
        echo "export PATH=$HOME/void-pilot:\$PATH" >> ~/.zshrc
        bash -c 'source ~/.zshrc'
    else
        echo ".zshrc already contains PATH for void-pilot, skipping..."
    fi
fi

./void-pilot
