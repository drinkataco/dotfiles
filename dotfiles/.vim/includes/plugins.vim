"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins:                                                    "
"   Plugins using vim-plug for installation                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')

" Tools & Utilities
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'preservim/nerdcommenter'
" Plug 'preservim/nerdtree'
" Plug 'mhinz/vim-startify'
" Plug 'wesQ3/vim-windowswap'
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" Theming
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Searching and Autocomplete
Plug 'neoclide/coc.nvim', {
      \   'branch': 'release'
      \ }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Linting and Debugging
" Plug 'dense-analysis/ale'
" Plug 'puremourning/vimspector', {
" \   'do': './install_gadget.py --all'
" \ }

" syntax and language specific
" Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
" Plug 'jparise/vim-graphql'
" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'nelsyeung/twig.vim'
" Plug 'prettier/vim-prettier', {
" \   'do': 'npm ci',
" \   'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
" \ }
" Plug 'Quramy/vim-js-pretty-template'
" Plug 'Quramy/tsuquyomi'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings:                                            "
"   Any settings for the above plugins                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Linter
"
" let g:ale_fixers = {'javascript': ['eslint'], 'typescript': ['eslint'] }
" let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'] }
" let g:ale_pattern_options = {
      " \   '.*node_modules.*$': {'ale_enabled': 0},
      " \   '.*dist.*$': {'ale_enabled': 0}
      " \ }

"
" vim-airline
" Powerline Bar
"
let g:airline#extensions#tabline#formatter='default'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = ' '

" 
" coc.nvim
"
let g:coc_global_extensions = [
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-yaml'
      \ ]

"
" FZF
"
" When using Ag, only search through file contents and not names
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

"
" Nerdtree
"
let g:NERDTreeRespectWildIgnore=1 " hide files with wildignore
let g:NERDTreeShowHidden=1 " show hidden files by default
let NERDTreeMinimalUI=1
let NERDSpaceDelims=1 " space after comments
" autocmd BufWinEnter * NERDTreeMirror " mirror nerdtree amongst tabs

" TSX JS
"   it seemed that tsx were being set as ts files so highlighting was incorrect
autocmd BufNewFile,BufRead *.tsx :set filetype=typescript syntax=typescript.tsx

" Tsquomi
let g:tsuquyomi_disable_quickfix=1
