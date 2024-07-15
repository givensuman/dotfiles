#!/bin/bash

# Check for Zsh existence
if ! command -v zsh &>/dev/null; then
	echo "Installing Zsh..."
	# Use your package manager (adjust for your distro)
	sudo apt install zsh # Debian/Ubuntu
	# sudo yum install zsh  # RedHat/CentOS
fi

# Check for Oh My Zsh existence
if [ ! -d ~/.oh-my-zsh ]; then
	echo "Installing Oh My Zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Unattended Install
fi

# Avoid script exiting after Oh My Zsh install (refer to issue #5873)
echo "Waiting for Oh My Zsh installation to complete..."
sleep 3

# Set Zsh as default shell (optional, prompt user for confirmation)
echo "Set Zsh as default shell? (y/N)"
read -r choice
if [[ "$choice" =~ ^([Yy])$ ]]; then
	chsh -s $(which zsh)
fi

echo "Oh My Zsh installation complete!"
