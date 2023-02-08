"
" Code Folding
"
let g:markdown_folding=1

augroup ftplugin_md_openfold
  au BufRead * normal zR
augroup END

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

" Automatically enable markdown 'table mode'
augroup ftplugin_md_tablemodeenable
  au BufRead * silent! TableModeEnable
augroup END
