#!/bin/bash
# install.sh - Sets up complete environment on fresh Arch Linux system

echo "Starting installation..."

# Step 1 - Install packages
echo "Installing packages..."
sudo pacman -S --noconfirm git vim gcc make base-devel

# Step 2 - Create necessary directories
mkdir -p ~/scripts
mkdir -p ~/projects

# Step 3 - Copy scripts
echo "Copying scripts..."
cp scripts/* ~/scripts/
chmod +x ~/scripts/*.sh

# Step 4 - Copy vim config
echo "Setting up vim..."
cp .vimrc ~/.vimrc

# Step 5 - Copy i3 configs
echo "Setting up i3..."
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
cp i3/config ~/.config/i3/config
cp i3status/config ~/.config/i3status/config

# Step 6 - Set up cron jobs
echo "Setting up cron jobs..."
crontab crontab.bak

echo "Installation complete!"
echo "Your environment is ready."
