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

declare -A P_PARAMETERS # variable overries

# Determine Operating System
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
while getopts "d:v:y" opts; do
  case "${opts}" in
    # auto run flag
    y) P_AUTO=1 ;; # auto run flag

    # copy directory
    d) P_DIR=${OPTARG} ;;

    # Get parameters/values for files
    v)
      # Split into group, then key/value pair
      IFS=',' read -r -a PARAMS <<< ${OPTARG}
      for i in "${!PARAMS[@]}"; do
        PARAM=${PARAMS[$i]}
        P_PARAMETERS["$(cut -d'=' -f1 <<< $PARAM)"]="$(cut -d'=' -f2 <<< $PARAM)"
      done
      ;;
  esac
done
shift $((OPTIND-1))

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

while read line; do
  key="$(cut -d'=' -f1 <<< $line)"
  value="$(cut -d'=' -f2 <<< $line)"
  config[$key]=$value
done < $FILE_config

# We're going to loop over the same array with the updated values, and copy them over
for i in "${!dotfiles[@]}"; do
  dotfile=${dotfiles[$i]}

  # get all replaceables
  declare -a replace

  while read line; do
    if [[ $line =~ (%%([[:alnum:]]\.?)+%%) ]]; then
      name=$(echo "${BASH_REMATCH[0]}" | sed 's/%//g')
      replace=($name "${replace[@]}")
    fi
  done < "$DIR_DOTFILES/$dotfile"

  # now copy this file over
  cp "$DIR_DOTFILES/$dotfile" "$DIR_CP_LOC/$dotfile"

  # if no variables to replace, skip, otherwise set them
  if [ ${#replace[@]} != 0 ]; then
    # grab_value=0

    # ask user for values if none set as argument
    if [[ -z $P_AUTO &&  ${#P_PARAMETERS[@]} = 0 ]]; then
      ask_something "Do you want to use the default config variables for file $dotfile"
      [[ $response = 0 ]] && grab_value=1 || grab_value=0
    fi

    # and then replace the values to be replaced
    for k in "${!replace[@]}"; do
      var_name=${replace[$k]}

      # Use defined parameter if it has been set
      if [[ -n "${P_PARAMETERS[$var_name]}" ]]; then
        value=${P_PARAMETERS[$var_name]}

      # ask for config if user has opted not to use defaults
      elif [[ $grab_value = 1 ]]; then
        printf "Value for variable '$var_name': "
        read value

      # otherwise just use the default valuye
      else
        value=${config[$var_name]}
      fi

      value="${value/"/"/"\/"}" # Escape forward slash

      sed -i "" -e "s/%%$var_name%%/${value}/g" "$DIR_CP_LOC/$dotfile"
    done

    unset 'replace'
  fi
done

echo
echo "Copied dotfiles to $DIR_CP_LOC!"
