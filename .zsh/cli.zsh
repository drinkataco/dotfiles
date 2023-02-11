#!/bin/zsh

##########################
# CLI Config             #
##########################
# gpg
export GPG_TTY=$(tty)

# nnn
source "${HOME}/.config/nnn/config"

# zoxide
eval "$(zoxide init zsh)"
