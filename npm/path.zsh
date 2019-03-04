#!/bin/sh
export NODE_PREFIX="$PROJECTS/node"
export PATH="$PATH:$NODE_PREFIX/bin"
export NODE_PATH="$NODE_PREFIX/lib/node_modules:$NODE_PATH"
export MANPATH="$NODE_PREFIX/share/man:$MANPATH"
export NPM_PACKAGES="$PROJECTS/node/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
export MANPATH="$NPM_PACKAGES/share/man:$MANPATH"
