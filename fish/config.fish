set --global eza_run_on_cd true

# hydro prompt
set --global fish_prompt_pwd_dir_length 999
set --global hydro_multiline true
set --global hydro_symbol_start "\n"
set --global hydro_symbol_prompt " "
set --global hydro_symbol_git_dirty "  "
set --global hydro_symbol_git_ahead "  "
set --global hydro_symbol_git_behind "  "

set --global hydro_color_prompt b4befe
set --global hydro_color_error f38ba8
set --global hydro_color_pwd 89b4fa
set --global hydro_color_git f9e2af
set --global hydro_color_duration 94e2d5

set --global fish_greeting ""

fish_default_key_bindings

bind ctrl-f accept-autosuggestion
bind ctrl-g nextd-or-forward-word

function add_package
    set package_name $argv[1]
    echo $package_name >>~/packages.txt
end

function remove_package
    set package_name $argv[1]
    if test -f ~/packages.txt
        grep -vFx "$package_name" ~/packages.txt >~/packages.txt.tmp
        mv ~/packages.txt.tmp ~/packages.txt
    end
end

function list_packages
    if test -f ~/packages.txt
        cat ~/packages.txt
    else
        echo "No packages installed."
    end
end

function refresh
    source ~/.config/fish/config.fish
end
