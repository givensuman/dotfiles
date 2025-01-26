#!/bin/bash

# Iterate over directories in the current folder
for dir in */; do
  # Remove trailing slash from directory name
  dir="${dir%*/}"

  # Construct target path in ~/.config
  config_dir="$HOME/.config/$dir"

  # Check if target directory exists
  if [ -d "$config_dir" ]; then
    # Copy recursively from current directory to ~/.config
    cp -r "$dir" "$config_dir"
  fi
done
