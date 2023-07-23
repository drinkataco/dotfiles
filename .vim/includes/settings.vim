scriptencoding utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General:                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread
augroup settings_autoread
  au!
  au FocusGained,BufEnter * checktime
augroup END

" Disable Swap File. I don't care if I have the same file open multiple
" instances with autoread!
set noswapfile

" Shortcut <leader> key
let mapleader='\'

" Use unamed register for clipboard
set clipboard=unnamed

" make a new directory for a file created at a non-existant path
augroup mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END


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

" Indenting
set autoindent
set smartindent

" Highlight when searching but not when found
augroup settings_incsearch_highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Show matching brackets when text indicator is over them
set showmatch
set mat=2

" Folding should be very liberal. Appear only when I say
set foldlevelstart=99

" Default folding for files should be based off of indent
set foldmethod=indent

" Remember folds from closed files
augroup settings_remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

" netrw File Browsing
let g:netrw_banner=0

" Use wildignore files to ignore in netrw
let s:escape = 'substitute(escape(v:val, ".$~"), "*", ".*", "g")'
let g:netrw_list_hide =
      \ join(map(split(&wildignore, ','), '"^".' . s:escape . '. "/\\=$"'), ',')

" Rough Function to simulate a sort of sidebar for netrw
let g:NetrwIsOpen=0
function! NetrwSidebar()
  if g:NetrwIsOpen
    let i = bufnr('$')
    while (i >= 1)
      if (getbufvar(i, '&filetype') ==# 'netrw')
        silent exe 'bwipeout ' . i 
      endif
      let i-=1
    endwhile
    let g:NetrwIsOpen=0
  else
    let g:netrw_winsize = 20 " Make sidebar sized
    let g:NetrwIsOpen=1
    silent Vexplore
    let g:netrw_winsize = 50 " Make 50% again
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes:                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Syntax Highlighting
syntax on

" Set utf8 as standard encoding and en_US as the standard language
" vint: -ProhibitEncodingOptionAfterScriptEncoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set colourscheme -
"  based off of a theme set for vim, or the shell theme
if exists('$BASE16_VIM')
  colorscheme base16-$BASE16_VIM
elseif exists('$BASE16_THEME')
  " There an issue where sometimes this variable begines with base16-,
  " sometimes it doesn't...
  if $BASE16_THEME =~# '^base16-'
    colorscheme $BASE16_THEME
  else
    colorscheme base16-$BASE16_THEME
  endif
endif
set termguicolors

" show line numbers
set number

" Show whitespace characters
set list
set listchars=tab:\|·,trail:~,extends:>,precedes:<,

" Extend tab by default
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Cursor Line
set cursorline
highlight cursorline guibg=#1b2b34
highlight cursorlinenr term=bold cterm=NONE ctermbg=NONE
set concealcursor-=n

" Highlights
highlight Error term=bold,underline cterm=bold,underline ctermfg=1 gui=bold,underline guifg=#EC5f67 guibg=NONE
