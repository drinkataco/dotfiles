# Vim Plugins

This document aims to highlight the plugins used by my git installation and any short cuts or workflows that supplement them.

[TOC]

## Core Features

### File browsing

**Description**

netrw. Nobody needs nerd tree!

#### Keymaps

* `<leader>kb` - [TODO] Open up netrw in split as sidebar
* `<leader>ko` - Open file with sublime text
* `<leader>ks` - Open netrw in horizontal split
* `<leader>kt` - Open netrw in new tab
* `<leader>kv` - Open netrw in verticalsplit



## Core Plugins

### COC.NVIM Language Server

**Source:** https://github.com/neoclide/coc.nvim

* https://github.com/neoclide/coc-eslint
* https://github.com/neoclide/coc-git
* https://github.com/neoclide/coc-json
* https://github.com/neoclide/coc-tsserver
* https://github.com/neoclide/coc-prettier
* https://github.com/neoclide/coc-yaml

**Keyspace:** `<leader>x`

**Description:**

The ultimate IDE plugin for Vim. No longer do you need several that conflict, have different ways of working, and handle different things.

#### Keymaps

**General**

* `:CocLocalConfig` - set up local config for project
* `<leader>x` / `:CocList` - list all available commands

**Completions**

* `<C-Space>` - manually trigger completions menu
* `<TAB>` - go to next completion
* `<S-TAB>` - go to previous completion

**Diagnostics**

* `<leader>xa` / ` :CocDiagnostics` - List all diagnostics
* `<leader>x]` - go to next error
* `<leader>x[` -  go to previous error
* `<leader>xd` - go to symbol definition
* `<leader>xy` - got to type definition
* `<leader>xi` - go to implementation



### Vim Doge (Document Generator)

**Source: **https://github.com/kkoomen/vim-doge

**Keyspace:** `d`

**Description:**

Generate documentation based on expressions - such as DocBlocks

#### Keymaps

**General**

* `\d` - generate documentation for method/function
* on insert mode BEFORE function, `/**<TAB>` - generate doc like most IDEs



### Vim Fugitive (git)

**Source:** https://github.com/tpope/vim-fugitive

**Keyspace:** `<leader>g`.

**Description**

This is really powerful and commands are prepended with `:Git`.

#### Keymaps

* `<leader>g` - Go to got command
* `<leader>gd` - open a git diff split vertically



### Filebrowsing (with netrw and friends)

**Keyspace:** `<leader>k` and `<leader>b`

**Description**

This is a collection of netrw commands

#### Keymaps

**General **

* `<leader>kb` - Open netrw like a sidebar (TODO)
* `<leader>ke` - Open netrw in current buffer
* `<leader>kt ` - Open netrw in new tab
* `<leader>kv` - Open netrw in vertical split
* `<leader>ks` - Open netrw in horizontal split
* `<leader>bt` -  new buffer in new tab
* `<leader>bs` - new buffer  in horizontal split
* `<leader>bv` - new buffer in horizontal split

**For netrw usage, see Vim Cheatsheet**



### FZF

**Source:** https://github.com/junegunn/fzf.vim

**Keyspace:** `<leader>f`

**Description:**

Use fzf to search through files, commits, filenames

#### Keymaps

* `<leader>ff` - search through git files, or all files if not a git repo
* `<leader>fa` - force search through all files
* `<leader>fi` -  search through files contents (dot)
* `<leader>fl` - search through buffer lines
* `<leader>fc` - search through  commands
* `<leader>gc` - search through buffer commits

#### Commands

