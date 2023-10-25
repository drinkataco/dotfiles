scriptencoding utf-8

" Plug.vim auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " vint: -ProhibitAutocmdWithNoGroup
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:includes_dir = expand('<sfile>:p:h') . '/.vim/includes/'

"
" INCLUDE all files
"
function! Include(filename)
  execute 'source' g:includes_dir . a:filename
endfunction

call Include('plugins.vim')
call Include('settings.vim')
call Include('keymaps.vim')
call Include('themes.vim')
