#!/bin/sh -e
sleep 2

sudo xbps-install -y curl

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
