#!/bin/sh -e
REPO_FILE="/etc/xbps.d/hyprland-void.conf"
REPOSITORY="https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc"

if [ -e "$REPO_FILE" ]; then
    echo "File $REPO_FILE already exists."
else
    echo "repository=$REPOSITORY" | sudo tee $REPO_FILE
fi

sudo xbps-install -Sy hyprland xdg-desktop-portal-hyprland

isHyprpaperInstalled(){
    which hyprpaper >/dev/null 2>&1
}
isHyprcursorInstalled(){
    xbps-query -l | grep -q hyprcursor
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

./scripts/install-login-manager.sh
./scripts/install-pulse-or-pipewire.sh

if ! isHyprpaperInstalled; then
    read -p "Do you want to install hyprpaper? (yes, no): " answer
    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        sudo xbps-install -Sy hyprpaper
    fi
fi

if ! isHyprcursorInstalled; then
    read -p "Do you want to install hyprcursor? (yes, no): " answer
    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        sudo xbps-install -Sy hyprcursor
    fi
fi

if ! isHypridleInstalled; then
    read -p "Do you want to install hypridle? (yes, no): " answer
    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        sudo xbps-install -Sy hypridle
    fi
fi

if ! isWaybarInstalled; then
    read -p "Do you want to install waybar? (yes, no): " answer
    if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
        sudo xbps-install -Sy Waybar
    fi
fi

if ! isRofiInstalled && ! isWofiInstalled; then
    read -p "Do you want to install application launcher? (rofi, wofi or press ENTER if none of these): " answer

    if [ "$answer" = "rofi" ]; then
        sudo xbps-install -Sy rofi
    fi

    if [ "$answer" = "wofi" ]; then
        sudo xbps-install -Sy wofi
    fi
fi
