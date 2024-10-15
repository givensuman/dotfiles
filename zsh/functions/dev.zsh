#!/bin/zsh

function dev() {
  if [ $# -eq 0 ]; then
    cd "${HOME}/dev"
    return
  fi

  dev_dir="${HOME}/dev/$1"

  if [[ ! -d "$dev_dir" ]]; then
    echo "$1 is not a directory in ${HOME}/dev"
    cd "${HOME}/dev"
    return
  fi

  cd "$dev_dir"
  $EDITOR .
}
