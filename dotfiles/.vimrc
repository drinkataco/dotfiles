" Plug.vim auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" UI Plugins
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'wincent/command-t', {
  \    'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \  }

" Colour schemes
Plug 'chriskempson/base16-vim'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" JS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" GO
Plug 'fatih/vim-go'

" Markdown
Plug 'suan/vim-instant-markdown'

" Tools & Utilities
Plug 'christoomey/vim-tmux-navigator' " work with tmux

call plug#end()

" misc
let mapleader = '\\'

" pretties
syntax on
"let &t_8f = '\<Esc>[38;2;%lu;%lu;%lum' " tmux colour fix
"let &t_8b = '\<Esc>[48;2;%lu;%lu;%lum' " ''
let base16colorspace=256
colorscheme base16-materia
set termguicolors
set number
set list " show special chars -
set listchars=tab:\|- " for tab

" Spacing like
filetype plugin indent on
set tabstop=2 " show existing tab with 2 spaces width
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set expandtab " On pressing tab, insert 2 spaces

" Some files types need different spacing requirements
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype go setlocal noet ci pi sts=0 sw=4 ts=4

" key maps
nmap <F5> :NERDTreeToggle<CR>
