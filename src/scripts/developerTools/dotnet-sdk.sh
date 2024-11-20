#!/bin/sh -e
sleep 2
selected_number=""
echo "Select version to install:"
echo "1. .NET 9 SDK"
echo "2. .NET 8 SDK"
read selected_number

channel=""

if [ "$selected_number" = "1" ]; then
    channel=9.0
fi
if [ "$selected_number" = "2" ]; then
    channel=8.0
fi

if [ channel = "" ]; then
    echo "Selected wrong version! Exiting..."
    exit 1
else
    echo "Installing .NET $channel SDK"
fi

sudo xbps-install -Sy wget icu-libs openssl mit-krb5-libs libgdiplus

wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --channel $channel

zshrc_contains_dotnet_root() {
    if grep -q '^export DOTNET_ROOT=$HOME/.dotnet$' ~/.zshrc; then
        echo True
    else
        echo False
    fi
}
bashrc_contains_dotnet_root() {
    if grep -q '^export DOTNET_ROOT=$HOME/.dotnet$' ~/.bashrc; then
        echo True
    else
        echo False
    fi
}

if [ -f ~/.bashrc ]; then
    if [ "$(bashrc_contains_dotnet_root)" = "False" ]; then
        echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
        echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc
        bash -c 'source ~/.bashrc'
    else
        echo ".bashrc already contains neccessary variables, skipping..."
    fi
fi

if [ -f ~/.zshrc ]; then
    if [ "$(zshrc_contains_dotnet_root)" = "False" ]; then
        echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.zshrc
        echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.zshrc
        bash -c 'source ~/.zshrc'
    else
        echo ".zshrc already contains neccessary variables, skipping..."
    fi
fi

echo ".NET $channel SDK is successfully installed"
