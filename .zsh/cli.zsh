#!/bin/zsh

##########################
# CLI Tools Config       #
##########################
# github cli
export GH_PAGER='less -X -S'

# gpg
export GPG_TTY=$(tty)

# nnn
source "${HOME}/.config/nnn/config"

# zoxide
eval "$(zoxide init zsh)"
