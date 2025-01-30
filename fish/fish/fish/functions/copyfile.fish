# Copies the contents of a given file to the system clipboard
function copyfile --description "Copy file contents to clipboard"
    argparse --min-args 1 --max-args 1 -- $argv
    or return

    # If file does not exist
    if test ! -f "$argv[1]"
        echo "file $argv[1] not found"
        return 1
    end

    # Copy `cat` output to clipboard
    cat $argv[1] | fish_clipboard_copy
end
