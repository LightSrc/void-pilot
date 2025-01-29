#!/bin/sh -e

isGdmInstalled() {
    which gdm >/dev/null 2>&1
}

isSddmInstalled() {
    which sddm >/dev/null 2>&1
}

if ! isGdmInstalled && ! isSddmInstalled; then
    read -p "Do you want to install display manager? (gdm, sddm or press ENTER if none of these): " answer

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
