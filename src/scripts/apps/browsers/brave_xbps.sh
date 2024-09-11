#!/bin/sh -e
REPO_FILE="/etc/xbps.d/brave-void.conf"
REPOSITORY="https://gitlab.com/LightSrc/brave-void/-/raw/repository-x86_64-glibc"

if [ -e "$REPO_FILE" ]; then
    echo "File $REPO_FILE already exists."
else
    echo "repository=$REPOSITORY" | sudo tee $REPO_FILE
fi

sudo xbps-install -Sy brave
