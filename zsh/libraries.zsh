#!/bin/zsh

# eza
export AUTOCD=1

# bat
export BAT_THEME="Catppuccin Mocha"

# homebrew
export PATH="/home/linuxbrew/.linuxbrew/bin/:$PATH"

# bun
[ -s "/home/given/.bun/_bun" ] && source "/home/given/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
eval "$(fnm env --use-on-cd)"

# nvim
export EDITOR="nvim"

# lazygit
alias lazy="lazygit"
