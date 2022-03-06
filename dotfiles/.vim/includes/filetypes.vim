augroup XML
  autocmd!
  autocmd FileType xml let g:xml_syntax_folding=1
  autocmd FileType xml setlocal foldmethod=syntax
  autocmd FileType xml :syntax on
  autocmd FileType xml :%foldopen!
augroup END

augroup JS
  autocmd FileType javascript command! -nargs=0 FixStyle :CocCommand eslint.executeAutofix
  autocmd FileType typescript command! -nargs=0 FixStyle :CocCommand eslint.executeAutofix
augroup END

autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype go setlocal noet ci pi sts=0 sw=4 ts=4
