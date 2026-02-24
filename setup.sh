#!/usr/bin/env bash
echo "Stowing files now..."
stow --adopt .

echo "Downloading brew packages"
xargs brew install < ./homebrew/leaves.txt

# Setup tmux plugin manager and plugins
if [ ! -d "$HOME/.config/tmux/plugins/tpm/.git" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi
echo "Installing tmux plugins..."
"$HOME/.config/tmux/plugins/tpm/bin/install_plugins"

# Setup atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

echo "Setup process finished"
