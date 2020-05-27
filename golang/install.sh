#!/bin/zsh
set -e

mkdir -p $HOME/Code/go
curl -O https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.2.linux-amd64.tar.gz
source path.zsh
