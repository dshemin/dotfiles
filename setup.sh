#!/bin/sh

set -e

_CWD=$(dirname "$(readlink -f "$0")")

main() {
	link .navi $HOME/.navi
	link bat $HOME/.config/bat
	link nvim $HOME/.config/nvim
	link .tmux.conf $HOME/.tmux.conf
	link .zshrc $HOME/.zshrc
	link kitty $HOME/.config/kitty
}

link() {
	from=$_CWD/$1
	to=$2

	if [ ! -e "$from" ]; then
		fail "$from not exists"
	fi

	if [ -e "$to" ]; then
		log "$to already exists, skip"
		return
	fi

	ln -s $from $to
	log "Create symlink from $from to $to"
}

log() {
	msg=$1
	echo "$msg"
}

fail() {
	msg=$1

	log $msg
	exit 1
}

main $@
