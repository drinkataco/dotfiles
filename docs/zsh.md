# Zsh Usage

This document is to highlight some personalised shell features.

[zgenom](https://github.com/jandamm/zgenom) is used as the plugin manager - and [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/) as the configuration manager.

## Contents

<!-- vim-md-toc format=bullets ignore=^Contents$ -->
* [Overview](#overview)
  * [ohmyzsh](#ohmyzsh)
  * [Command Input](#command-input)
  * [Searching](#searching)
<!-- vim-md-toc END -->

## Overview

Here is a selection of documentation regarding some plugin functionality, etc. It is useful to look at the [list of plugin](./.zsh/plugins.zsh) and reference their documentation.

### ohmyzsh

ohmyzsh includes a bunch of aliases to speed up your workflow.

View the [official cheatsheet](https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet) for these commands, a sample are included here:

- `mkcd` - mkdir and cd
- `1`...`9` - `cd -n`
- `..` * n - `cd ../[...]`

### Command Input

[vi-mode](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode) is enabled to allow you to perform vi commands inline in the shell.

Use `vv` in normal mode (`<Esc>`) to edit in a vim window.

### Searching

FZF is used for searching and completions

- `<C-T>` - Paste the selected files and directories onto the command-line
- `<C-R>` - Paste the selected command from history onto the command-line
- `<M-C>` - cd into the selected directory

