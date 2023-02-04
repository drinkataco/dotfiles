#!/bin/zsh

##########################
# AUTOCOMPLETE           #
##########################
autoload -U compinit && compinit # zsh-completions reload
[[ $commands[kubectl] || $commands[k] ]] && source <(kubectl completion zsh)

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Completion Styles
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:bat:*' fzf-preview '[ -f $realpath ] && cat $realpath || stat $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview '[ -f $realpath ] && cat $realpath || stat $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'stat $realpath'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

bindkey "ç" fzf-cd-widget
