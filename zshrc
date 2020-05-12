# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(rails rake colored-man colorize)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -f ~/.paths ]]; then
    source ~/.paths
fi
