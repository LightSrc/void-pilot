#!/bin/sh -e
REPO_FILE="/etc/xbps.d/hyprland-void.conf"
REPOSITORY="https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc"

if [ -e "$REPO_FILE" ]; then
    echo "File $REPO_FILE already exists."
else
    echo "repository=$REPOSITORY" | sudo tee $REPO_FILE
fi

sudo xbps-install -Sy hyprland

isGdmInstalled() {
    which gdm >/dev/null 2>&1
}
isSddmInstalled() {
    which sddm >/dev/null 2>&1
}
isHyprpaperInstalled(){
    which hyprpaper >/dev/null 2>&1
}
isHyprcursorInstalled(){
    which hyprcursor >/dev/null 2>&1
}
isHypridleInstalled(){
    which hypridle >/dev/null 2>&1
}
isWaybarInstalled(){
    which waybar >/dev/null 2>&1
}
isRofiInstalled(){
    which rofi >/dev/null 2>&1
}
isWofiInstalled(){
    which wofi >/dev/null 2>&1
}

if [ ! $(isGdmInstalled) ] && ! [ $(isSddmInstalled) ]; then
    read -p "Do you want to install Display Manager? (gdm, sddm or press ENTER if none of these): " answer

    if [ "$answer" == "sddm" ]; then
        sudo xbps-install -Sy sddm
        if [ ! -e /var/service/sddm ]; then
            sudo ln -s /etc/sv/sddm /var/service
        fi
    fi

    if [ "$answer" == "gdm" ]; then
        sudo xbps-install -Sy gdm
        if [ ! -e /var/service/gdm ]; then
            sudo ln -s /etc/sv/gdm /var/service
        fi
    fi
fi

if [ ! $(isHyperPaperInstalled) ]; then
    read -p "Do you want to install hyprpaper? (yes, no): " answer
    if [ "$answer" == "yes" ] || [ "$answer" == "y" ]; then
        sudo xbps-install -Sy hyprpaper
    fi
fi

if [ ! $(isHyperPaperInstalled) ]; then
    read -p "Do you want to install hyprpaper? (yes, no): " answer
    if [ "$answer" == "yes" ] || [ "$answer" == "y" ]; then
        sudo xbps-install -Sy hyprpaper
    fi
fi
