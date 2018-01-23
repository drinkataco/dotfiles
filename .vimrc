" Plug.vim auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" misc
let mapleader = "\\"

" pretties
syntax on
set number
set tabstop=2 shiftwidth=2 expandtab
set paste " fix pasting auto indentation
set list " show special chars -
set listchars=tab:\|- " for tab

" key maps
nmap <F6> :NERDTreeToggle<CR>
