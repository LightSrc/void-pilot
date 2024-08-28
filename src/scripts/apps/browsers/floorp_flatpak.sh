#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installFloorpFlatpak() {
    installFlatpak;
    flatpak install flathub one.ablaze.floorp
}
installFloorpFlatpak;
