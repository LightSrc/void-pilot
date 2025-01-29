#!/bin/sh -e

sudo xbps-install -Sy wayland xorg-server-xwayland gnome dbus mesa-dri

read -p "Do you want to install GNOME apps? (yes, no): " answer
if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
    sudo xbps-install -Sy gnome-apps
fi

if [ ! -e /var/service/NetworkManager ]; then
    sudo ln -s /etc/sv/NetworkManager /var/service
fi
if [ ! -e /var/service/dbus ]; then
    sudo ln -s /etc/sv/dbus /var/service
fi

./scripts/install-login-manager.sh
./scripts/install-pulse-or-pipewire.sh

echo "GNOME successfully installed!"
