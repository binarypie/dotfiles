#!/bin/zsh
set -e

mkdir -p $HOME/Code/rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source config.zsh
cargo install exa
