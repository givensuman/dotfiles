#!/bin/bash

printf "Installing my stuff..."

sudo dnf install -y ghostty \
  neovim \
  eza \
  bat \
  chafa \
  fzf \
  ripgrep \
  gh \
  fish \
  openvpn &>/dev/null

sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit -y
git config --global user.name "givensuman"
git config --global user.email "givensuman@duck.com"
git config --global core.editor "nvim"
git config --global init.defaultBranch "main"

sudo dnf swap -y @gnome-desktop @cosmic-desktop &>/dev/null
sudo dnf remove -y @gnome-desktop gnome &>/dev/null
sudo dnf install -y @cosmic-desktop &>/dev/null
sudo systemctl disable gdm.service &>/dev/null
sudo systemctl enable cosmic-greeter.service &>/dev/null

printf "\tDone!\n"

echo "Installing some fonts..."

mkdir -p ~/.fonts

if [ -d ~/.fonts/SanFrancisco ]; then
  git clone https://github.com/thelioncape/San-Francisco-family ~/.fonts/SanFrancisco
fi

if [ -d ~/.fonts/Hack ]; then
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip -P ~/Downloads

  unzip ~/Downloads/Hack.zip -d ~/.fonts
  rm ~/Downloads/Hack.zip
fi

printf "\tDone!\n"
