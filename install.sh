#!/bin/sh
#
# Script to bootstrap dotfiles and configuration.
# I made it extra hard for myself by enforcing POSIX Compliancy
#
BASE_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
DOTFILES_DIR="${BASE_DIR}"
IGNORE_PATTERN="^$(echo "${DOTFILES_DIR}" | sed 's/\//\\\//')\/(README|docs|macos|install\.sh|\.git\/|.*\.DS_STORE|Session\.vim)"

readonly BASE_DIR
readonly DOTFILES_DIR
readonly IGNORE_PATTERN

#
# These are script arguments that can be enabled with flags
#
ARG_DRY_RUN=0 # --dry-run
ARG_FORCE=0 # --force

#########################################
# Helper to determine user input for yes/no questions.
#   Anything beginning with the letter n is a no, 
#   everything else is yes
# Arguments:
#   1 - The user set value to determine whether yes or no
#   2 - The default value if the user didn't set one
# Returns:
#   0 for yes, 1 for no. Inverted values so that the
#     function can be used inline if statments - as the
#     return value is treated as an exit code
#######################################
yes_no() {
  value=$1
  [ -z "$value" ] && value=$2 # Set as default if unset

  case "$value" in
    n*|N*) return 1 ;;
    *) return 0 ;;
  esac
}

#########################################
# Symlinks dotfiles recrusively whilst preserving underling file structures
# This function is a result of trying to keep POSIX compatability
# Globals:
#   None
# Arguments:
#   1 - Directory to search for files from
#   2 - Destination
#   3 - Regex of pattwrns to ignore in symlink
# Returns:
#   None
#######################################
# a=1
smart_symlink() {
  # ignore . and .. markers
  GLOBIGNORE="$1/.:$1/.."

  # We're going to go through each file/dir now and try to symlink
  for file in "${1}"/*; do
    # Check if an ignore pattern exist
    if [ -n "$3" ]; then
      if echo "$file" | grep -oEiq "${3}"; then
        continue
      fi
    fi

    # Globbing gives us annoying patterns. Skip if we get a glob pattern
    if [ "$(basename "$file")" = '*' ]; then
      continue
    elif [ -d "$file" ] && [ ! -f "${file}/sync_dir" ]; then
      # This is a directory, and we should sync each of its files separately and recrusively,
      # UNLESS we have a sync_dir flag, where we'll synchronise every file
      sub_dir=$(echo "$file" | sed "s~$1~~g")
      next_dest="${2}${sub_dir}"

      if [ ! -d "$next_dest" ]; then
        mkdir "$next_dest"
      fi

      smart_symlink "$file" "$next_dest" "$3"
    else
      cmd='ln'

      # Set symlinking arguments
      if [ "$ARG_FORCE" = 1 ]; then
        cmd='ln -fn'
      fi

      if [ "$ARG_DRY_RUN" = 1 ]; then
        cmd="echo $cmd"
      fi

      eval "$cmd" -vs \""$file"\" \""$2\""
    fi
  done
}

#########################################
# Main method to run script and find the bash script it must run
# Globals:
#   DOTFILES_DIR
#   HOME
#   IGNORE_PATTERN
# Arguments:
#   None
#######################################
main() {
  # Set Script Arguments
  if echo "$*" | grep -Eq '.*--dry-run.*'; then
    ARG_DRY_RUN=1
  fi

  if echo "$*" | grep -Eq '.*--force.*'; then
    ARG_FORCE=1
  fi

  smart_symlink "$DOTFILES_DIR" "$HOME" "${IGNORE_PATTERN}"
}

main "${@}"
