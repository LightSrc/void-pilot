#!/bin/sh -e
packages_to_install="$*"
sudo xbps-install -Sy $packages_to_install