| `:Files [PATH]`   | Files (runs `$FZF_DEFAULT_COMMAND` if defined)               |
| `:GFiles [OPTS]`  | Git files (`git ls-files`)                                   |
| `:GFiles?`        | Git files (`git status`)                                     |
| `:Buffers`        | Open buffers                                                 |
| `:Colors`         | Color schemes                                                |
| `:Ag [PATTERN]`   | [ag](https://github.com/ggreer/the_silver_searcher) search result (`ALT-A` to select all, `ALT-D` to deselect all) |
| `:Rg [PATTERN]`   | [rg](https://github.com/BurntSushi/ripgrep) search result (`ALT-A` to select all, `ALT-D` to deselect all) |
| `:Lines [QUERY]`  | Lines in loaded buffers                                      |
| `:BLines [QUERY]` | Lines in the current buffer                                  |
| `:Tags [QUERY]`   | Tags in the project (`ctags -R`)                             |
| `:BTags [QUERY]`  | Tags in the current buffer                                   |
| `:Marks`          | Marks                                                        |
| `:Windows`        | Windows                                                      |
| `:Locate PATTERN` | `locate` command output                                      |
| `:History`        | `v:oldfiles` and open buffers                                |
| `:History:`       | Command history                                              |
| `:History/`       | Search history                                               |
| `:Snippets`       | Snippets ([UltiSnips](https://github.com/SirVer/ultisnips))  |
| `:Commits`        | Git commits (requires [fugitive.vim](https://github.com/tpope/vim-fugitive)) |
| `:BCommits`       | Git commits for the current buffer; visual-select lines to track changes in the range |
| `:Commands`       | Commands                                                     |
| `:Maps`           | Normal mode mappings                                         |
| `:Helptags`       | Help tags [1](https://github.com/junegunn/fzf.vim#helptags)  |
| `:Filetypes`      | File types                                                   |

Add `!` to open any in full screen mode



### Nerdcommenter

**Source:** https://github.com/preservim/nerdcommenter

**Keyspace:** `<leader>c`

**Description:**

Comment code

#### Keymaps

It is worth looking at the core documentation for more advanced usage, but listed here are the core

* `<leader>c<space>` Comment Toggle
* `<leader>cc` - Comment Line
* `<leader>ci` - Invert Comments
* `<leader>cu` - Uncomment Line
* `<leader>ca` - Switches to alternate delimiters. For example, from `//` to `/* .. */` for javascript



### Vim Tmux Navigator

**Source:** https://github.com/christoomey/vim-tmux-navigator

**Description:**

Easy navigation from vim to tmux panes

#### Keymaps

* `<C-h>` - Move Left
* `<C-j>` - Move  Down
* `<C-k>` - Move  Up
* `<C-l>` - Move  Right
* `<C-\>` - Go to Previous split



### Vim Visual Multi

**Source:** https://github.com/mg979/vim-visual-multi

**Description:**

Multi cursor support. The [tutorial](https://github.com/mg979/vim-visual-multi/blob/master/doc/vm-tutorial) is almost essential to learn usage.

`<vmleader>` is `\\`

#### Keymaps

* `<C-S-j` - Set a cursor and go down. Precede with a number to determine lines if needed
* `<C-S-k>` - Set a cursor and go down. Precede with a number to determine lines if needed
* `<C-n>` - Select words under a cursor. Press again to select matches.
  * Use `<vmleader>c` to cycle smartcasing.
  * Use `q` to skip the current match and go to the next. `Q` to skip current and go back.
  * Use `n` and `N` to go to next/previous match
  * Use `R` to enter replace mode
* `<S-Right>` and `<S-Left` - start a selection and capture characters left or right
* `<vmleader>c` - go to cursor mode from visual mode

**Using Cursors and Selections**

* You can move them (press `wwbb` to get the idea)

* You can run normal mode commands (`dw`, `cW`)

* You can go into insert mode (`i`, `a`)

* You can use VM specific commands

  * `<TAB>` - enter extend mode. You are not using cursors any more by selections in visual mode. Use motions such as `c` or `d`.
  * `.` Apply something from a register
  * `<vmleader>A` - Align cursors
  * `<vmleader>N` - Add number order
  * `<C-v>` - Paste the vm register in insert mode

  

### Vim Windowswap

**Source:** https://github.com/wesQ3/vim-windowswap

**Keyspace:** `<leader>w`

**Description:**

Swap vim windows around

#### Keymaps

* `<leader>ww` - Mark window swaps. Do this on both windows to swap.



### Vim Yank Stack

**Source:** https://github.com/maxbrunsfeld/vim-yankstack

**Keyspace:** `C-p`, `C-P`

**Description:**

Cycle through clipboard (register) stack

#### Keymaps

In normal mode/visual mode

* `<C-p>` - Go previous register
* `<C-P>` - Go forward register

