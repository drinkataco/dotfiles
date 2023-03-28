#!/bin/zsh

##########################
# AUTOCOMPLETE           #
##########################
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit && compinit # zsh-completions reload

# Kubernetes Completions
[[ $commands[kubectl] || $commands[k] ]] && source <(kubectl completion zsh)

# AWS Completions
complete -C "$(brew --prefix)/bin/aws_completer" aws

# Python PIP completions
eval "`pip3 completion --zsh`"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --no-ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'exa -T -L 4 --group-directories-first {}'"

# Completion Styles
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:complete:bat:*' fzf-preview '[ -f $realpath ] && cat $realpath || stat $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview '[ -f $realpath ] && cat $realpath || stat $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'stat $realpath'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

bindkey "ç" fzf-cd-widget
