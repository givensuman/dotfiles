#!/bin/zsh

function config() {
  if [ $# -eq 0 ]; then
    cd "${HOME}/.config"
    return
  fi

  config_dir="${HOME}/.config/$1"

  if [[ ! -d "$config_dir" ]]; then
    echo "$1 is not a directory in ${HOME}/.config"
    cd "${HOME}/.config"
    return
  fi

  cd "$config_dir"
  $EDITOR .
}
