#!/bin/zsh

# Ruby / RVM
if [ -f "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
else
  echo 'RVM not installed. See https://get.rvm.io'
fi

# rust cargo env
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
