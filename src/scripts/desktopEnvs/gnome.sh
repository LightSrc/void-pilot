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
if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
    sudo xbps-install -Sy gnome-apps
fi

sudo ln -s /etc/sv/NetworkManager /var/service
sudo ln -s /etc/sv/dbus /var/service

if [ ! $(isPulseAudioInstalled) ]; then
    read -p "Do you want to install pulseaudio? (yes (recommended), no): " answer
    if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
        sudo xbps-install -Sy pulseaudio
        sudo ln -s /usr/share/applications/pipewire.desktop /etc/xdg/autostart/
    fi
fi

if [[ ! $(isGdmInstalled) && ! $(isSddmInstalled) ]]; then
    read -p "Do you want to install Display Manager? (gdm (recommended), sddm or press ENTER if none of these): " answer

    if [ "$answer" == "sddm" ]; then
        sudo xbps-install -Sy sddm
        sudo ln -s /etc/sv/sddm /var/service
    fi

    if [ "$answer" == "gdm" ]; then
        sudo xbps-install -Sy gdm
        sudo ln -s /etc/sv/gdm /var/service
    fi
fi
