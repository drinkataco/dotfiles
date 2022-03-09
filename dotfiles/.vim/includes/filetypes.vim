augroup JS
  autocmd!

  " Style Fix
  autocmd FileType javascript,typescript command! -nargs=0 Fix :CocCommand eslint.executeAutofix

  " Folding
  autocmd FileType javascript,typescript let g:javaScript_fold=1
  autocmd FileType javascript,typescript setlocal foldmethod=syntax
  autocmd FileType javascript,typescript normal zR
augroup END

autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab

autocmd Filetype go setlocal noet ci pi sts=0 sw=4 ts=4

augroup XML
  autocmd!

  " Folding
  autocmd FileType xml,html,xhtml let g:xml_syntax_folding=1
  autocmd FileType xml,html,xhtml setlocal foldmethod=syntax
  autocmd FileType xml,html,xhtml normal zR
augroup END
