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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pybae/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pybae/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pybae/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pybae/google-cloud-sdk/completion.zsh.inc'; fi
source <(fzf --zsh)

