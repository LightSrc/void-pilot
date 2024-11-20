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

curl -fsSL "$DOWNLOAD_URL" -o void-pilot-x86_64-linux.tar.gz
tar xfz "void-pilot-x86_64-linux.tar.gz"
rm void-pilot-x86_64-linux.tar.gz
cd void-pilot
chmod +x void-pilot

echo "Do you want to add void-pilot to your PATH? yes(recommended), no"
read add_to_path_answer

if [ $add_to_path_answer = "y" ] || [ $add_to_path_answer = "yes" ]; then
    if [ -f ~/.bashrc ]; then
        if [ "$(bashrc_contains_void_pilot_path)" = "False" ]; then
            echo 'export PATH=$HOME/void-pilot:$PATH' >> ~/.bashrc
            bash -c 'source ~/.bashrc'
        else
            echo ".bashrc already contains PATH for void-pilot, skipping..."
        fi
    fi

    if [ -f ~/.zshrc ]; then
        if [ "$(zshrc_contains_void_pilot_path)" = "False" ]; then
            echo 'export PATH=$HOME/void-pilot:$PATH' >> ~/.zshrc
            bash -c 'source ~/.zshrc'
        else
            echo ".zshrc already contains PATH for void-pilot, skipping..."
        fi
    fi
fi

./void-pilot

zshrc_contains_void_pilot_path() {
    if grep -q '^export PATH=$HOME/void-pilot:$PATH$' ~/.zshrc; then
        echo True
    else
        echo False
    fi
}

bashrc_contains_void_pilot_path() {
    if grep -q '^export PATH=$HOME/void-pilot:$PATH$' ~/.bashrc; then
        echo True
    else
        echo False
    fi
}
