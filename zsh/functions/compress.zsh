#!/bin/zsh

function compress() {
  if [ $# -eq 0 ]; then
    echo "No argument passed"
    return
  fi

  if [[ ! -d $1 ]] || [[ ! -f $1 ]]; then
    echo "$1 is not compressable"
    return
  fi

  tar -czvf $1.tar.gz $1
}
