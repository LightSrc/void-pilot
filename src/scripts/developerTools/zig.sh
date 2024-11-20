#!/bin/sh -e
sleep 2
sudo xbps-install -Sy zig

echo "Do you want to install ZLS (yes(recommended), no)"
read install_zls

if [ $install_zls = "y" ] || [ $install_zls = "yes" ]; then
    sudo xbps-install -Sy zls
fi
