#!/bin/sh -e

isGdmInstalled() {
    which gdm >/dev/null 2>&1
}

isSddmInstalled() {
    which sddm >/dev/null 2>&1
}

isPulseAudioInstalled() {
    which pulseaudio >/dev/null 2>&1
}

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

if ! isPulseAudioInstalled; then
    read -p "Do you want to install pulseaudio? (yes (recommended), no): " answer
    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        sudo xbps-install -Sy pulseaudio
        if [ ! -e /etc/xdg/autostart/pipewire.desktop ]; then
            sudo ln -s /usr/share/applications/pipewire.desktop /etc/xdg/autostart/
        fi
    fi
fi

if ! isGdmInstalled && ! isSddmInstalled; then
    read -p "Do you want to install Display Manager? (gdm (recommended), sddm or press ENTER if none of these): " answer

    if [ "$answer" = "sddm" ]; then
        sudo xbps-install -Sy sddm
        if [ ! -e /var/service/sddm ]; then
            sudo ln -s /etc/sv/sddm /var/service
        fi
    fi

    if [ "$answer" = "gdm" ]; then
        sudo xbps-install -Sy gdm
        if [ ! -e /var/service/gdm ]; then
            sudo ln -s /etc/sv/gdm /var/service
        fi
    fi
fi

echo "GNOME successfully installed!"
