#!/bin/bash

# install-yay.sh — install the yay AUR helper on Arch Linux

set -e

if command -v yay &>/dev/null; then
    echo "==> yay is already installed."
    exit 0
fi

echo "==> Installing prerequisites (git, base-devel)..."
sudo pacman -S --needed --noconfirm git base-devel

echo "==> Cloning yay from AUR..."
tmpdir=$(mktemp -d)
git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"

echo "==> Building and installing yay..."
cd "$tmpdir/yay"
makepkg -si --noconfirm

echo "==> Cleaning up..."
cd -
rm -rf "$tmpdir"

echo "==> yay installed successfully."
yay --version