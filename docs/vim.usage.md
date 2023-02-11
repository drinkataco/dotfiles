# Vim Commands

This document aims to highlight useful standard vim commands.

Useful link: https://devhints.io/vim

<!-- vim-md-toc format=bullets ignore=^TODO$ -->
* [Text Manipulation and Navigation](#text-manipulation-and-navigation)
  * [Navigation](#navigation)
    * [Words, Lines, and Characters](#words-lines-and-characters)
    * [Window and Document](#window-and-document)
    * [Code](#code)
    * [Searching](#searching)
    * [Jumps and Movements](#jumps-and-movements)
    * [Markers / Bookmarks](#markers--bookmarks)
  * [Text Objects](#text-objects)
    * [Operators](#operators)
    * [Method](#method)
    * [Text Objects](#text-objects)
  * [Inserting and Editing](#inserting-and-editing)
    * [Standard](#standard)
    * [Visual Block](#visual-block)
  * [Searching and Replacing](#searching-and-replacing)
    * [Searching](#searching)
  * [Code Folding](#code-folding)
* [Files and Buffers](#files-and-buffers)
  * [Netrw](#netrw)
    * [Copying Files](#copying-files)
  * [Buffers](#buffers)
* [Modes](#modes)
  * [Normal](#normal)
    * [Substitutions](#substitutions)
  * [Visual](#visual)
* [Windows, Splits and Tabs](#windows-splits-and-tabs)
  * [Splits](#splits)
  * [Tabs](#tabs)
* [Misc](#misc)
<!-- vim-md-toc END -->

## Text Manipulation and Navigation

The main usage of vim is EDITING files. This section details ways to navigate around text objects windows and documents and basic manipulation.

### Navigation

#### Words, Lines, and Characters

* `b` - Previous **Word**
* `w` - Next **Word**
* `ge` - End of Previous **Word**
* `e` - End of Next **Word**
* `0` - Start of **Line**
* `^` - Start of **Line** (after whitespace)
* `$` - End of **Line**
* `fx`- Go forward to **Character** x
* `Fx` - Go previous to **Character** x

#### Window and Document

* `gg` - First **Line**
* `G` - Last **Line**
* `:4` - Go to **Line** 4
* `zz` - Centre the **Window** at this line
* `zt` - Move this **Window** with this line at the top
* `zb` - Move this **Window** with this line at the bottom
* `H` - Move to top opf screen
* `M` - Move to middle of screen
* `L` - Move to bottom of screen
* `<C-b>` - Move back one full screen
* `<C-f>` - Move forward one full screen
* `<C-d>` - Move forward 1/2 screen
* `<C-u>` - Move back (up) 1/2 screen

#### Code

* `%` - Nearest/matching `{[()]}`
* `[(`, `[{`, `[<` - Previous bracket
* `])`, `]}`, `]>` - Next bracket
* `[m` - Previous method start
* `[M` - Next method start

#### Searching

#### Jumps and Movements

- `<C-O>` - Go to previous jump
- `<C-I>` Go to next jump
- `gf` - Go to file in cursor
- `;` - repeat movement forward
- `,`-  repeqte movement backwards

#### Markers / Bookmarks

Reference: [Using Marks](https://vim.fandom.com/wiki/Using_marks)

* `mx` - Set mark, where **x* * can be any character
* `\`x` - Go to mark, where **x* * can be any character
* `\`]'` - jump to next line with a lowercase mark
* `['` - jump to previous line with a lowercase mark
* `]\`` - jump to next lowercase mark
* `[\`` - jump to previous lowercase mark 
* `:delmarks x` - Delete Mark

### Text Objects

Objects can be modified by 3 keys – the first being the operator (such as **c** for change), the second being the method (such as **i** for inner), and the last being the text object (such as **w** for word). So `caw` would be change around word.

#### Operators

* `c` - Change
* `d` - Delete
* `v` - Visual
* `y` - Yank

#### Method

* `a` - Around; include whitespace/newline
* `i` - Inner; inside object only

#### Text Objects

* `p` - Paragraph
* `w`- Word
* `s` - Sentence
  `[`,` (`, `{`, `<`A -  [], (), or {} block
* `'`,  `"` - A quoted string
* `t`A -  XML tag block

### Inserting and Editing

#### Standard

* `a` - Append
* `A` - Append from end of line
* `i` - Insert
* `o` - Insert above line
* `O` - Insert below line
* `s` - Delete char and insert
* `S` - Delete line and insert
* `C` Delete until end of line and insert
* `r` - Replace one character
* `R` - Enter Replace mode
* `u` - Undo Changes
* `<C-R` - Redo changes

#### Visual Block

- Use `Ctrl+V` to enter visual block mode
- Move Up/Downto select the columns of text in the lines you want to comment.
- Then either:
  - `<S-i>` - Insert
  - `c` - Change
- Then hit `Esc`, wait 1 second and the inserted text will appear on every line.

### Searching and Replacing

#### Searching

* `/{REGEX}`
  * `ctrl-g` - go to next found
  * `ctrl-t` - go to previous 
  * `ctrl-p` - previous search (history-1)
  * `ctrl-n` - next search (history+1)

### Code Folding

* `zo` - Open fold /`zO` Open fold recursively
* `zc` - Close fold /`zC` Close fold recursively
* `za` - Toggle fold
* `zM` - Close all folds
* `zR` - Open all folds

## Files and Buffers

On top of editing singular files we can use Vim to organise files in tabs. We can create new files (via buffers) and

### Netrw

File navigation is done with `netrw`: `:Explore`, `:Sexplore`,`:Vexplore`, `Texplore`.

And within **netrw**, we'll want to manipulate the files:

- `<C-r>` - Open directory/file
- `<del>` - Delete file
- `<C-l>` - Refresh directory
- `d` - CREATE a directory
- `%` - CREATE a new file
- `D` - DELETE a file/firectory
- `p` - PREVIEW a file
- `R` - RENAME a file or directory
- `o` - OPEN file/directory in HORIZONTAL split
- `v` - OPEN file/direxctory in VERTICAL split
- `x` - OPEN file in system file editor (useful for binary files, for example)
- `gn` - CHANGE root directory
- `-` - CHANGE directory to parent

See https://gist.github.com/danidiaz/37a69305e2ed3319bfff9631175c5d0f for an exhaustive list

#### Copying Files

1. `mt` - mark destination directory
2. `mf` - mark file
3. `mc` - perform copy

### Buffers

* `<C-o>` - Go to previous buffer (jump)
* `<C-i>` - Go to next buffer (jump) if set
* `:tabnew` - New buffer in tab
* `:new` - New buffer in horizontal split 
* `:Vnew` - New buffer in vertical split

## Modes

Mode-specific usage

### Normal

#### Substitutions

- `:%s/A/B/g` - sub whole file
- `:s/A/B/g` - sub 
- `:&` - Repeats last substitution but resets the flags. Also works with just :s.
- `:&&` - Repeat last substitution with the same flags.
- `:%&` - Repeat last substitution on entire file, reset flags.
- `:%&&` - Repeat last substitution on entire file, keep flags.

### Visual

* `gv` - Go to previous visual block (via normal mode)
* `<C-<>` - Indent Left
* `<C->>` - Indent Right
* `<C-=>` - Auto Indent

## Windows, Splits and Tabs

### Splits

[Readmore](https://vim.fandom.com/wiki/Resize_splits_more_quickly)

- `<C-w>=` - equal size
- `<C-w>>` - increase v size
- `<C-w><` - decrease v size
- `<C-w>+` - increase h size
- `<C-w>-` - decrease h size
- `<C-w>K` or `<C-w> J` - move splits left/right
- `<C-w><Bar>` - enlarge current pane

### Tabs

* `gt` - Go to next tab
* `gT` - Go to previous tab
* `3gt` - Go the third tab


## Misc

* `<S-k>` - Jump to help for vim symbol
