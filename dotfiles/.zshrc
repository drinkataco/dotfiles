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
  osx
  vi-mode
  kubectl
)

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

# python
# TODO: Python

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
