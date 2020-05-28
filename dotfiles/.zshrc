#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=/Users/aedd/.oh-my-zsh

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
alias t='tmux'
alias tat='t a -t'
alias tks= 't kill-session -t'

# I always forget which sublime command I use
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias subl='sublime'
alias sbl='sublime'

#
# ENVIRONMENT
#
export PATH="$HOME/bin:$PATH"

# NPM / nodejs / nvm
# TODO: NVM
export PATH="/usr/local/bin:/usr/local/lib/node_modules:$PATH"

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

#
# Override file
#
if [ -f $HOME/.zshrc_custom ]; then
  . $HOME/.zshrc_custom
fi
