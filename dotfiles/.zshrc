#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# 
# OMZ Config and Plugins
#
DISABLE_AUTO_TITLE='true'
ENABLE_CORRECTION='true'
ZSH_THEME='lukerandall'

plugins=(
  colored-man-pages
  dotenv
  git
  kubectl
  nvm
  osx
  vi-mode
)

NVM_AUTOLOAD='1'

source $ZSH/oh-my-zsh.sh

# EDITOR
export EDITOR='vim'

# colours
export TERM=xterm-256color

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

#
# ALIAS
#
alias g='git'
alias d='docker'
alias k='kubectl'
alias t='tmux'
alias tat='t a -t'
alias tks= 't kill-session -t'

# I always forget which sublime command I use
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias smerge='/Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge'
alias subl='sublime'
alias sbl='sublime'

# goodies
alias please='eval "sudo $(fc -ln -1)"'
alias weather='curl wttr.in/birmingham'

#
# ENVIRONMENT paths and autocompletes
#
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# AWS
export AWS_PAGER="less -F -X"

# python
# TODO: Python

# fzf
# info: https://medium.com/better-programming/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh || $(brew --prefix)/opt/fzf/install
alias fzfp="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# kubernetes
[[ $commands[kubectl] || $commands[k] ]] && source <(kubectl completion zsh)

# GNU Utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#
# Override file
#
if [ -f $HOME/.zshrc_custom ]; then
  . $HOME/.zshrc_custom
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
