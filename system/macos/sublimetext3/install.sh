#!/bin/bash

DIR=$(cd -- "$(dirname -- "$(readlink "$0" || echo "$0")")" && pwd)

declare -r DIR
declare -r USER_HOME="${HOME}"
declare -r ST_CONFIG="${USER_HOME}/Library/Application Support/Sublime Text 3/Packages"
declare -r ST_CONFIG_USER="${ST_CONFIG}/User"
declare -r REPO_CONFIG_USER="${DIR}/User"

echo "Linking User Configuration Files for Sublime Text 3"

if [[ -L "${ST_CONFIG_USER}" ]]; then
  symlink_location=$(readlink -f "${ST_CONFIG_USER}")
  echo "Symbolic link already exists for '${ST_CONFIG_USER}' to '${symlink_location}. Aborting." 1>&2 
  exit 1
fi

# First let's ensure that all contents of user are moved over before symlinking
cp -rvn "$ST_CONFIG_USER"/* "${REPO_CONFIG_USER}"

# Now we'll actually symlink upwards
rm -r "${ST_CONFIG_USER}"
ln -v -s "$REPO_CONFIG_USER" "$ST_CONFIG"
