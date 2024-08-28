#!/bin/sh -e
sleep 2

. ../flatpak/flatpak.sh

installFirefoxFlatpak() {
    installFlatpak;
    flatpak install flathub org.mozilla.firefox
}

installFirefoxFlatpak;
