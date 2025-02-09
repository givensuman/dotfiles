#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please run with sudo or as the root user." 1>&2
  exit 1
fi

sudo -u "$USER" bash init-fedora.sh
sudo -u "$USER" bash init-personal.sh
sudo -u "$USER" bash init-asdf.sh
