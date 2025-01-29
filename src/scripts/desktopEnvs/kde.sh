#!/bin/sh -e

sudo xbps-install -Sy wayland xorg-server-xwayland kde5 dbus mesa-dri

read -p "Do you want to install KDE base apps? (yes (recommended), no): " answer
if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
    sudo xbps-install -Sy kde5-baseapps
fi

if [ ! -e /var/service/NetworkManager ]; then
    sudo ln -s /etc/sv/NetworkManager /var/service
fi
if [ ! -e /var/service/dbus ]; then
    sudo ln -s /etc/sv/dbus /var/service
fi

./scripts/install-login-manager.sh
./scripts/install-pulse-or-pipewire.sh

echo "KDE successfully installed"
