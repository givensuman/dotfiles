#!/bin/zsh

function venv() {
  python3 -m venv .venv
  source .venv/bin/activate
}

function on_venv() {
  MYVENV=.venv
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd on_venv
