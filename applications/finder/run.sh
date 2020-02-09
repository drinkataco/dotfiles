#!/usr/bin/env bash
## Dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set properties to {dark mode:true, appearance:graphite}'

# Dock preferences
osascript -e 'tell application "System Events" to tell dock preferences to set properties to {screen autohide:true}'

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show the ~/Library folder
chflags nohidden ~/Library
