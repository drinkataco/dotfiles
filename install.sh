#!/usr/bin/env bash

# ___   ___  _____  ____  _   _     ____  __
#| | \ / / \  | |  | |_  | | | |   | |_  ( (`
#|_|_/ \_\_/  |_|  |_|   |_| |_|__ |_|__ _)_)
#

# flags -h (headless)
# -d <> copy location
# -u <username> user name
# --parameters git.email=

# Define Constants
readonly OS_LINUX='linux'
readonly OS_OSX='osx'

#DIR_CP_LOC='~'
DIR_CP_LOC='./ded'
readonly DIR_DOTFILES='./files'

readonly FILE_gitconfig='.gitconfig'
readonly FILE_gitignore='.gitignore'
readonly FILE_tmux='.tmux.conf'
readonly FILE_vimrc='.vimrc'
readonly FILE_zshrc='.zshrc'
readonly FILE_config='variables'

# Determine Operating System
os=''

case `uname` in
  Linux*)  os=$OS_LINUX;;
  Darwin*) os=$OS_OSX;;
  *)       os=`uname`
esac

# Bash version must be at least 4
if (($BASH_VERSINFO < 4)); then
  echo 'Incompatible bash version – must be at least version 4'
  if [ $os == $OS_OSX ]; then
    echo 'You might want to run the setup_osx.sh script in the scripts/ directory'
  fi
  exit
fi

# helper functions
# ask a question, get a boolean (1/0) value
ask_something() {
  printf "$1 [Y/n]? "
  read OPT
  if [[ "${OPT^^}" = "N" ]]; then
    response=0
  else
    response=1
  fi;

  return $response;
}

# Fetch directory to copy files over to
printf "Dotfiles directory [$DIR_CP_LOC]: "
read DIR_CP_LOC_OR
[[ ! -z "$DIR_CP_LOC_OR" ]] && DIR_CP_LOC=$DIR_CP_LOC_OR

# Determine what dotfiles we're going to copy over
declare -A dotfiles=(
  [$FILE_gitconfig]=1
  [$FILE_gitignore]=1
  [$FILE_tmux]=1
  [$FILE_vimrc]=1
  [$FILE_zshrc]=1
)

for i in "${!dotfiles[@]}"; do
  ask_something "Do you want to copy the file $i"
  dotfiles[$i]=$response
done

# load default config
declare -A config

while read -r line; do
  key="$(cut -d'=' -f1 <<< $line)"
  value="$(cut -d'=' -f2 <<< $line)"
  config[$key]=$value
done < $FILE_config

# We're going to loop over the same array with the updated values, and copy them over
for i in "${!dotfiles[@]}"; do
  if [ ${dotfiles[$i]} = 0 ]; then
    continue
  fi
  ask_something "Do you want to use the default config variables for file $i"
  default_config=$response  
 
  # get all replaceables
  declare -a replace

  while read -r line; do
    if [[ $line =~ (%%([[:alnum:]]\.?)+%%) ]]; then
      name=$(echo "${BASH_REMATCH[0]}" | sed 's/%//g')
      replace=($name "${replace[@]}")
    fi
  done < "$DIR_DOTFILES/$i" 

  # now copy this file over
  cp "$DIR_DOTFILES/$i" "$DIR_CP_LOC/$i"

  # and then replace the values
  for j in "${!replace[@]}"; do
    var_name=${replace[$j]}i
    # TODO: ask for value if not default_config
    sed -i -e "s/%%$var_name%%/${config[$var_name]}/g" "$DIR_CP_LOC/$i"
  done

  echo "Copied $i to $DIR_CP_LOC"
done;


echo ${dotfiles}



# step 3: replace variables '%%git.email%%'

# step 4:  copy files to dir (ask for dir)

# step 5: install dependencies (vimplug, oh-my-zsh, tpm, antigen)
