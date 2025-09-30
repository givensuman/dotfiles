function wipe
    set last_command history[1]
    echo $last_command
end

function _fish_wipe_uninstall --on-event fish-wipe_uninstall
    functions --erase wipe get_cursor_line _fish_wipe_preexec _fish_wipe_postexec
    set --erase _fish_wipe_start_line _fish_wipe_end_line _fish_wipe_lines
end

