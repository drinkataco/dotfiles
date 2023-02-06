# Zsh Usage

This document is to highlight some personalised shell features.

[zgenom](https://github.com/jandamm/zgenom) is used as the plugin manager - and [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/) as the configuration manager.

## Contents

<!-- vim-md-toc format=bullets ignore=^Contents$ -->
* [Overview](#overview)
  * [ohmyzsh](#ohmyzsh)
  * [Searching](#searching)
* [Commands](#commands)
  * [bat](#bat)
  * [exa](#exa)
  * [fd](#fd)
* [gpg](#gpg)
<!-- vim-md-toc END -->

## Overview

Here is a selection of documentation regarding some plugin functionality, etc. It is useful to look at the [list of plugin](./.zsh/plugins.zsh) and reference their documentation.

### ohmyzsh

ohmyzsh includes a bunch of aliases to speed up your workflow.

View the [official cheatsheet](https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet) for these commands, a sample are included here:

- `mkcd` - mkdir and cd
- `1`...`9` - `cd -n`
- `..` * n - `cd ../[...]`

### Searching

FZF is used for searching and completions

- `<C-T>` - Paste the selected files and directories onto the command-line
- `<C-R>` - Paste the selected command from history onto the command-line
- `<M-C>` - cd into the selected directory

## Commands

Some non-standard packages are included to improve standard tasks within the CLI when using the terminal

[vi-mode](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode) is enabled to allow you to perform vi commands inline in the shell.

Use `vv` in normal mode (`<Esc>`) to edit in a vim window.

### bat

[Bat](https://github.com/sharkdp/bat) - cat with wings. Syntax highlight, line numbers, git status.

Arguments:

- `--plain` / `-p` - don't show line numbers
- `--show-all` / `-A` - show non-printable characters
- `--line-range N:M` / `-r N:M` - show lines between N and M

### exa

[exa](https://github.com/ogham/exa) is a modern replacement for ls

Arguments:

- `--git` - list files git status (with `-l`)
- `--git-ignore` - ignore files in .gitignore
- `--tree` / `-T` - display tree. Use `-L` to limit recursion.

### fd

[fd](https://github.com/sharkdp/fd) is a fast replacement of find.

Arguments:

- `'^v.*md$'` - search by regular expression, this would be any filename that starts with `v` and ends with `md`
- `--exclude` / `-E` - exclude glob pattern
- `--hidden` / `-H` - search hidden files/dirs
- `--min-depth` / `--max-depth` / `--exact-depth` - depth options
- `--exclude '.git*'` / `-E '.git*'` - exclude files/directory by glob pattern
- `--exec` / `-x` - execute command for each search result
- `--exec-batch` / `-X` - execute command for all search results

Example Commands:

- `fd *md -X bat --style=header,grid -r 4:10` - execute bat on each result and show a sample of the file

## gpg

[GnuPG](https://gnupg.org/) - Encrypt and sign data communications. [This tutorial](https://www.devdungeon.com/content/gpg-tutorial) is pretty helpful.


- `gpg --encrypt -r recipient@example.org file.txt` - encrypt a file for recipient
- `gpg --decrypt file.txt.gpg > decrypted.txt` - decrypt file
- `gpg --sign file.txt` - sign a file, but don't encrypt
