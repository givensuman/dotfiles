#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please run with sudo or as the root user." 1>&2
  exit 1
fi

###
echo "Updating system..."

sudo dnf update -y &>/dev/null
sudo dnf upgrade -y &>/dev/null
sudo dnf autoremove -y &>/dev/null

printf "\tDone!\n"
###

###
printf "Installing extra repositories..."

# Terra
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release &>/dev/null

# RPM Fusion
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm &>/dev/null
sudo dnf upgrade --refresh -y &>/dev/null
sudo dnf group upgrade -y core &>/dev/null
sudo dnf install -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted dnf-plugins-core &>/dev/null

# Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &>/dev/null
flatpak update -y &>/dev/null

printf "\tDone!\n"
###

###
printf "Updating System Firmware..."

sudo fwupdmgr get-devices &>/dev/null
sudo fwupdmgr refresh --force &>/dev/null
sudo fwupdmgr get-updates &>/dev/null
sudo fwupdmgr update &>/dev/null

sudo dnf groupupdate -y sound-and-video &>/dev/null
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing &>/dev/null
sudo dnf install -y libdvdcss &>/dev/null
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,ugly-\*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg &>/dev/null
sudo dnf install -y lame\* --exclude=lame-devel &>/dev/null
sudo dnf group upgrade -y --with-optional Multimedia &>/dev/null
sudo dnf config-manager --set-enabled fedora-cisco-openh264 &>/dev/null
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264 &>/dev/null

echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf

printf "\tDone!\n"
###

###
printf "Installing my stuff..."

sudo dnf install -y ghostty \
  neovim \
  eza \
  bat \
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
###

###
echo "Installing some fonts..."

mkdir -p ~/.fonts

git clone https://github.com/thelioncape/San-Francisco-family ~/Downloads/SanFrancisco
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip -P ~/Downloads

cp -r ~/Downloads/SanFrancisco ~/.fonts
unzip ~/Downloads/Hack.zip -d ~/.fonts

printf "\tDone!\n"
###
