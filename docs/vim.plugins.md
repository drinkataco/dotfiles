# Vim Plugins

This document aims to highlight the plugins used by my git installation and any short cuts or workflows that supplement them.

## Contents

<!-- vim-md-toc format=bullets max_level=3 ignore=^TODO$ -->
* [Contents](#contents)
* [Core Features](#core-features)
  * [File browsing](#file-browsing)
* [Core Plugins](#core-plugins)
  * [Vim Bookmarks](#vim-bookmarks)
  * [COC.NVIM Language Server](#cocnvim-language-server)
  * [Vim Doge (Document Generator)](#vim-doge-document-generator)
  * [Vim Fugitive (git)](#vim-fugitive-git)
  * [Filebrowsing (with netrw and friends)](#filebrowsing-with-netrw-and-friends)
  * [FZF](#fzf)
  * [Nerdcommenter](#nerdcommenter)
  * [Vim Spector](#vim-spector)
  * [Vim Table Mode](#vim-table-mode)
  * [Vim Test](#vim-test)
  * [Vim Tmux Navigator](#vim-tmux-navigator)
  * [Vim Visual Multi](#vim-visual-multi)
  * [Vim Windowswap](#vim-windowswap)
  * [Vim Yank Stack](#vim-yank-stack)
<!-- vim-md-toc END -->

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

### Vim Bookmarks

**Source:** https://github.com/MattesGroeger/vim-bookmarks

| Action                                          | Shortcut    | Command                      |
|-------------------------------------------------|-------------|------------------------------|
| Add/remove bookmark at current line             | `mm`        | `:BookmarkToggle`            |
| Add/edit/remove annotation at current line      | `mi`        | `:BookmarkAnnotate <TEXT>`   |
| Jump to next bookmark in buffer                 | `mn`        | `:BookmarkNext`              |
| Jump to previous bookmark in buffer             | `mp`        | `:BookmarkPrev`              |
| Show all bookmarks (toggle)                     | `ma`        | `:BookmarkShowAll`           |
| Clear bookmarks in current buffer only          | `mc`        | `:BookmarkClear`             |
| Clear bookmarks in all buffers                  | `mx`        | `:BookmarkClearAll`          |
| Move up bookmark at current line                | `[count]mkk`| `:BookmarkMoveUp [<COUNT>]`  |
| Move down bookmark at current line              | `[count]mjj`| `:BookmarkMoveDown [<COUNT>]`|
| Move bookmark at current line to another line   | `[count]mg` | `:BookmarkMoveToLine <LINE>` |
| Save all bookmarks to a file                    |             | `:BookmarkSave <FILE_PATH>`  |
| Load bookmarks from a file                      |             | `:BookmarkLoad <FILE_PATH>`  |

### COC.NVIM Language Server

**Source:** https://github.com/neoclide/coc.nvim

* https://github.com/neoclide/coc-diagnostic
* https://github.com/neoclide/coc-eslint
* https://github.com/neoclide/coc-git
* https://github.com/neoclide/coc-json
* https://github.com/neoclide/coc-prettier
* https://github.com/fannheyward/coc-pyright
* https://github.com/neoclide/coc-snippets
* https://github.com/neoclide/coc-stylelintplus
* https://github.com/neoclide/coc-tsserver
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

* `<leader>xa` / `:CocDiagnostics` - List all diagnostics
* `<leader>x]` - go to next error
* `<leader>x[` -  go to previous error
* `<leader>xd` - go to symbol definition
* `<leader>xy` - got to type definition
* `<leader>xi` - go to implementation

**Snippets**

* `<C-j>` - Next placeholder in snippet
* `<C-k>` - Previous placeholder in snippet
* Use `:CocList snippets` to open snippets list used by current buffer.
* Use `:CocCommand snippets.openSnippetFiles` to choose and open a snippet file that used by current document.
* Use `:CocCommand snippets.editSnippets` to edit user's ultisnips snippets of current document filetype.
* Use `:CocCommand snippets.openOutput` to open output channel of snippets.

### Vim Doge (Document Generator)

**Source:** https://github.com/kkoomen/vim-doge

**Keyspace:** `d`

**Description:**

Generate documentation based on expressions - such as DocBlocks

Use `<Tab>` to cycle through text.

#### Keymaps

**General**

* `\d` - generate documentation for method/function

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
* `<leader>fm` - Search through marks (bookmarks)
* `<leader>gc` - search through buffer commits
* `CTRL-T` / `CTRL-H` / `CTRL-V` key bindings to open in a new tab, a new split, or in a new vertical split

#### Commands

| Command           | Description                                                                                                        |
|-------------------|--------------------------------------------------------------------------------------------------------------------|
| `:Files [PATH]`   | Files (runs `$FZF_DEFAULT_COMMAND` if defined)                                                                     |
| `:GFiles [OPTS]`  | Git files (`git ls-files`)                                                                                         |
| `:GFiles?`        | Git files (`git status`)                                                                                           |
| `:Buffers`        | Open buffers                                                                                                       |
| `:Colors`         | Color schemes                                                                                                      |
| `:Ag [PATTERN]`   | [ag](https://github.com/ggreer/the_silver_searcher) search result (`ALT-A` to select all, `ALT-D` to deselect all) |
| `:Rg [PATTERN]`   | [rg](https://github.com/BurntSushi/ripgrep) search result (`ALT-A` to select all, `ALT-D` to deselect all)         |
| `:Lines [QUERY]`  | Lines in loaded buffers                                                                                            |
| `:BLines [QUERY]` | Lines in the current buffer                                                                                        |
| `:Tags [QUERY]`   | Tags in the project (`ctags -R`)                                                                                   |
| `:BTags [QUERY]`  | Tags in the current buffer                                                                                         |
| `:Marks`          | Marks                                                                                                              |
| `:Windows`        | Windows                                                                                                            |
| `:Locate PATTERN` | `locate` command output                                                                                            |
| `:History`        | `v:oldfiles` and open buffers                                                                                      |
| `:History:`       | Command history                                                                                                    |
| `:History/`       | Search history                                                                                                     |
| `:Snippets`       | Snippets ([UltiSnips](https://github.com/SirVer/ultisnips))                                                        |
| `:Commits`        | Git commits (requires [fugitive.vim](https://github.com/tpope/vim-fugitive))                                       |
| `:BCommits`       | Git commits for the current buffer; visual-select lines to track changes in the range                              |
| `:Commands`       | Commands                                                                                                           |
| `:Maps`           | Normal mode mappings                                                                                               |
| `:Helptags`       | Help tags [1](https://github.com/junegunn/fzf.vim#helptags)                                                        |
| `:Filetypes`      | File types                                                                                                         |

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

### Vim Spector

**Source:** https://github.com/puremourning/vimspector

**Keyspace:** `<leader>v`

**Description:**

Vim Graphicl Debugger

#### Keymaps

* `<leader>vd` - Launch **d**ebugger
* `<leader>ve` - **e**xit debugger
* `F3` - Stop Debugger
* `F6` - Pause Debugger
* `<leader>vc` / `F5` - **c**ontinue/start execution
* `<leader>vt` - **t**oggle breakpoint
* `<leader>vT` - reset all breakpoints
* `<leader>vw` - Watch a variable
* `<leader>vr` / `F4` - **r**estart debugger
* `<leader>vk` - Step out, **k** as in up a context
* `<leader>vj` - Step into, **j** as in down a context
* `<leader>vl` - Step over, **l** as in next

See: [Human Mode](https://github.com/puremourning/vimspector#human-mode)

### Vim Table Mode

**Source:** [github.com/vim-table-mode](https://github.com/vim-table-mode)

**Description:**

Create/format tables in Markdown

* `:TableModeEnable` - enable
* `:TableModeDisable` - disable
* `:Tableize` - format existing table
* `| a | b | c |` and then `||` on the new line. Each line after will auto adust
* `[|`, `]|`, `{|` & `}|` to move left | right | up | down cells respectively

### Vim Test

**Source:** https://github.com/vim-test/vim-test

**Keyspace:** `<leader>t`

**Description:**

Run tests, in a tmux panel below vim

#### Keymaps and Commands

* `<leader>tt` - Test nearest test
* `<leader>tf` - Run all of test file
* `<leader>tl` - Rerun last test
* `<leader>ts` - Run the whole test suite

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

* `<Option-j>` - Set a cursor and go down. Precede with a number to determine lines if needed
* `<Option-k>` - Set a cursor and go down. Precede with a number to determine lines if needed
* `<C-n>` - Select words under a cursor. Press again to select matches.
  * Use `<vmleader>c` to cycle smartcasing.
  * Use `q` to skip the current match and go to the next. `Q` to skip current and go back.
  * Use `n` and `N` to go to next/previous match
  * Use `R` to enter replace mode
* `<S-Right>` and `<S-Left>` - start a selection and capture characters left or right
* `<vmleader>c` - go to cursor mode from visual mode
* `<vmleader>/` - add cursor by regex search

See: [permanent mappings](https://github.com/mg979/vim-visual-multi/wiki/Mappings#permanent-mappings)

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
