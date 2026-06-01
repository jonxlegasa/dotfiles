#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

echo "Stowing files now..."
stow --adopt .

echo "Downloading brew packages"
xargs brew install < "$DOTFILES_DIR/homebrew/leaves.txt"

# Setup tmux plugin manager and plugins
if [ ! -d "$HOME/.config/tmux/plugins/tpm/.git" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi
echo "Installing tmux plugins..."
"$HOME/.config/tmux/plugins/tpm/bin/install_plugins"

# Setup atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# Setup TeXpresso and its Neovim integration
"$DOTFILES_DIR/scripts/setup_texpresso.sh"

echo "Setup process finished"
