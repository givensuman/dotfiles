#!/bin/bash

echo "Updating system..."

sudo dnf update -y &>/dev/null
sudo dnf upgrade -y &>/dev/null
sudo dnf autoremove -y &>/dev/null

printf "\tDone!\n"

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
