#!/bin/zsh

function compress() {
  tar -czvf $1.tar.gz $1
}
