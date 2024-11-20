#!/bin/sh
DOWNLOAD_URL="https://github.com/LightSrc/void-pilot/releases/latest/download/void-pilot-x86_64-linux.tar.gz"
CURRENT_WORK_DIR=$(pwd)

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
    if grep -q "^export PATH=$CURRENT_WORK_DIR/void-pilot:\$PATH$" ~/.zshrc; then
        echo True
    else
        echo False
    fi
}

bashrc_contains_void_pilot_path() {
    if grep -q "^export PATH=$CURRENT_WORK_DIR/void-pilot:\$PATH$" ~/.bashrc; then
        echo True
    else
        echo False
    fi
}

curl -fsSL "$DOWNLOAD_URL" -o void-pilot-x86_64-linux.tar.gz
tar xfz "void-pilot-x86_64-linux.tar.gz"
rm void-pilot-x86_64-linux.tar.gz
cd void-pilot
chmod +x void-pilot

if [ -f ~/.bashrc ]; then
    if [ "$(bashrc_contains_void_pilot_path)" = "False" ]; then
        echo "export PATH=$CURRENT_WORK_DIR/void-pilot:\$PATH" >> ~/.bashrc
        bash -c 'source ~/.bashrc'
    else
        echo ".bashrc already contains PATH for void-pilot, skipping..."
    fi
fi

if [ -f ~/.zshrc ]; then
    if [ "$(zshrc_contains_void_pilot_path)" = "False" ]; then
        echo "export PATH=$CURRENT_WORK_DIR/void-pilot:\$PATH" >> ~/.zshrc
        bash -c 'source ~/.zshrc'
    else
        echo ".zshrc already contains PATH for void-pilot, skipping..."
    fi
fi

./void-pilot
