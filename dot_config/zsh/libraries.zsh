#!/bin/zsh

# bat
export BAT_THEME="Catppuccin Mocha"

# eza
export AUTOCD=1

# tmux
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_UNICODE=true
export ZSH_TMUX_FIXTERM=true
export ZSH_TMUX_AUTONAME_SESSION=true

# bun
[ -s "/home/given/.bun/_bun" ] && source "/home/given/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
eval "$(fnm env --use-on-cd)"

# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
export EDITOR="nvim"

# golang
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$PATH:/usr/local/go/bin"

# ziglang
export PATH="$PATH:/usr/local/zig"

# lazygit
alias lazygit="lazygit"

# zsh-autosuggestions
bindkey -r '^g' autosuggest-accept
bindkey -r '^f' forward-word

