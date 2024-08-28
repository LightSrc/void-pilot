isFlatpakInstalled() {
    which flatpak >/dev/null 2>&1
}

checkFlathubExistsInRemotes() {
    [ "$(flatpak remotes | grep -c flathub)" = "1" ] && return 0 || return 1
}

installFlatpak() {
    if ! isFlatpakInstalled; then
        echo "Installing flatpak..."
        sudo xbps-install -S flatpak
    fi

    if ! checkFlathubExistsInRemotes; then
        addFlathubRepo
    fi
}

addFlathubRepo() {
    echo "Adding flathub repository to flatpak"
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}
