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

" Git Plugins
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

" JS Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" GO Plugins
Plug 'fatih/vim-go'

call plug#end()

" misc
let mapleader = "\\"

" pretties
syntax on
set number
set paste " fix pasting auto indentation
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
