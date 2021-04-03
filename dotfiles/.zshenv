#!/bin/zsh

# Node / NVM
export PATH="/usr/local/lib/node_modules:$PATH"
export NVM_DIR="$HOME/.nvm"
[ ! -d "$NVM_DIR" ] && mkdir "$NVM_DIR"
if command -v brew &> /dev/null; then
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi

# Ruby / RVM
if [ -f "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
else
  echo 'RVM not installed. See https://get.rvm.io'
fi

# rust cargo env
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
