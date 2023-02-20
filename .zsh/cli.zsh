#!/bin/zsh

##########################
# CLI Tools Config       #
##########################
# AWS cli
export AWS_PAGER="$PAGER"

# github cli
export GH_PAGER="$PAGER"

# gpg
export GPG_TTY=$(tty)

# nnn
source "${HOME}/.config/nnn/config"

# zoxide
eval "$(zoxide init zsh)"
