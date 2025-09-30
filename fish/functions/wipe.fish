function wipe --description 'Clear the output of the last command'
    if set -q _fish_wipe_lines
        for i in (seq 1 $_fish_wipe_lines)
            tput cuu1 # Move cursor up one line
            tput el # Clear the line
        end
        set -e _fish_wipe_lines
    end
end
