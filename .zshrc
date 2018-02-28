# PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/lib/node_modules:~/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/aedd/.oh-my-zsh

# OMZ Config
DISABLE_AUTO_TITLE='true'
ENABLE_CORRECTION='true'
ZSH_THEME='agnoster'

# Antigen OM-ZSH Plugins
if [ ! -f $HOME/.antigen.zsh ]; then
  sh -c "$(curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh --silent > $HOME/.antigen.zsh)"
fi

source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle <<EOBUNDLES
   # Default Repo Bundles
   autojump
   composer
   command-not-found
   git
   git-flow
   httpie
   last-working-dir 
   python

   # Extras
   zsh-users/zsh-syntax-highlighting
EOBUNDLES

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
