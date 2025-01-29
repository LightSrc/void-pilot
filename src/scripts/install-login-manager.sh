#!/bin/sh -e

isGdmInstalled() {
    if [ -L /var/service/gdm ]; then
        return 0
    else
        return 1
}

isSddmInstalled() {
    if [ -L /var/service/sddm ]; then
        return 0
    else
        return 1

}

if ! isGdmInstalled && ! isSddmInstalled; then
    read -p "Do you want to install display manager? (gdm, sddm or press ENTER if none of these): " answer

    if [ "$answer" = "sddm" ]; then
        sudo xbps-install -Sy sddm
        if [ ! -L /var/service/sddm ]; then
            sudo ln -s /etc/sv/sddm /var/service
        fi
    fi

    if [ "$answer" = "gdm" ]; then
        sudo xbps-install -Sy gdm
        if [ ! -L /var/service/gdm ]; then
            sudo ln -s /etc/sv/gdm /var/service
        fi
    fi
fi
