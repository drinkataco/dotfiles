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
antigen bundle vi-mode

# Faves: dst, agnoster, Soliah, dst, frisk, jispwoso
antigen theme %%zsh.omz.theme%%

antigen apply

# OMZ Config
DISABLE_AUTO_TITLE='true'
ENABLE_CORRECTION='true'

# EDITOR
export EDITOR='vim'

# colours
export TERM=xterm-256color

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# ALIAS
alias g='git'
alias d='docker'
alias hl="pygmentize -l"

# I always forget which sublime command I use
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias subl='sublime'
alias sbl='sublime'

export PATH=$PATH:/usr/local/go/bin

if [ -f $HOME/.zshrc_custom ]; then
    . $HOME/.zshrc_custom
fi