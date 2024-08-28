#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installChromiumFlatpak() {
    installFlatpak;
    flatpak install flathub org.chromium.Chromium
}
installChromiumFlatpak;
