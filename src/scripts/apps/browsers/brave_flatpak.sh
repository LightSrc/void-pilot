#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installBraveFlatpak() {
    installFlatpak;
    flatpak install flathub com.brave.Browser
}
installBraveFlatpak;
