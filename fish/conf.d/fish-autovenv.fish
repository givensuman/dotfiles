# Automatically source and deactivate Python virtual environments
function _autovenv --on-variable PWD
    if type -q $autovenv_disable
        return 0
    end

    set venv ./.venv

    if test -d $venv
        # if current directory has a ".venv" folder
        source $venv/bin/activate.fish

    else if type -q deactivate
        # otherwise, we may have just left one
        deactivate
    end
end

function _fish_autovenv_uninstall --on-event fish-autovenv_uninstall
    functions --erase _autovenv

    set --erase autovenv_disable
end
