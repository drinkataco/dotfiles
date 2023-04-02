#!/bin/zsh

##########################
# PATH                   #
##########################
BREW_PREFIX=$(brew --prefix)

# Default
PATH="$HOME/scripts:/usr/local/bin:$PATH"

#
# Android Studio
#
PATH="$PATH:${ANDROID_SDK_ROOT}/emulator"
PATH="$PATH:${ANDROID_SDK_ROOT}/platform-tools"

#
# Brew Binaries
#
PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# GNU Packages
PATH="${BREW_PREFIX}/Cellar/libtool/2.4.7/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/coreutils/9.1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-indent/2.2.12_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-tar/1.34_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/grep/3.8_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-sed/4.9/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gawk/5.2.1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/findutils/4.9.0/libexec/gnubin:$PATH"

# Open JDK
PATH="${BREW_PREFIX}/openjdk/bin:$PATH"
