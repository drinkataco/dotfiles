#!/usr/bin/env bash
declare -r BASE_DIR '..'

#########################################
# Overwrite files with environment variable substitions where set
# These specifc environment variables must be in the format DF_*
# Globals:
#   None
# Arguments:
#   1 - source of files to build
#   2 - destination to place files
# Returns:
#   None
#######################################
function env_and_move() {
  local source=$1
  local dest=$2

  # Apply environment substitutions
  while read -r file; do
    local destination_file="$dest/${file##*/}"
    echo "Applying environment variables to file ${destination_file} at ${dest}"

    # Only substitue variables beginning with $N_*
    # shellcheck disable=SC2016,SC2086
    sub_rule=$(printf '${%s} ' ${!DF_*})
    new_file=$(envsubst "${sub_rule}" < "${file}")

    # TODO: check file doesn't already exist, but overwrite if --force
    echo "${new_file}" > "$destination_file"
  done < <(find "${source}" -type f)
}

#########################################
# Main entrypoint to copy dot files and substitue environment variables
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
function main() {
  local dotfiles="${BASE_DIR}/dotfiles"
  local destination="${BASE_DIR}/dest" #TODO allow to be configurable

  # Source environment variables
  # shellcheck source='../.env.template'
  source "${BASE_DIR}/.env.template"

  if [[ -f "${BASE_DIR}/.env" ]]; then
    # shellcheck source='../.env'
    source "${BASE_DIR}/.env"
  fi

  mkdir -p "${destination}"
  env_and_move "${dotfiles}" "${destination}"
}

if [[ "$*" != *'--source-only'* ]]; then
  main "$@"
fi
