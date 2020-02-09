# dotfiles
This repository includes a list of common dotfiles used on my workspaces.

In relation to the dotfiles, a bundling script is included that supports:
- Building dotfiles (using envsubst)
- Bootstrapping systems for usage

Bootstrapping is done using POSIX-compliant scripts – in case bash 5> isn't installed (as is the default with macos).

## TODO:
1. entrypoint must be POSIX to bootstrap first if requried
2. add readme
