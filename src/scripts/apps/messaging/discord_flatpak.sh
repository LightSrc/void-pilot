#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installDiscordFlatpak() {
    installFlatpak;
    flatpak install flathub com.discordapp.Discord
}

installDiscordFlatpak;
