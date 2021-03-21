#!/bin/sh
BASE_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
DOTFILES_DIR="${BASE_DIR}/dotfiles"
SCRIPTS_DIR="${BASE_DIR}/scripts"
readonly BASE_DIR
readonly DOTFILES_DIR
readonly SCRIPTS_DIR

#########################################
# Helper to determine user input for yes/no questions.
#   Anything beginning with the letter n is a no, 
#   everything else is yes
# Arguments:
#   1 - The user set value to determine whether yes or no
#   2 - The default value if the user didn't set one
# Returns:
#   0 for yes, 1 for no. Inverted values so that the
#     function can be used inline if statments
#######################################
yes_no() {
  value=$1 
  [ -z $value ] && value=$2 # Set as default if unset

  case "$value" in
    n*|N*) return 1 ;;
    *) return 0 ;;
  esac
}

#########################################
# Symlinks dotfiles 
# Globals:
#  DOTFILES_DIR
# Arguments:
#   None
# Returns:
#   None
#######################################
link_dotfiles() {
  find "${DOTFILES_DIR}" -maxdepth 1 -mindepth 1 | while read -r file; do
    ln -v -s "$file" "$HOME"
  done
}

#########################################
# Main method to run script and find the bash script it must run
# Globals:
#   BASE_DIR
#   SCRIPTS_DIR
# Arguments:
#   NONE
#######################################
main() {
  # Check parameters for operations
  read -p 'Do you want to symlink all dotfiles? [Y/n] ' symlink_dotfiles
  if yes_no "$symlink_dotfiles" 'Y'; then
    link_dotfiles
  fi

  read -p 'Do you want to boostrap your machine? [y/N] ' bootstrap_machine

  if ! yes_no "$bootstrap_machine" 'N'; then
    exit 0
  fi

  case $(uname -s) in
    Darwin*)
      "${SCRIPTS_DIR}/macos.sh"
    ;;
    Linux*)
      "${SCRIPTS_DIR}/linux.sh"
    ;;
    *)
      echo "Unknown System: ${machine}"
      echo 'Your system might not be properly supported'
      exit 1
    ;;
  esac
}

main "${@}"
