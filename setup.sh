#!/bin/bash

# .zshrc requires Oh-my-zsh. Let's install it
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Move dotfiles

DEFAULT_DIR='~'

if [ "$1" != "-s" ]; then
    printf "Dotfiles Directory [$DEFAULT_DIR] : "
    read MOVE_DIR
fi

if [ -z "$MOVE_DIR" ]; then
    MOVE_DIR=$DEFAULT_DIR
fi

SCRIPT_NAME=`basename "$0"`

# Move all dot files
cp ./.* $MOVE_DIR