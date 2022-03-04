" misc
let mapleader = '\'
set clipboard=unnamed
set wildmenu
set backspace=indent,eol,start

" language support
let $RUBYHOME=$HOME."/.rvm/rubies/ruby-2.7.2"
set rubydll=$HOME/.rvm/rubies/ruby-2.7.2/lib/libruby.dylib

" pretties
syntax on
let base16colorspace=256
colorscheme base16-materia
set termguicolors
set number
set relativenumber
set list
set listchars=tab:\|-
let g:airline_powerline_fonts=1
set wildignore+=*.swp,*.DS_Store
set incsearch
set hidden
