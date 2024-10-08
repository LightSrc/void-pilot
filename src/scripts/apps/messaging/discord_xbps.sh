#!/bin/sh -e
REPO_FILE="/etc/xbps.d/discord-void.conf"

isDiscordInstalled() {
    which Discord >/dev/null 2>&1
}

if isDiscordInstalled; then
    echo "Discord is already installed"
    exit 0
fi

if [ -e "$REPO_FILE" ]; then
    echo "File $REPO_FILE already exists."
else
    echo "repository=https://gitlab.com/LightSrc/discord-void/-/raw/repository-x86_64-glibc" | sudo tee $REPO_FILE
fi

sudo xbps-install -Sy discord

# https://github.com/void-linux/void-packages/blob/4b2b0356079a16c5a633cdb4ee779a6e5a530a70/srcpkgs/discord-ptb/INSTALL.msg
# This will skip host update, because That repository will never be up-to-date in minute or hour
_CONFIG_FILE=~/.config/discord/settings.json
mkdir -p ~/.config/discord
touch $_CONFIG_FILE

# Read the existing content or initialize with an empty JSON object
content=$(cat $_CONFIG_FILE)
if [ -z "$content" ]; then
    content="{}"
fi

if [ "$content" = "{}" ]; then
    updated_content='{ "SKIP_HOST_UPDATE": true }'
else
    # Check if SKIP_HOST_UPDATE already exists
    if echo "$content" | grep -q '"SKIP_HOST_UPDATE"'; then
        updated_content="$content"
    else
        # Update the JSON content
        updated_content=$(echo "$content" | sed '0,/{/s//{ "SKIP_HOST_UPDATE": true, /')
    fi
fi

# Write the updated content back to the file
echo "$updated_content" > $_CONFIG_FILE
