#!/bin/sh -e
. scripts/flatpak/flatpak.sh

installSlackFlatpak() {
    installFlatpak;
    flatpak install flathub com.slack.Slack
}
installSlackFlatpak;
