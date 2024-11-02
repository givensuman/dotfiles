#!/bin/zsh

function mk() {
  if [ $# -eq 0 ]; then
    echo "No argument passed"
    return
  fi

  mkdir -p $1
  cd $1
}
