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

" Searching and Autocomplete
Plug 'neoclide/coc.nvim', {
      \   'branch': 'release'
      \ }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" syntax and language specific
" Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
" Plug 'jparise/vim-graphql'
"
" javascript/typescript:
Plug 'pangloss/vim-javascript'
Plug 'Quramy/vim-js-pretty-template'

"
"
"
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'nelsyeung/twig.vim'
" Plug 'prettier/vim-prettier', {
" \   'do': 'npm ci',
" \   'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
" \ }

call plug#end()


"
" vim-indent-guides
"
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings:                                            "
"   Any settings for the above plugins                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-yaml',
      \ ]

" Map Commands
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

"
" FZF
"
" When using Ag, only search through file contents and not names
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
