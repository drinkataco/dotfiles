" Change prettier keymap to xmllint formatting
vmap <leader>p :!xmllint --encode UTF-8 --format -<CR>

" Code Folding
let g:xml_syntax_folding=1
setlocal foldmethod=syntax

