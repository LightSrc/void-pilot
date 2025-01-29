#!/bin/sh -e

isPulseAudioInstalled() {
    which pulseaudio >/dev/null 2>&1
}

isPipewireInstalled() {
    which pipewire >/dev/null 2>&1
}

if ! isPulseAudioInstalled && ! isPipewireInstalled; then
    echo "Looks like your system is lacking audio server!"
    echo "Which one you want to install? [pipewire (recommended), pulseaudio]"
    read -p "Press ENTER if none of above: " answer
    if [ "$answer" = "pulseaudio" ]; then
        sudo xbps-install -Sy pulseaudio alsa-plugins-pulseaudio
    fi
    if [ "$answer" = "pipewire" ]; then
        sudo xbps-install -Sy pipewire
        sudo usermod -aG audio $USER
        sudo usermod -aG video $USER
        sudo mkdir -p /etc/pipewire/pipewire.conf.d
        sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
        sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
    fi
fi
