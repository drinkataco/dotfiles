# dotfiles

A collection of my dotfiles with an easy installer to get your environment up to speed quickly.

Supported:

- macOS
- Linux (Ubuntu and CentOS tested)

### Installation
Just run install.sh with bash 4 and fill out the questions to copy the files.

Certain dotfiles have variables nested within them which are likely differ between environments. Adjust the values in config/variables before you run install.sh to set them.

### Usage

- `-y` flag to auto run with 'yes', unless other flag specifically overrides that value
- `-d directory` flag and value to specify directory to copy dotfiles to

### Warning
At the moment, no checks are done for dependencies on any system.
These dotfiles assume you have the following packages/frameworks installed on your system:

- [TPM](https://github.com/tmux-plugins/tpm)
- [Vim Plug](https://github.com/junegunn/vim-plug)
- [Antigen](https://github.com/zsh-users/antigen)
- git

Some extended features will need vim compiled with ruby, python and pygmatize, and vim-instant-markdown nodejs files.