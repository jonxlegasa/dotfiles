# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/jonlegasa/anaconda3/bin/conda
    eval /Users/jonlegasa/anaconda3/bin/conda "shell.fish" hook $argv | source
end

set -gx PATH $PATH /usr/local/bin /opt/homebrew/bin

# <<< conda initialize <<<
# Golang configurations
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
