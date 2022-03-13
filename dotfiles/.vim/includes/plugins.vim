"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins:                                                    "
"   Plugins using vim-plug for installation                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')

" Tools & Utilities
Plug 'neoclide/coc.nvim', {
      \   'branch': 'release'
      \ } " The greatest language server
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive' " Ultimate Git Plugin
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesQ3/vim-windowswap'
Plug 'maxbrunsfeld/vim-yankstack'

" Theming
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Searching and Autocomplete
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" text manipulation
Plug 'preservim/nerdcommenter'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'mg979/vim-visual-multi' 

" javascript/typescript:
Plug 'pangloss/vim-javascript'
Plug 'Quramy/vim-js-pretty-template'

" misc syntax
Plug 'jparise/vim-graphql'
Plug 'nelsyeung/twig.vim'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'pedrohdz/vim-yaml-folds'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings:                                            "
"   Any settings for the above plugins                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-airline - Powerline Bar
"
let g:airline#extensions#tabline#formatter='default'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#left_sep = ' '

"
" coc.nvim
"
let g:coc_global_extensions = [
      \ 'coc-diagnostic',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-yaml',
      \ ]

" Create Prettier command
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

"
" Vim Doge
"
nmap <leader>d :DogeGenenrate<CR>
imap /**<Tab> <Esc> :DogeGenerate<CR>

let g:doge_javascript_settings = {
      \  'destructuring_props': 1,
      \  'omit_redundant_param_types': 1,
      \ }

"
" FZF
"
" Adjust Ag command to only search file contents (not names), and to include hidden files
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \   '--hidden',
      \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}),
      \   <bang>0
      \ )

"
" NERDCommenter
"
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

"
" Vim Visual Multi
"
let g:VM_theme = 'iceblue'
" <C-Down> and <C-Up> don't work for some reason. I gave up and just remapped
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"] = '<C-S-j>'
let g:VM_maps["Add Cursor Up"] = '<C-S-k>'
