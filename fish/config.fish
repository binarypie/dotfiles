# Starship
starship init fish | source

# Defaults
set -x PROJECTS $HOME/Code

# Local Bin
fish_add_path -m $HOME/.local/bin

# Dart
set -x DART_BIN /usr/lib/dart/bin
set -x DART_PUB_CACHE_BIN $HOME/.pub-cache/bin
set -x FLUTTER_BIN $PROJECTS/flutter/bin
set -x FLUTTER_PUB_CACHE_BIN $HOME/Code/flutter/.pub-cache/bin
set -x CHROME_EXECUTABLE /usr/bin/brave-browser
fish_add_path $DART_BIN $DART_PUB_CACHE_BIN $FLUTTER_BIN $FLUTTER_PUB_CACHE_BIN

# Golang
set -x GOPATH $HOME/.go
set -x GOSRC $GOPATH/src
set -x GOBIN $GOPATH/bin
fish_add_path /usr/local/go/bin $GOBIN

# Rust
fish_add_path $HOME/.cargo/bin

# NPM
fish_add_path -m $HOME/.npm-packages/bin

# Android
set -x ANDROID_HOME $PROJECTS/android
fish_add_path $ANDROID_HOME/tools $ANDROID_HOME/platform-tools/

# FZF
set -x FZF_DEFAULT_COMMAND 'rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

# VIM launches NVIM
alias vim="nvim"
alias vimdiff="vim -d"
