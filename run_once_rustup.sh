#!/bin/bash

# Check if rustup is already installed
if command -v rustup &>/dev/null; then
	echo "Rustup is already installed."
	exit 0
fi

# Download and run the rustup installation script
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add rustup to PATH (optional, script usually prompts during install)
# source "$HOME/.cargo/env"

echo "Rustup installation complete."
