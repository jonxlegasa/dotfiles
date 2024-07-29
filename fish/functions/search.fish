function search
    set search_dir $argv[1]
    set -l file (fd --hidden --exclude .git --exclude node_modules . $search_dir | fzf-tmux -p --height=80% --reverse)

    if test -n "$file"
        if test -d "$file"
            # It's a directory, so go directly into it
            cd "$file"
        else if test -f "$file"
            # It's a file, so go into its directory
            set file_dir (dirname $file)
            cd "$file_dir"
        end
    else
        echo "No file selected."
    end
end
