#!/bin/bash

# Install Nix
if ! command -v nix-env &> /dev/null; then
    echo "Installing Nix..."
    sh <(curl -L https://nixos.org/nix/install) --daemon
else
    echo "Nix is already installed."
fi

# Configure Nix
if ! grep -q 'experimental-features' /etc/nix/nix.conf; then
    echo "Configuring Nix..."
    echo 'experimental-features = nix-command flakes' | sudo tee -a /etc/nix/nix.conf >/dev/null
else
    echo "Nix is already configured."
fi

# Reload Bash
echo "Reloading Bash..."
source ~/.bashrc

# Add and update Home Manager channel
echo "Adding and updating Home Manager channel..."
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# Install Home Manager
echo "Installing Home Manager..."
nix-shell '<home-manager>' -A install

echo "Installation completed."

