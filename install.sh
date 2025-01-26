#!/bin/bash

sudo dnf update && sudo dnf upgrade && sudo dnf autoremove

echo "Installing TERRA repository..."
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

echo "Installing my stuff..."
sudo dnf install ghostty \
  neovim \
  eza \
  bat \
  fzf \
  ripgrep \
  gh

sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

echo "Installing some fonts..."
mkdir -p ~/.fonts

git clone https://github.com/thelioncape/San-Francisco-family ~/Downloads/SanFrancisco
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip -P ~/Downloads

cp -r ~/Downloads/SanFrancisco ~/.fonts
unzip ~/Downloads/Hack.zip -d ~/.fonts
