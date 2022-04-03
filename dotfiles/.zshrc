#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#
# 
# OMZ Config and Plugins
#
DISABLE_AUTO_TITLE='true'
ENABLE_CORRECTION='true'
ZSH_THEME='lukerandall'
NVM_HOMEBREW="$(brew --prefix nvm)"
NVM_AUTOLOAD=1

plugins=(
  aws
  colored-man-pages
  docker
  git
  kubectl
  nvm
  macos
  vi-mode
  zsh-completions
  fzf-tab
)

#
# A lil sorta plugin manager just to tell my devices i might wanna install these
#
function add_plugin {
  local plugin_name="${1}"
  local plugin_repo="${2}"
  local plugin_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/${plugin_name}"

  if [[ ! -d "${plugin_dir}/" ]]; then
    echo "\033[0;31mZSH Plugin ${plugin_name} not found. Install it with the following command and reload your shell\033[0m"
    echo "  git clone ${plugin_repo} ${plugin_dir}"
  fi
}

add_plugin 'zsh-completions' 'https://github.com/zsh-users/zsh-completions' 
add_plugin 'fzf-tab' 'https://github.com/Aloxaf/fzf-tab'

unfunction add_plugin # the scope is shortlived 

source $ZSH/oh-my-zsh.sh

# AUTOCOMPLETIONS
autoload -U compinit && compinit # zsh-completions reload
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'stat $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview '[ -f $realpath ] && cat $realpath || stat $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview '[ -f $realpath ] && cat $realpath || stat $realpath'
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup # upgrade tmux to 3.2 

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
alias v='vim .'

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

# JS
source "$HOME/.nvm/nvm.sh"

# AWS
export AWS_PAGER="less -F -X"

# fzf
# info: https://medium.com/better-programming/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh || $(brew --prefix)/opt/fzf/install
alias fzfp="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# kubernetes
[[ $commands[kubectl] || $commands[k] ]] && source <(kubectl completion zsh)
kctx() {
  (
    cd ~/.kube/ || exit 1
    config_files=$(ls *.config)
    lines=$(echo "$config_files" | wc -l)
    KUBE=$(echo "$config_files" | fzf --height="${lines}" --reverse)
    if [[ -n "$KUBE" ]]; then
      ln -sf "$KUBE" config
      echo -e '\033[0;32mKubectl Config Changed\033[0m';
      kubectl get nodes
    fi
  )
}

# tmux
tmux_start() {
  tmux_sessions=$(tmux ls)
  if [[ -n "${tmux_sessions}" ]]; then
    lines=$(echo "$tmux_sessions" | wc -l)
    tmux_session=$(echo "$tmux_sessions" | fzf --height="${lines}" --reverse)
    tmux_session="${tmux_session%%:*}"
    tmux attach -t "${tmux_session:-default}"
  else
    tmux new -s ${tmux_session:-default}
  fi
}

# GNU Utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#
# Override file
#
if [ -f $HOME/.zshrc_custom ]; then
  . $HOME/.zshrc_custom
fi

