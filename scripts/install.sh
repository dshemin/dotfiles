#!/bin/sh

SH=/bin/sh

# The main function.
# Runs installation process for supported OS.
main() {
    OS=$(uname -s)

    case "$OS" in
        "Darwin")
            install_macos
        ;;
        *)
            echo "Unsupported OS type $OS"
            exit 1
        ;;
    esac
}

# Installation process for MacOS.
install_macos() {
    echo "Install on MacOS"

    # Install brew, because we will install everything through that command.
    if ! has_cmd "brew"; then
        echo "Install brew"
        $SH -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    CMDS[0]="tmux"
    CMDS[1]="nvim"
    CMDS[2]="chezmoi"
    CMDS[3]="exa"
    CMDS[4]="bat"
    CMDS[5]="kubectl"
    CMDS[6]="go"
    CMDS[7]="htop"
    CMDS[8]="fzf"
    CMDS[9]="lua"

    for x in ${CMDS[@]}; do
        brew_install "$x"
    done

    if [[ ! -d "/Applications/Alacritty.app" ]]; then
        echo "Install alacritty with brew"
        brew install alacritty
    else
        echo "alacritty is already installed"
    fi
}

has_cmd() {
    [ -x "$(command -v $1)" ] && return
    false
}

brew_install() {
    local CMD="$1"

    if ! has_cmd $CMD; then
        echo "Install $CMD with brew"
        brew install $CMD
    else
        echo "$CMD is already installed"
    fi
}

main

