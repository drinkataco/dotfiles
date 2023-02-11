# dotfiles

[![Vint](https://github.com/drinkataco/dotfiles/workflows/Vint/badge.svg)](https://github.com/drinkataco/dotfiles/actions?workflow=Vint)
[![Shellcheck](https://github.com/drinkataco/dotfiles/workflows/Shellcheck/badge.svg)](https://github.com/drinkataco/dotfiles/actions?workflow=Shellcheck)

This is my swiss army knife. It contains my dotfiles for my day-to-day, as well as some application configuration and general scripts used here and there often.

My main workspace is vim inside tmux with zsh shell, using [alacritty](https://github.com/alacritty/alacritty) as the terminal emulator.

<!-- vim-md-toc format=bullets ignore=^TODO$ -->
* [Installation](#installation)
* [Tools](#tools)
  * [vim](#vim)
  * [tmux](#tmux)
  * [zsh](#zsh)
  * [git](#git)
<!-- vim-md-toc END -->

## Installation

All files can be symlinked (with subdirectories taking a merge strategy) with the POSIX compliant `./install.sh` script.

## Tools

### vim

With thanks to [coc.nvim](https://github.com/neoclide/coc.nvim) as the language server, and plugins such as [fzf.vim](https://github.com/junegunn/fzf.vim) for searching, and [vim-fugitive](https://github.com/tpope/vim-fugitive) for git workflows, and [vim-spector](https://github.com/puremourning/vimspector) for debugging, among several others.

* docs/
  * [vim.usage.md](./docs/vim.usage.md)
  * [vim.plugins.md](./docs/vim.plugins.md)

### tmux

Tmux is used with the key of being easily operable with vim, minimal customisations, and easy command discovery. It uses plugins such as [continuum](https://github.com/tmux-plugins/tmux-continuum) to easily save/restore sessions, [copycat](https://github.com/tmux-plugins/tmux-copycat) and [thumbs](https://github.com/fcsonline/tmux-thumbs) for nice copy/paste support, and [tmux-menu](https://github.com/jaclu/tmux-menus) for easy command discovery.

* docs/
  * [tmux.md](./docs/tmux.md)

### zsh

ZSH is the shell of choice, with a focus on fuzzy searched completions, vi mode for input, and speed of shell starting.  [zgenom](https://github.com/jandamm/zgenom) is used as the plugin manager - and [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/) as the configuration manager.

The documents highlight some useful commands and cli tools used throughout my workflow; such as [zoxide](https://github.com/ajeetdsouza/zoxide), [nnn](https://github.com/jarun/nnn), [fd](https://github.com/sharkdp/fd), and [ag](https://github.com/ggreer/the_silver_searcher).

* docs/
  * [zsh.md](./docs/zsh.md)

### git

Git is wonderful version control. Using [lazygit](https://github.com/jesseduffield/lazygit) as a terminal ui, [delta](https://github.com/dandavison/delta) for diffs, and [vim-fugitive](https://github.com/tpope/vim-fugitive) with vim - but focusing on the power of the command line interface throughout my workflow.

* docs/
    * [git.md](./docs/git.md)

