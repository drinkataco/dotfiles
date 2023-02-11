# Zsh Usage

This document is to highlight some personalised shell features.

[zgenom](https://github.com/jandamm/zgenom) is used as the plugin manager - and [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/) as the configuration manager.

## Contents

<!-- vim-md-toc format=bullets ignore=^Contents$ -->
* [Overview](#overview)
  * [ohmyzsh](#ohmyzsh)
  * [Searching](#searching)
* [Commands](#commands)
  * [ag](#ag)
  * [bat](#bat)
  * [exa](#exa)
  * [fd](#fd)
  * [gpg](#gpg)
  * [htop](#htop)
  * [zioxide](#zioxide)
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

### ag

[The Silver Searcher](https://github.com/ggreer/the_silver_searcher) is a searching tool similar to `grep`. Simple usage is with the command `ag foo ./bar`

Arguments:

- `--after` / `-A` - print lines after match
- `--before` / `-B` - print lines before match
- `--context` / `-C` - print lines before and after matches
- `--count` / `-c` - print counts of matches from files
- `--file-search-regex` / `-G` - search file names with PATTERN
- `--hidden` - show hiddent files
- `--ignore-case` / `-i` - ignore case of search
- `--ignore` - ignore PATTERN
- `--files-with-matches` / `-l` - only print file names
- `--path-to-ignore` / `-p` - provide path to .ignore file
- file type arguments to limit to certain file types, such as `--shell` and `--ts`

### bat

[Bat](https://github.com/sharkdp/bat) - cat with wings. Syntax highlight, line numbers, git status.

Arguments:

- `--plain` / `-p` - don't show line numbers
- `--show-all` / `-A` - show non-printable characters
- `--line-range N:M` / `-r N:M` - show lines between N and M

### exa

[exa](https://github.com/ogham/exa) is a modern replacement for `ls`

Arguments:

- `--git` - list files git status (with `-l`)
- `--git-ignore` - ignore files in .gitignore
- `--tree` / `-T` - display tree. Use `-L` to limit recursion.

### fd

[fd](https://github.com/sharkdp/fd) is a fast replacement of `find`

Arguments:

- `'^v.*md$'` - search by regular expression, this would be any filename that starts with `v` and ends with `md`
- `--exclude '.git*'` / `-E '.git*'` - exclude files/directory by glob pattern
- `--exec-batch` / `-X` - execute command for all search results
- `--exec` / `-x` - execute command for each search result
- `--hidden` / `-H` - search hidden files/dirs
- `--min-depth` / `--max-depth` / `--exact-depth` - depth options

Example Commands:

- `fd *md -X bat --style=header,grid -r 4:10` - execute bat on each result and show a sample of the file

### gpg

[GnuPG](https://gnupg.org/) - Encrypt and sign data communications. [This tutorial](https://www.devdungeon.com/content/gpg-tutorial) is pretty helpful.


- `gpg --encrypt -r recipient@example.org file.txt` - encrypt a file for recipient
- `gpg --decrypt file.txt.gpg > decrypted.txt` - decrypt file
- `gpg --sign file.txt` - sign a file, but don't encrypt
- `gpg --list-secret-keys --keyid-format=long` - list keys with keyid

### htop

[htop](https://github.com/htop-dev/htop) is an interactive process viewer

Arguments:

- `--filter` / `-F` - filter process by fixed strings
- `-t` - process tree

Commands:

- `?` - help is always near
- `k` - kill process, select what signal
- `l` - display open files (lsof)
- `<` or `>` - sort by

# nnn

[nnn](https://github.com/jarun/nnn) is a terminal file manager. Use `nnn` to start the application.

Commands:

- `?` - help is always near
- `.` - toggle hidden
- `<CR>` - open file in GUI
- `<SPACE>` - select file(s)
- `e` - edit file
- `h` and `l` - step out and in to directory
- `w` - move or copy selected files

Plugins:

- `;d` - open vimdiff with selected files
- `;p` - open tmux preview window
- `;r` - go to git root of directory
- `;n` - bulk new files/dirs via vim mode (new line per entry)
- `;o` - sample file opener
- `;s` - search internals with fzf
- `;v` - open/create vim project with [project](../bin/project) command
- `;z` - jump with zoxide

### zioxide

[zoxide](https://github.com/ajeetdsouza/zoxide) is a smarter `cd` command

Just use `z` to jump around as you would with `cd`. Common directories are learnt and clashes interacted with

Usage:

`z foo` - cd into highest ranked directory matching foo
`z foo bar` - cd into highest ranked directory matching foo and bar
`z foo /` - cd into a subdirectory starting with foo
`z ~/foo` - z also works like a regular cd command
`z foo/` - cd into relative path
`z ..` - cd one level up
`z -` - cd into previous directory
`zi foo` - cd with interactive selection (using fzf)
`z foo<SPACE><TAB>` - show interactive completions
