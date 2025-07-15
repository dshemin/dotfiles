export ZSH="/Users/dshemin/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="garyblessington"

CASE_SENSITIVE="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(fzf git rust)

source $ZSH/oh-my-zsh.sh
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion zsh)

# Setup navi.
eval "$(navi widget zsh)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="vim"
else
    export EDITOR="nvim"
fi

alias ls="exa --icons"
alias ll="ls -laF"
alias lt="ls -laF --tree"
alias k="kubectl"
alias cat="bat"
alias vim="nvim"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/bin:$HOME/.cargo/bin:/Users/dshemin/bin:$PATH"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# For pinentry, use cli instead of ui.
export GPG_TTY=$(tty)
autoload -U compinit; compinit
