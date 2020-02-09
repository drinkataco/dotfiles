#!/usr/bin/env bash
# Install Homebrew if not already installed
if ! type brew > /dev/null; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    xcode-select --install
fi

# Update and install
echo "Uncasking bundle"
brew update
brew bundle