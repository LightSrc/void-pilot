#!/bin/sh -e
package_to_install="$*"

. scripts/flatpak/flatpak.sh

installFlatpak;
flatpak install flathub $package_to_install
