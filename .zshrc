#!/bin/zsh

##########################
# OHMYZSH                #
##########################
export ZSH=$HOME/.oh-my-zsh

# Options
unsetopt correct_all
DISABLE_AUTO_TITLE='true'
ENABLE_CORRECTION='false'
ZSH_THEME='lukerandall'
NVM_HOMEBREW="$(brew --prefix nvm)"
NVM_AUTOLOAD=1

# OMZ plugins
plugins=(
  # aws
  # colored-man-pages
  # docker
  git
  # kubectl
  npm
  nvm
  # macos
  # vi-mode
  # zsh-completions
  fzf
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

#
# A lil sorta plugin manager just to tell my devices i might wanna install these
#
# function add_plugin {
  # local plugin_name="${1}"
  # local plugin_repo="${2}"
  # local plugin_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/${plugin_name}"

  # if [[ ! -d "${plugin_dir}/" ]]; then
    # echo "\033[0;31mZSH Plugin ${plugin_name} not found. Install it with the following command and reload your shell\033[0m"
    # echo "  git clone ${plugin_repo} ${plugin_dir}"
  # fi
# }

# add_plugin 'zsh-completions' 'https://github.com/zsh-users/zsh-completions' 
# add_plugin 'fzf-tab' 'https://github.com/Aloxaf/fzf-tab'

# unfunction add_plugin # the scope is shortlived 



# EDITOR
export EDITOR='vim'

# colours
export TERM='xterm-256color'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

base16_tomorrow-night
export BASE16_VIM=oceanicnext

#
# ALIAS
#
# alias g='git'
# alias d='docker'
# alias k='kubectl'
# alias t='tmux'
# alias tat='t a -t'
# alias tks= 't kill-session -t'
# alias v='vim '

# # I always forget which sublime command I use
# alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
# alias smerge='/Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge'
# alias subl='sublime'
# alias sbl='sublime'

# # goodies
# alias please='eval "sudo $(fc -ln -1)"'
# alias weather='curl wttr.in/birmingham'

#
# ENVIRONMENT paths and autocompletes
#


# AWS
export AWS_PAGER="less -F -X"

# JS
# nvm use default > /dev/null

# fzf
# AUTOCOMPLETIONS
autoload -U compinit && compinit # zsh-completions reload

# info: https://medium.com/better-programming/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d
# [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh || $(brew --prefix)/opt/fzf/install
# alias fzfp="fzf --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Completion Styles
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'stat $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview '[ -f $realpath ] && cat $realpath || stat $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview '[ -f $realpath ] && cat $realpath || stat $realpath'
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup # upgrade tmux to 3.2 
bindkey "ç" fzf-cd-widget

# kubernetes
# [[ $commands[kubectl] || $commands[k] ]] && source <(kubectl completion zsh)
# kctx() {
  # (
    # cd ~/.kube/ || exit 1
    # config_files=$(ls *.config)
    # lines=$(echo "$config_files" | wc -l)
    # KUBE=$(echo "$config_files" | fzf --height="${lines}" --reverse)
    # if [[ -n "$KUBE" ]]; then
      # ln -sf "$KUBE" config
      # echo -e '\033[0;32mKubectl Config Changed\033[0m';
      # kubectl get nodes
    # fi
  # )
# }

##########################
# PATH                   #
##########################
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Brew GNU BIN Package Utils
BREW_PREFIX=$(brew --prefix)
PATH="${BREW_PREFIX}/Cellar/libtool/2.4.7/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/coreutils/9.1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-indent/2.2.12_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-tar/1.34_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/grep/3.8_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-sed/4.9/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gawk/5.2.1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/findutils/4.9.0/libexec/gnubin:$PATH"

