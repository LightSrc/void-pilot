#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installTelegramFlatpak() {
    installFlatpak;
    flatpak install flathub org.telegram.desktop
}
installTelegramFlatpak;
