#!/bin/zsh
gi() {
	curl -s "https://www.gitignore.io/api/$*"
}

export GPG_TTY=$(tty)
