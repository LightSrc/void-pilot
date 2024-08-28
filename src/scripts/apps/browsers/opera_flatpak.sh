#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installOperaFlatpak() {
    installFlatpak;
    flatpak install flathub com.opera.Opera
}

installOperaFlatpak;
