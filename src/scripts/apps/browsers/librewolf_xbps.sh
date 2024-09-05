#!/bin/sh -e
REPO_FILE="/etc/xbps.d/librewolf-void.conf"
REPOSITORY="https://github.com/index-0/librewolf-void/releases/latest/download/"

if [ -e "$REPO_FILE" ]; then
    echo "File $REPO_FILE already exists."
else
    echo "repository=$REPOSITORY" | sudo tee $REPO_FILE
fi

sudo xbps-install -Sy librewolf
