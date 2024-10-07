#!/bin/bash

chsh -s "$(which zsh)"

git config --global user.name "givensuman"
git config --global user.email "givensuman@duck.com"

gh repo auth login

bat cache --build

# install bun
curl -fsSL https://bun.sh/install | bash

# install node
fnm install --latest
fnm use latest

# fix cursors
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
# fix flatpak theming
sudo flatpak override --env=GTK_THEME='catppuccin-mocha-pink-standard-default'
sudo flatpak override --env=ICON_THEME='Bibata-Modern-Classic'
