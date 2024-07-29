#!/usr/bin/env bash
echo "Stowing files now..."
stow --adopt .

echo "Downloading brew packages"
xargs brew install < leaves.txt

echo "Setup process finished"
