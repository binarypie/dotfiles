#!/bin/bash
set -e

# Setup code directory
CodeDir=$HOME/Code
mkdir -p $CodeDir

GoBinary="go1.13.4.linux-amd64.tar.gz"

# Install prepreqs
OS=`uname -a`
echo $OS
if [[ $OS = *"Linux penguin"* ]] ; then
  echo "Found ChromeOS"
  sudo apt install -y git curl zsh

  # Install Go
  if [[ ! -f $GoBinary ]]; then
    curl -O https://dl.google.com/go/$GoBinary
    sudo tar xpvf $GoBinary -C /usr/local
  fi
  PATH=$PATH:/usr/local/go/bin

fi

# Set Shell
echo "Set Shell to ZSH"
sudo chsh -s /usr/bin/zsh $USER

# Find the installers and run them iteratively
cd "$(dirname "$0")"/..
git ls-tree --name-only -r HEAD | grep install.sh | while read -r installer; do
echo "› ${installer}..."
sh -c "$installer"
done
