#!/bin/bash

set -e

echo "==> This script will install apps are most used."

read -p "Continue? (y/n): " input

if [[ "$input" =~ ^[Yy]$ ]]; then
    echo "Continuing..."
    # rest of your script continues here
elif [[ "$input" =~ ^[Nn]$ ]]; then
    echo "Stopping script."
    exit 0
else
    echo "Invalid input. Please enter y or n."
    exit 1
fi

echo "Script is still running..."

# Installing applications

apps=("xdg-desktop-portal-hyprland" "brave" "vlc" "gimp" "neofetch" "htop" "yazi" "waybar" "swaync" "swww" "telegram")

for app in "${apps[@]}"; do
    if pacman -Si "$app" &>/dev/null; then
        echo "Installing $app via pacman..."
        sudo pacman -S --noconfirm "$app"
    elif yay -Si "$app" &>/dev/null; then
        echo "$app not in official repos, installing via yay (AUR)..."
        yay -S --noconfirm "$app"
    else
        echo "$app not found in pacman or AUR. Skipping."
    fi
done

# for neovim setup

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "LazyVim is ready, run :LazyHealth to load all plugins"

echo "ALl Set Now <3."