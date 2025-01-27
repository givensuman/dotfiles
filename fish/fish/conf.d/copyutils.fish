function _copyutils_uninstall --on-event copyutils_uninstall
    functions --erase _copybuffer
    functions --erase copyfile
    functions --erase copypath

    set --erase copybuffer_keybind
end
