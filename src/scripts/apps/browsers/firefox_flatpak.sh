#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installFirefoxFlatpak() {
    installFlatpak;
    flatpak install flathub org.mozilla.firefox
}

installFirefoxFlatpak;
