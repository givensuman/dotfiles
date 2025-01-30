# Loop through each directory in the source directory
for dir in (ls -d ./*)
    if ! test -d dir
        continue
    end

    set dir (basename $dir) # Extract just the directory name

    set config_dir "$HOME/.config/$dir"
    set source_path "./$dir"

    cp -r "$config_dir" "$source_path"

    if test $status -ne 0
        echo "Error syncing '$dir'. Skipping."
    end
end
