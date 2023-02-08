#!/bin/zsh

##########################
# PLUGINS                #
##########################
if [[ ! -f "${HOME}/.zgenom/zgenom.zsh" ]]; then
  echo -e "\033[0;32mInstalling Zgenom\033[0m"
  git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

#
# Plugin Settings
#
# omz/nvm
zstyle ':omz:plugins:nvm' lazy-cmd vim serverless sls typescript

# Source Plugins
source "${HOME}/.zgenom/zgenom.zsh"
zgenom autoupdate

#
# Define Plugin List for Shell
#
if ! zgenom saved; then
  # ohmyzsh
  zgenom ohmyzsh
  zgenom ohmyzsh themes/lukerandall
  zgenom ohmyzsh plugins/vi-mode
  zgenom ohmyzsh plugins/colored-man-pages
  zgenom ohmyzsh plugins/docker
  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh plugins/npm
  zgenom ohmyzsh plugins/nvm
  zgenom ohmyzsh plugins/fzf
  zgenom ohmyzsh plugins/macos

  # plugins
  zgenom load Aloxaf/fzf-tab
  zgenom load chriskempson/base16-shell
  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-syntax-highlighting

  # generate the init script from plugins above
  zgenom save
fi

#
# Scripts and such
#
# nnn
source "${HOME}/.config/nnn/config"

# zoxide
eval "$(zoxide init zsh)"
