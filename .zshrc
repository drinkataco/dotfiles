#!/bin/zsh
# Interactive History
HISTFILE="${HOME}/.zsh_history/log"
HISTSIZE='10000';

# Source config
source "${HOME}/.zsh/plugins.zsh"
source "${HOME}/.zsh/theme.zsh"
source "${HOME}/.zsh/path.zsh"
source "${HOME}/.zsh/cli.zsh"
source "${HOME}/.zsh/completions.zsh"
source "${HOME}/.zsh/alias.zsh"
