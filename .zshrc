#!/bin/zsh

# ___________________________________/\\\____________________________________
#  __________________________________\/\\\____________________________________
#   __________________________________\/\\\____________________________________
#    ________/\\\\\\\\\\\__/\\\\\\\\\\_\/\\\__________/\\/\\\\\\\_____/\\\\\\\\_
#     _______\///////\\\/__\/\\\//////__\/\\\\\\\\\\__\/\\\/////\\\__/\\\//////__
#      ____________/\\\/____\/\\\\\\\\\\_\/\\\/////\\\_\/\\\___\///__/\\\_________
#       __________/\\\/______\////////\\\_\/\\\___\/\\\_\/\\\________\//\\\________
#        __/\\\__/\\\\\\\\\\\__/\\\\\\\\\\_\/\\\___\/\\\_\/\\\_________\///\\\\\\\\_
#         _\///__\///////////__\//////////__\///____\///__\///____________\////////__

unsetopt BEEP
setopt ignore_eof
autoload -Uz compinit
compinit

# load aliases
if [ -f ~/.config/zsh/aliases.zsh ]; then
  source ~/.config/zsh/aliases.zsh
fi

# load libraries
if [ -f ~/.config/zsh/libraries.zsh ]; then
  source ~/.config/zsh/libraries.zsh
fi

# load functions
for FILE in ~/.config/zsh/functions/*.zsh; do
  if [ -f $FILE ]; then
    source $FILE
  fi
done

# load plugins
source ~/.config/zsh/antidote/antidote.zsh
antidote load ~/.config/zsh/_plugins.txt
