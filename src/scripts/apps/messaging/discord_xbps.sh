#!/bin/sh -e
REPO_FILE="/etc/xbps.d/discord-void.conf"

if [ -e "$REPO_FILE" ]; then
    echo "File $REPO_FILE already exists."
else
    echo "repository=https://gitlab.com/LightSrc/discord-void/-/raw/repository-x86_64-glibc" | sudo tee $REPO_FILE
fi

sudo xbps-install -Sy discord

# https://github.com/void-linux/void-packages/blob/4b2b0356079a16c5a633cdb4ee779a6e5a530a70/srcpkgs/discord-ptb/INSTALL.msg
# This will skip host update, because That repository will never be up-to-date in minute or hour
_CONFIG_FILE=~/.config/discord/settings.json
touch $_CONFIG_FILE

# Read the existing content or initialize with an empty JSON object
content=$(cat $_CONFIG_FILE)
if [ -z "$content" ]; then
  content="{}"
fi

# Update the JSON content
updated_content=$(echo "$content" | sed 's/}/, "SKIP_HOST_UPDATE": true}/')

# Handle the case where the JSON object is empty
if [ "$content" = "{}" ]; then
  updated_content='{"SKIP_HOST_UPDATE": true}'
fi

# Write the updated content back to the file
echo "$updated_content" > $_CONFIG_FILE
