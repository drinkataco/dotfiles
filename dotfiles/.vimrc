" Plug.vim auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Tools & Utilities
Plug 'preservim/nerdcommenter' " comment out
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Plug 'wincent/command-t', {
"  \    'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
"  \  } " fuzzy file searching
Plug 'christoomey/vim-tmux-navigator' " work with tmux
" Plug 'jiangmiao/auto-pairs' " match brackets
"Plug 'Valloric/YouCompleteMe'
"Plug 'Valloric/YouCompleteMe', {
  "\    'do': './install.py --all'
  "\  } " keyword completion
"Plug 'w0rp/ale' " Linter
"Plug 'wesQ3/vim-windowswap'
Plug 'editorconfig/editorconfig-vim' " Editor alignment
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
\ }

" Colour schemes
Plug 'chriskempson/base16-vim'

" JS / TS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Quramy/tsuquyomi'

" GraphQL
Plug 'jparise/vim-graphql'

" GO
" Plug 'fatih/vim-go'

" Markdown
" Plug 'suan/vim-instant-markdown'

call plug#end()

" misc
let mapleader = '\'

" pretties
syntax on
let base16colorspace=256
colorscheme base16-materia
set termguicolors
set number
set list " show special chars -
set listchars=tab:\|- " for tab
let g:airline_powerline_fonts=1
set wildignore+=*.swp,*.DS_Store " hide files

" Spacing like
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set tabstop=2 " show existing tab with 2 spaces width
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set expandtab " On pressing tab, insert 2 spaces

" Some files types need different spacing requirements
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype go setlocal noet ci pi sts=0 sw=4 ts=4

" key maps
nmap <F5> :NERDTreeToggle<CR>
set backspace=indent,eol,start " allow backspace

"
" PLUGIN Settings
"
" nerdtree
let g:NERDTreeRespectWildIgnore=1 " hide files with wildignore
let g:NERDTreeShowHidden=1 " show hidden files by default

" prettier
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" TSX JS
"   it seemed that tsx were being set as ts files so highlighting was incorrect
autocmd BufNewFile,BufRead *.tsx :set filetype=typescript syntax=typescript.tsx
