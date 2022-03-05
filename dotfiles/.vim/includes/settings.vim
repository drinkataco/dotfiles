"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General:                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on
"
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Shortcut <leader> key
let mapleader='\'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface:                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on wild menu for autocomplete
set wildmenu

" Ignore certain files
set wildignore+=*.DS_Store,*.pyc

" Enable backspace
set backspace=eol,start,indent

" Searching settings
set ignorecase
set smartcase
set incsearch

" Highlight when searching but not when found
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Show matching brackets when text indicator is over them
set showmatch
set mat=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes:                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Syntax Highlighting
syntax on

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set colourscheme
let base16colorspace=256
colorscheme base16-materia
set termguicolors

" show line numbers
set number

" Show whitespace characters
set list
set listchars=tab:\|·,trail:~,extends:>,precedes:<,


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc:                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use system clipboard TODO: use better clipboard
set clipboard=unnamed
