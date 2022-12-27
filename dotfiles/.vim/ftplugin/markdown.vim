"
" Code Folding
"
let g:markdown_folding=1
au BufRead * normal zR

" Fenced syntax highlighting
let g:markdown_fenced_languages=[
      \ 'bash=sh',
      \ 'css',
      \ 'javascript',
      \ 'js=javascript',
      \ 'json=javascript',
      \ 'git',
      \ 'graphql',
      \ 'html',
      \ 'make',
      \ 'python',
      \ 'sql',
      \ 'typescript',
      \ 'vim',
      \ 'yaml',
      \ 'xml'
      \ ]

