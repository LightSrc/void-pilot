#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installUngoogledChromiumFlatpak() {
    installFlatpak;
    flatpak install flathub io.github.ungoogled_software.ungoogled_chromium
}
installUngoogledChromiumFlatpak;
