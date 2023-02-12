# Git Usage

This document is to highlight some common usage patterns with git, and any workflows related to version control

Useful links:

- [Git SCM Docs](https://git-scm.com/docs)
- [OMZ Git plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)

## Contents

<!-- vim-md-toc format=bullets ignore=^Contents$ -->
* [General Usage](#general-usage)
  * [log](#log)
  * [rebase](#rebase)
  * [bisect](#bisect)
* [Workflow](#workflow)
  * [delta](#delta)
  * [github cli](#github-cli)
  * [lazygit](#lazygit)
  * [vimdiff](#vimdiff)
<!-- vim-md-toc END -->

## General Usage

Here are some useful commands which are used in my workflow a fair bit. The alias provided with the [git](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh) plugin for omz are included afterwards.

For all git aliases provided by the omz plugin, [refer here](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git).

Some general aliases:

- `gcam` / `git commit --all --message` - commit all with message
- `gl` / `git pull` - pull from remote
- `gapa` / `git add --patch` - patch add
- `gp` / `git push` - push to remote
- `grbi` / `git rebase --interactive` - start interactive rebase

### log

Some nice aliases for git logs are included by the omz git plugin. These are the ones I use most:

- `glo` / `git log --oneline --decorate` - show log as oneline (good)
- `glg` / `git log --stat` -
- `glgg` / `git log --graph` -
- `glog` / `git log --online --decorate --graph` - oneline and graph
- `glo` / `git log --oneline --decorate`
- `glol` - log with graph, pretty print with author and oneline. `glols` to include stat too. Use `glod` for a timestamp, and `glods` for a date

Some git log arguments:

- `--stat` - show file change statistics
- `--oneline` - display as one line
- `--patch` - show change patch
- `--graph` - show branch graph
- `--date=<fmt>` - date format

### rebase

Reapply commits on top of a base. [Read more](https://git-scm.com/docs/git-rebase)

- `git rebase -i <base>` / `grbi` - interactive rebase. Use `--root` as base if on root.
- `git rebase --onto <new base> <old base> <branch name>` / `gro` - change base branch

### bisect

Find the commit that caused a bug using a binary search between two commits. [Read more](https://git-scm.com/docs/git-bisect)

- `git bisect start` / `gbss` - Start bisect
- `git bisect good|bad <hash>` - Mark as good (`gbsg`) and bad (`gbsb`). Start by setting with hashes for range, and then
- `git bisect view` - view the current commit
- `git bisect reset` / `gbsr` - end bisect

## Workflow

### delta

[git-delta](https://github.com/dandavison/delta) is used for displaying diffs using a Levenshtein edit inference algorithm

### github cli

I use [github](https://github.com) far more than any other host for my git repos. So might as well use the [cli](https://github.com/cli/cli) where necessary.

The main command is `gh`. Here's an overview of some commands.

Commands:

- `gh repo view` - view repo in the web
- `gh pr view` - view pr in web
- `gh workflow view` view workflow

Arguments:

- `-w` - open view command in web

### lazygit

[lazygit](https://github.com/jesseduffield/lazygit) is a terminal ui for git.

It can be launched in a git repo with `lazygit`, or the alias `lg`. From within vim, you can use the key binding `<leader>gx` to open in a vim tab (remember to use `<C-w>` in this tab before any git command).

Usage:

- `?` - help is never too far. Lazygit is powerful, this sample is too small.
- `<C-c>` or `<C-q>` - quit. Remapped from `q`
- `h`, `l` - navigate panels
- `1`..`5` - navigate panels by number
- `[` / `]` - navigate panel tabs
- `p` - pull
- `P` - push
- `R` - refresh
- `m` - current rebase options
- File Panel (Panel 2):
  - `<CR>` - enter file to patch, `<space>` to add lines, `<tab>` to go between staged/unstaged panels
  - `<space>` - stage/unstage file
  - `e` - edit file in vim
  - `C` / `c` - commit with editor / commit one line
  - `A` - amend last commit
- Branches Panel (Panel 3):
  - `<space>` - checkout
  - `n` - new branch
  - `o` - create pull request
  - `r` - rebase
- Log Panel (Panel 4)
  - `<C-o>` - copy commit SHA
  - `s` - squash down
  - `f` - fixup commit

### vimdiff

Vimdiff can be used for resolving conflicts

[Personal document found here.](./vim.usage.md#vimdiff)
