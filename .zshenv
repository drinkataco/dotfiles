#!/bin/zsh

# CONFIG
export EDITOR='vim'
export PAGER='less -X -S'
export TERM='xterm-256color'

# Android Studio
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

# node
export NVM_DIR='/opt/homebrew/opt/nvm'

# webOS CLI
# See: https://webostv.developer.lge.com/develop/tools/cli-installation
export LG_WEBOS_TV_SDK_HOME="$HOME/bin/webOS_TV_SDK"

if [[ -d "$LG_WEBOS_TV_SDK_HOME/CLI/bin" ]]; then
  # Setting the WEBOS_CLI_TV variable to the bin directory of CLI
  export WEBOS_CLI_TV="$LG_WEBOS_TV_SDK_HOME/CLI/bin"
  # Adding the bin directory of CLI to the PATH variable
  export PATH="$PATH:$WEBOS_CLI_TV"
fi

# XDG Support
export XDG_CONFIG_HOME="$HOME/.config"
