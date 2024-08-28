#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installZenFlatpak() {
    installFlatpak;
    flatpak install flathub io.github.zen_browser.zen
}
installZenFlatpak;
