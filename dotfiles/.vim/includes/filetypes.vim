"
" Generic
"
augroup REMEMBER_FOLDS
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

"
" File types
"
augroup JS
  autocmd!

  " Style Fix
  autocmd FileType javascript,typescript,json command! -nargs=0 Fix :CocCommand eslint.executeAutofix

  " Folding
  autocmd FileType javascript,typescript,json let g:javaScript_fold=1
  autocmd FileType javascript,typescript,json setlocal foldmethod=syntax
augroup END

autocmd Filetype go setlocal noet ci pi sts=0 sw=4 ts=4

autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab

augroup XML
  autocmd!

  " Folding
  autocmd FileType xml,xhtml let g:xml_syntax_folding=1
  autocmd FileType xml,xhtml setlocal foldmethod=syntax
augroup END

augroup YAML
  " Folding provided by pedrohdz/vim-yaml-folds
augroup END
