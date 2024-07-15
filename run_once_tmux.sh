#!/bin/bash

# Check if tmux is already installed
if command -v tmux &>/dev/null; then
	echo "Tmux is already installed."
	exit 0
fi

# Update package lists (adjust for your package manager if needed)
sudo apt update

# Install tmux using your package manager (adjust for your distro)
sudo apt install tmux

echo "Tmux installation complete."
