#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installLibrewolfFlatpak() {
    installFlatpak;
    flatpak install flathub io.gitlab.librewolf-community
}
installLibrewolfFlatpak;
