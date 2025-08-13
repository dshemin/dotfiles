#!/bin/sh

set -e

_CWD=$(dirname "$(readlink -f "$0")")

main() {
	log "Install apps"
	install
	log "Setup rust"
	setup_rust
	log "Install apps by cargo"
	install_cargo
	log "Setup links"
	links
}

install() {
	local os=$(uname -o)

	log "Install on $os"
	case "$os" in
	"Darwin")
		install_darwin
		;;
	esac
}

install_darwin() {
	# Install brew, because we will install everything through that command.
	if ! has_cmd "brew"; then
		log "Install brew"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	local apps=(
		"kitty"
		"tmux"
		"neovim"
		"exa"
		"bat"
		"kubernetes-cli"
		"go"
		"htop"
		"fzf"
		"lua"
		"git-delta"
		"ripgrep"
		"navi"
		"rustup"
		"k9s"
		"jq"
		"font-fira-code-nerd-font"
	)

	for x in ${apps[@]}; do
		brew_install "$x"
	done
}

brew_install() {
	local pkg="$1"

	brew list | grep $pkg > /dev/null && log "$pkg already installed" && return

	log "Install $pkg"
	brew install $pkg
}

has_cmd() {
	[ -x "$(command -v $1)" ] || false
}

install_cago() {
	# TUI for database.
	# Homepage: https://github.com/achristmascarl/rainfrog
	cargo install rainfrog
}

links() {
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

setup_rust() {
	rustup update
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
