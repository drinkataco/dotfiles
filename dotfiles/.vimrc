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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator' " work with tmux
Plug 'ycm-core/YouCompleteMe', {
\   'do': './install.py --all'
\ } " keyword completion
Plug 'dense-analysis/ale' " Linter
Plug 'mhinz/vim-startify'
Plug 'wesQ3/vim-windowswap'
Plug 'editorconfig/editorconfig-vim' " Editor alignment
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', {
\   'do': 'npm ci',
\   'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
\ }
Plug 'tpope/vim-fugitive'

" syntax
Plug 'nelsyeung/twig.vim'
Plug 'cespare/vim-toml'

" Colour schemes
Plug 'chriskempson/base16-vim'

" JS / TS
"Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Quramy/tsuquyomi'

" GraphQL
Plug 'jparise/vim-graphql'

call plug#end()

" misc
let mapleader = '\'
set clipboard=unnamed

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

" Spacing like
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set tabstop=2
set shiftwidth=2
set expandtab

" Some files types need different spacing requirements
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype go setlocal noet ci pi sts=0 sw=4 ts=4

"
" key maps
"
" note: i've tried to keep them similar to Sublime Text where possible
nmap <F5> :NERDTreeToggle<CR>
nmap <leader>kb :NERDTreeToggle<CR> " open/close sidebar

" Fuzzy searching
nmap <leader>t :GitFiles<CR>
nmap <leader>ff :FZF<CR>
nmap <leader>ft :Ag<CR>
nmap <leader>fh :History:<CR>
nmap <leader>fc :BCommits<CR>

" Linting etc
nmap <leader>p :PrettierAsync<CR>

" git fugitive
nmap <leader>gg :Git
nmap <leader>gb :Git blame<CR>
nmap <leader>gc :Git commit
nmap <leader>gl :Git log<CR>
nmap <leader>gs :Gdiffsplit<CR>
nmap <leader>gw :Gwrite<CR>

" Save session (close nerdtree to stop opening buffer errors)
nmap <leader>s :tabdo NERDTreeClose <bar> :SSave<CR>
nmap <leader>o :SLoad<CR>
nmap <leader>x :SClose<CR>

set backspace=indent,eol,start " allow backspace

" Move lines up/down
nnoremap <c-s-j> :m .+1<CR>==
nnoremap <c-s-k> :m .-2<CR>==
inoremap <c-s-j> <Esc>:m .+1<CR>==gi
inoremap <c-s-k> <Esc>:m .-2<CR>==gi
vnoremap <c-s-j> :m '>+1<CR>gv=gv
vnoremap <c-s-k> :m '<-2<CR>gv=gv

"
" PLUGIN Settings
"
" ALE Linter
let g:ale_fixers = {'javascript': ['eslint'], 'typescript': ['eslint'] }
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'] }

" nerdtree
let g:NERDTreeRespectWildIgnore=1 " hide files with wildignore
let g:NERDTreeShowHidden=1 " show hidden files by default
autocmd BufWinEnter * NERDTreeMirror " mirror nerdtree amongst tabs
let NERDSpaceDelims=1 " space after comments

" prettier
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html silent! PrettierAsync

" TSX JS
"   it seemed that tsx were being set as ts files so highlighting was incorrect
autocmd BufNewFile,BufRead *.tsx :set filetype=typescript syntax=typescript.tsx

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1

" startify
" bring sessions to the top
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
\ ]
