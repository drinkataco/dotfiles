#!/usr/bin/env bash
echo
echo "  _____   ______  ______ ______ __  __      ______  ______    "
echo " /\  __-./\  __ \/\__  _/\  ___/\ \/\ \    /\  ___\/\  ___\   "
echo " \ \ \/\ \ \ \/\ \/_/\ \\\\ \  __\ \ \ \ \___\ \  __\\\\ \___  \  "
echo "  \ \____-\ \_____\ \ \_\\\\ \_\  \ \_\ \_____\ \_____\/\_____\ "
echo "   \/____/ \/_____/  \/_/ \/_/   \/_/\/_____/\/_____/\/_____/ "
echo
echo "Personal collection of dotfiles"
echo "Supported and used with OS X, Ubuntu, and CentOS"
echo

# Define Constants
readonly OS_LINUX='linux'
readonly OS_OSX='osx'

DIR_CP_LOC=$HOME
readonly DIR_DOTFILES='./dotfiles'
readonly FILE_config='./config/variables'

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

# Get arguments
while getopts d:y opts; do
   case ${opts} in
      d) P_DIR=${OPTARG} ;; # copy directory
      y) P_AUTO=1 ;; # auto run flag
   esac
done

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
# Ask if not auto install or not fed as oparameter
if [[ -z $P_AUTO && -z $P_DIR ]]; then
  printf "Dotfiles directory [$DIR_CP_LOC]: "
  read DIR_CP_LOC_OR
  [[ ! -z "$DIR_CP_LOC_OR" ]] && DIR_CP_LOC=$DIR_CP_LOC_OR
# use parameter value if set
elif [[ ! -z $P_DIR ]]; then
  DIR_CP_LOC=$P_DIR
fi

echo "Copying files to $DIR_CP_LOC directory"

# create dotfile dir if not exist
if [[ ! -d $DIR_CP_LOC ]]; then
  mkdir -p $DIR_CP_LOC
fi

# Determine what dotfiles we're going to copy over
declare -a dotfiles;

# get all dotfiles
while read line; do
  if [[ $line != '.' && $line != '..' ]]; then
    dotfiles=($line "${dotfiles[@]}")
  fi
done < <(ls -a1 $DIR_DOTFILES)

# unset the ones we don't want
for i in "${!dotfiles[@]}"; do
  dotfile=${dotfiles[$i]}

  if [[ -z $P_AUTO ]]; then
    ask_something "Do you want to copy the file $dotfile"

    if [[ $response = 0 ]]; then
      unset "dotfiles[$i]"
    fi
  else
    echo "Copying file $dotfile"
  fi
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
  dotfile=${dotfiles[$i]}

  # get all replaceables
  declare -a replace

  while read -r line; do
    if [[ $line =~ (%%([[:alnum:]]\.?)+%%) ]]; then
      name=$(echo "${BASH_REMATCH[0]}" | sed 's/%//g')
      replace=($name "${replace[@]}")
    fi
  done < "$DIR_DOTFILES/$dotfile"

  # now copy this file over
  cp "$DIR_DOTFILES/$dotfile" "$DIR_CP_LOC/$dotfile"
  # echo "cp \"$DIR_DOTFILES/$dotfile\" \"$DIR_CP_LOC/$dotfile\""

  # if no variables to replace, skip, otherwise set them
  if [ ${#replace[@]} != 0 ]; then
    if [[ -z $P_AUTO ]]; then
      ask_something "Do you want to use the default config variables for file $dotfile"

      default_config=$response
    else
      default_config=1
    fi

    # and then replace the values
    for j in "${!replace[@]}"; do
      var_name=${replace[$j]}
      sed -i -e "s/%%$var_name%%/${config[$var_name]}/g" "$DIR_CP_LOC/$dotfile"
    done

    unset 'replace'
  fi
done

echo
echo "Copied dotfiles to $DIR_CP_LOC!"
