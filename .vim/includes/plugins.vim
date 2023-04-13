scriptencoding utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins:                                                    "
"   Plugins using vim-plug for installation                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/bundle')

" Tools & Utilities
Plug 'neoclide/coc.nvim', {
      \   'branch': 'release'
      \ }
Plug 'puremourning/vimspector'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'
Plug 'wesQ3/vim-windowswap'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'junegunn/vim-peekaboo'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-obsession'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

" Snippets
Plug 'honza/vim-snippets' " Lots of language defaults

" Testing and Dispatching
Plug 'preservim/vimux'
Plug 'vim-test/vim-test'

" Theming
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Searching and Autocomplete
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

" text manipulation
Plug 'preservim/nerdcommenter'
Plug 'kkoomen/vim-doge', { 'do': 'npm i --no-save && npm run build:binary:unix' }
Plug 'mg979/vim-visual-multi'

" javascript/typescript:
Plug 'pangloss/vim-javascript'
Plug 'Quramy/vim-js-pretty-template'
Plug 'prisma/vim-prisma'

" Markdown
Plug 'dhruvasagar/vim-table-mode'
Plug 'drinkataco/vim-md-toc'

" Vim Plugins
Plug 'tpope/vim-scriptease'
Plug 'junegunn/vader.vim'

" misc lang
Plug 'jparise/vim-graphql'
Plug 'nelsyeung/twig.vim'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'pedrohdz/vim-yaml-folds'
Plug 'hashivim/vim-terraform'
Plug 'entrez/roku.vim'

" misc re order
Plug 'christoomey/vim-tmux-navigator'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings:                                            "
"   Any settings for the above plugins                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-airline - Powerline Bar
"
let g:airline_powerline_fonts=1

" Status Bar
let g:airline_section_z=airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr', 'colnr'])
let g:webdevicons_enable_airline_statusline=0

" Tabline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label=''
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#show_tab_count=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#tab_min_count=2
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#tabline#show_tab_nr=0
let g:airline#extensions#tabline#show_tab_type=0

"
" coc.nvim
"
let g:coc_global_extensions=[
      \ 'coc-diagnostic',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-snippets',
      \ 'coc-stylelintplus',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ ]

" Create Prettier command
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊', '']
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

"
" Vim Doge
"
let g:doge_javascript_settings={
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
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-h': 'split',
      \ 'ctrl-v': 'vsplit'
  \ }

"
" MD-TOC Markdown Table of Contents
"
let g:mdtoc_autoupdate=1
let g:mdtoc_ignore_regex='^TODO$'

"
" NERDCommenter
"
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDDefaultAlign='left'

"
" Vim Visual Multi
"
let g:VM_theme='iceblue'
let g:VM_maps={}
let g:VM_maps['Add Cursor Down']='∆' " Option-j for Mac
let g:VM_maps['Add Cursor Up']='˚' " Option-k for Mac

"
" Vim Spector
"
let g:vimspector_install_gadgets=[
      \  'debugger-for-chrome',
      \  'CodeLLDB',
      \  'vscode-bash-debug',
      \  'vscode-firefox-debug',
      \  'vscode-node-debug2',
      \ ]
let g:vimspector_enable_mappings='HUMAN'
let g:vimspector_sign_priority = {
      \    'vimspectorBP': 30,
      \    'vimspectorBPCond': 20,
      \    'vimspectorBPLog': 20,
      \    'vimspectorBPDisabled': 15,
      \    'vimspectorPC': 999,
      \ }

"
" Vim Test
"
let test#strategy='vimux'
