#!/bin/bash

# update-arch.sh — simple Arch Linux update script (pacman only)

set -e

echo "==> Syncing and upgrading packages..."
sudo pacman -Syu

echo "==> Removing orphaned packages..."
orphans=$(pacman -Qtdq || true)
if [ -n "$orphans" ]; then
    sudo pacman -Rns $orphans
else
    echo "No orphaned packages found."
fi

echo "==> Clearing pacman cache (keeping installed + latest versions)..."
sudo pacman -Sc --noconfirm

echo "==> Done."