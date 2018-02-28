# PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/lib/node_modules:~/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/aedd/.oh-my-zsh

# OMZ Config
DISABLE_AUTO_TITLE='true'
ENABLE_CORRECTION='true'
ZSH_THEME='agnoster'

# Antigen OM-ZSH Plugins
if [ ! -f ~/.antigen.zsh ]; then
  sh -c "$(curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh --silent > ~/.antigen.zsh)"
fi

source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster

antigen apply

# EDITOR
export EDITOR='vim'

# ALIAS
alias g='git'

# I always forget which sublime command I use
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias subl='sublime'
alias sbl='sublime'
