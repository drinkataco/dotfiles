#!/bin/bash
DIR=$(cd -- "$(dirname -- "$(readlink "$0" || echo "$0")")" && pwd)

declare -r DIR
declare -r USER_HOME="${HOME}"
declare -r ST_CONFIG="${USER_HOME}/Library/Application Support/Sublime Text"
declare -r ST_CONFIG_USER="${ST_CONFIG}/User"
declare -r REPO_CONFIG_USER="${DIR}/User"

echo "Linking User Configuration Files for Sublime Text"

# todo: check if already symlinked
if [[ -L "${ST_CONFIG_USER}" ]]; then
  symlink_location=$(readlink -f "${ST_CONFIG_USER}")
  echo "Symbolic link already exists for '${ST_CONFIG_USER}' to '${symlink_location}. Aborting." 1>&2 
  # exit 1
fi

exit 0

# Now we'll actually symlink upwards (and backup old config)
cp -r "${ST_CONFIG_USER}" "${ST_CONFIG_USER}-old"
rm -r "${ST_CONFIG_USER}"
ln -v -s "$REPO_CONFIG_USER" "$ST_CONFIG"
