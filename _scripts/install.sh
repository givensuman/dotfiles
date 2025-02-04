#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please run with sudo or as the root user." 1>&2
  exit 1
fi

sudo dnf update -y
sudo dnf upgrade -y
sudo dnf autoremove -y

echo "Installing extra repositories..."

# Terra
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# RPM Fusion
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
sudo dnf upgrade --refresh -y
sudo dnf group upgrade -y core
sudo dnf install -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted dnf-plugins-core

# Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update -y

echo "Updating System Firmware"
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update

sudo dnf groupupdate -y sound-and-video
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
sudo dnf install -y libdvdcss
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,ugly-\*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade -y --with-optional Multimedia
sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264

echo "Speeding Up DNF"
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf

echo "Installing my stuff..."
sudo dnf install -y ghostty \
  neovim \
  eza \
  bat \
  fzf \
  ripgrep \
  gh \
  fish \
  openvpn

sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit -y

echo "Installing some fonts..."
mkdir -p ~/.fonts

git clone https://github.com/thelioncape/San-Francisco-family ~/Downloads/SanFrancisco
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip -P ~/Downloads

cp -r ~/Downloads/SanFrancisco ~/.fonts
unzip ~/Downloads/Hack.zip -d ~/.fonts

echo "Installing some programming languages..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0
source ~/.asdf/asdf.fish

languages=("nodejs" "golang" "bun" "deno" "rust" "gleam")

for language in "${languages[@]}"; do
  asdf plugin-add "$language"
  asdf install "$language" latest
  asdf global "$language" latest
done
