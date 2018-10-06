# PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/lib/node_modules:~/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/aedd/.oh-my-zsh

# Antigen OM-ZSH Plugins
if [ ! -f $HOME/.antigen.zsh ]; then
  sh -c "$(curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh --silent > $HOME/.antigen.zsh)"
fi

source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle autojump
antigen bundle command-not-found
antigen bundle git
antigen bundle python
antigen bundle zsh-users/zsh-syntax-highlighting
antigen vi-mode

# Faves: dst, agnoster, Soliah, dst, frisk, jispwoso
antigen theme lukerandall

antigen apply

# OMZ Config
DISABLE_AUTO_TITLE='true'
ENABLE_CORRECTION='true'

# EDITOR
export EDITOR='vim'

# ALIAS
alias g='git'
alias hl="pygmentize -l"

# I always forget which sublime command I use
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias subl='sublime'
alias sbl='sublime'

export PATH=$PATH:/usr/local/go/bin
