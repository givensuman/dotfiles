# fzf
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# eza
alias ls="eza --icons --group-directories-first --git --color-scale"

# hydro prompt
set -Ux fish_prompt_pwd_dir_length 999
set -Ux hydro_color_prompt b4befe
set --global hydro_color_error f38ba8
set --global hydro_color_pwd 89b4fa
set --global hydro_color_git f9e2af
set --global hydro_color_duration 94e2d5
set --global hydro_multiline true

set --global hydro_symbol_start "\n"
set --global hydro_symbol_prompt " "
set --global hydro_symbol_git_dirty "  "
set --global hydro_symbol_git_ahead "  "
set --global hydro_symbol_git_behind "  "

set -Ux fish_greeting ""
fish_default_key_bindings
