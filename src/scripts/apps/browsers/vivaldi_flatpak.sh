#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installVivaldiFlatpak() {
    installFlatpak;
    flatpak install flathub com.vivaldi.Vivaldi
}
installVivaldiFlatpak;
