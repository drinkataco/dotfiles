##########################
# PATH                   #
##########################
PATH="$HOME/bin:/usr/local/bin:$PATH"

#
# Brew Binaries
#
BREW_PREFIX=$(brew --prefix)

# GNU Packages
PATH="${BREW_PREFIX}/Cellar/libtool/2.4.7/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/coreutils/9.1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-indent/2.2.12_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-tar/1.34_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/grep/3.8_1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gnu-sed/4.9/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/gawk/5.2.1/libexec/gnubin:$PATH"
PATH="${BREW_PREFIX}/Cellar/findutils/4.9.0/libexec/gnubin:$PATH"