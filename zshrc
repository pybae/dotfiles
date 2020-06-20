# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="evan"

COMPLETION_WAITING_DOTS="true"

plugins=(rails rake colorize)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

if [[ -f ~/.paths ]]; then
    source ~/.paths
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -f "/home/pyb/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/home/pyb/anaconda3/etc/profile.d/conda.sh"
else
    export PATH="/home/pyb/anaconda3/bin:$PATH"
fi
# <<< conda initialize <<<
