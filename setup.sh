#!/bin/sh

# .zshrc requires Oh-my-zsh. Let's install it. This will gracefully fail if already exists
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Move dotfiles
DEFAULT_DIR='~'

# if not silent mode, ask for directory
if [ "$1" != "-s" ]; then
    printf "Dotfiles Directory [$DEFAULT_DIR] : "
    read MOVE_DIR

# otherwise, it is silent, try and get argument
elif [ ! -z "$2" ]; then
    MOVE_DIR=$2
fi

# Set default dir if none set
if [ -z "$MOVE_DIR" ]; then
    MOVE_DIR=$DEFAULT_DIR
fi

# Move all dot files
sh -c "cp ./.{git{ignore,config},{vim,zsh}rc} $MOVE_DIR"
