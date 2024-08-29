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
./void-pilot
