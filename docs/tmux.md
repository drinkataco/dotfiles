# Tmux Usage

This document is to highlight some notes and plugin usage for Tmux

Useful Links:

- [awesome-tmux](https://github.com/rothgar/awesome-tmux)
- [Docs](https://tmuxguide.readthedocs.io/en/latest/tmux/tmux.html)
- [Cheatsheet](https://gist.github.com/andreyvit/2921703)

## Contents

<!-- vim-md-toc format=bullets max_level=4 ignore=^Contents$ -->
* [General Usage](#general-usage)
  * [Key Bindings](#key-bindings)
    * [Panes](#panes)
    * [Windows](#windows)
    * [Sessions](#sessions)
    * [Searching](#searching)
    * [Misc](#misc)
* [Plugins](#plugins)
  * [tmux-copycat](#tmux-copycat)
  * [tmux-menus](#tmux-menus)
  * [tmux-thumbs](#tmux-thumbs)
<!-- vim-md-toc END -->

## General Usage

`<prefix>` is set to `<C-B>`

### Key Bindings

Some of my general go to key bindings I use a lot, that also probably don't need to be documented.

_Some key bindings are mappings provided by plugins. These will be highlighted_

#### Panes

- `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` - Move left/up/down/right panes. Vim mappings to interact with vim windows nicely
- `<prefix> %` - split vertically
- `<prefix> "` - split horizontally
- `<prefix> q` - show pane numbers. Add the number to also switch.
- `<prefix> {` - move pane right
- `<prefix> }` - move pane left
- `<prefix> <M-LEFT>` - increase pane size with arrow keys

#### Windows

- `<prefix> .` - move window
- `<prefix> ,` - rename window
- `<prefix> c` - create window

#### Sessions

- `<prefix> $` - rename session

Some extended functionality provided by [tmux-sessionist](https://github.com/tmux-plugins/tmux-sessionist)

- `prefix + C `- prompt for creating a new session by name
- `prefix + X` - kill current session without detaching tmux
- `prefix + S` - switches to the last session
- `prefix + @` - promote current pane into a new session

#### Searching

- `<prefix> <space>` - Search with *tmux-thumbs*
- `<prefix> /` - Regex search with *tmux-copycat*

#### Misc

- `<previx> t` - show time
- `<prefix> d` - detach session

## Plugins

Plugins are managed by [TPM](https://github.com/tmux-plugins/tpm).

New plugins added to the `~/.tmux.conf` file can be installed with `<prefix> I`, and uninstalled with `<prefix> <M-u>` the list of all plugins are viewable [here](../.tmux/plugins.tmux) and a select few are documented here

### tmux-copycat

[github.com/tmux-plugins/tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)

Search with regex and copy to clipboard by using `<prefix> /`

- `g` - jump to next match (remapped to keep similar to vim)
- `t` - jump to previous match (remapped to keep similar to vim)

### tmux-menus

[github.com/jaclu/tmux-menus](https://github.com/jaclu/tmux-menus)

Helpful tmux menu. Triggeed with `<prefix> \`

- `<prefix> <` displays some windows handling options
- `<prefix> >` displays some pane handling options

### tmux-thumbs

[https://github.com/fcsonline/tmux-thumbs](https://github.com/fcsonline/tmux-thumbs)

Easily copy common patterns (such as hashes, emails) with `<prefix> <space>`
