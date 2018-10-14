# todo

- check dir_dotfiles exists
- don't ask about variables if none in file, or have been defined in vars (rejig)
- ask for variables if default not used
- support --variables name=value,name2=value for variables
- support --files .tmux.conf,.zshrc to pick what files to process
- support --directory $HOME
- support -y for yes to all
- All files, where available, should have auto overrides/extensions imported
- Install dependencies (and map to file in config/deps?) tpm, vim-plug, antigen etc
- ensure that vim,tpm etc plug loads plugins automagically
- shell/gui specifics are seperated
- Add scripts/install_osx.sh
- Add scripts/install_linux.sh
- - make sure requirements installed (git/zsh)
- Auto call scripts/* if os found?
- Add config/bins.{osx,ubuntu,centos} (or something) so that extended software is supported
- INVESTIGATE: automatically support any dotfile by the file name in dot/files, instead of the FILE_* var we got going on