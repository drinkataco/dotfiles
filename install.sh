#!/bin/sh
BASE_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
DOTFILES_DIR="${BASE_DIR}/dotfiles"
readonly BASE_DIR
readonly DOTFILES_DIR

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
    echo ln -s "$file" "$HOME"
  done
}

#########################################
# Main method to run script and find the bash script it must run
# Globals:
#   BASE_DIR
#   SCRIPTS_DIR
# Arguments:
#   ...args - consult readme
#######################################
main() {
  # Get system type
  readonly machine=$(uname -s)

  case "${machine}" in
    Darwin*)
      type=macos
    ;;
    Linux*)
      type=linux
      # TODO: check distro
    ;;
    *)
      echo "Unknown System: ${machine}"
      exit 1
    ;;
  esac

  # Check parameters for operations
  link_dotfiles
}

main "${@}"
