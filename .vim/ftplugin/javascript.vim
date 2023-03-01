" Eslint Fix Command
command! -nargs=0 Fix :CocCommand eslint.executeAutofix

" Code Folding
let g:javaScript_fold=1
setlocal foldmethod=syntax

" Default Indenting
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
