#!/bin/zsh
set -e

# Create node + cache directory
mkdir -p $HOME/Code/node/cache

# Install Node.Js from Nodesoruce
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
