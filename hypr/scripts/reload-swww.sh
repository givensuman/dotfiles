#!/bin/bash

if ! pgrep swww-daemon >/dev/null; then
	swww-daemon
fi

swww img ~/.config/hypr/wallpapers/wallpaper --transition-type center
