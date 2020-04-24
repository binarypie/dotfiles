#!/bin/sh
export LOCAL_BIN="$HOME/.local/bin"
export PATH="$PATH:$LOCAL_BIN"

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
