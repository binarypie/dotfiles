#!/bin/bash
set -e

# Setup code directory
CodeDir=$HOME/Code
mkdir -p $CodeDir

# Set Shell
echo "Set Shell to ZSH"
sudo chsh -s /usr/bin/zsh $USER

# Find the installers and run them iteratively
cd "$(dirname "$0")"/..
git ls-tree --name-only -r HEAD | grep install.sh | while read -r installer; do
echo "› ${installer}..."
sh -c "$installer"
done
