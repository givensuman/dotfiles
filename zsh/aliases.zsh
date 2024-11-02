#!/bin/zsh

# refresh zsh
alias refresh="exec zsh"

# list packages
alias packages="pacman -Q --quiet --explicit --native && pacman -Q --quiet --explicit --foreign | xargs printf '%s [aur]\n'"

# list processes
alias processes="ps -f"

# safety first
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# typos
alias c="clear"
alias cl="clear"
alias ckear="clear"
alias clr="clear"

alias :q="exit"
alias ext="exit"
alias xt="exit"
alias by="exit"
alias 'bye'="exit"
alias die="exit"
alias quit="exit"

# zoo-wee mama
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias ..1="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."
alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."

