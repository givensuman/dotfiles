#!/bin/zsh

# eza
export AUTOCD=1

# bat
export BAT_THEME="Catppuccin Mocha"

# zed
export PATH=$HOME/.local/bin:$PATH

# bun
[ -s "/home/given/.bun/_bun" ] && source "/home/given/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# cargo
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# fnm
eval "$(fnm env --use-on-cd)"

# nvim
export EDITOR="nvim"

# lazygit
alias lazy="lazygit"

# zsh-autosuggestions
bindkey '^G' autosuggest-accept
bindkey '^F' forward-word

# fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
