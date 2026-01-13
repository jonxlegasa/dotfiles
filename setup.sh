#!/usr/bin/env bash
echo "Stowing files now..."
stow --adopt .

echo "Downloading brew packages"
xargs brew install < ./homebrew/leaves.txt

# Setup atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

echo "Setup process finished"
