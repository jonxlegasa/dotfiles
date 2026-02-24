# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/jonlegasa/anaconda3/bin/conda
    eval /Users/jonlegasa/anaconda3/bin/conda "shell.fish" hook $argv | source
end
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
set -gx PATH $PATH /usr/local/bin /opt/homebrew/bin

# <<< conda initialize <<<
# Golang configurations
set -gx GOPATH $HOME/go
set -gx PATH $PATH $GOPATH/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

neofetch --source ~/.config/neofetch/archimedes.txt
tmux -f ~/.config/tmux/tmux.conf
set -gx PATH "$HOME/.local/bin" $PATH

# Project configurations
set -gx PROJECT_ONE_PATH "$HOME/code/demeter"
set -gx PROJECT_ONE_CMD "echo 'Ready to work'"
set -gx PROJECT_ONE_MSG "Demeter project loaded"

set -gx PROJECT_TWO_PATH "$HOME/code/blaise"
set -gx PROJECT_TWO_CMD "echo 'Ready to work'"
set -gx PROJECT_TWO_MSG "Blaise project loaded"

atuin init fish | source
