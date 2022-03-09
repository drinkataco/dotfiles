"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode:                                                "
"   Used mainly to map plugin commands to shortcuts           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" K: File Exploration
noremap <leader>kb :call NetrwSidebar()<CR>| " Rough and ready netrw sidebar
nmap <leader>ko :! subl %<CR><CR>| " Open FILE in sublime text
nmap <leader>ks :Sexplore<CR>| " Open netrw in horizontal split
nmap <leader>kt :Texplore<CR>| " Open netrw in new tab
nmap <leader>kv :Vexplore<CR>| " Open netrw in vertical split

" B: Buffers
nmap <leader>bt :tabnew<CR>
nmap <leader>bs :new<CR>
nmap <leader>bv :vnew<CR>

" C: Commenting
" This is reserved keyspace for nerdcommenter

" F: Searching
nmap <leader>fc :BCommits<CR>
nmap <leader>fi :Ag<CR>
nmap <leader>ff :FZF<CR>
nmap <leader>fg :GitFiles<CR>
nmap <leader>fg? :GitFiles?<CR>
nmap <leader>fh :History:<CR>

" G: Git and version control
nmap <leader>g :Git
nmap <leader>gd :Gvdiffsplit<CR>

" X: COC.VIM settings
nmap <leader>x :CocList<CR>| " Project lists 
nmap <leader>xc :CocCommand | " Enter coc command mode
nmap <leader>xa :CocDiagnostics<CR>| " Show diagnostics
map <leader>x] <Plug>(coc-diagnostic-next)| " Go to next diagnostic
map <leader>x[ <Plug>(coc-diagnostic-prev)| " Go to previous diagnostic
" GoTo code navigation.
map <leader>xd <Plug>(coc-definition)
map <leader>xy <Plug>(coc-type-definition)
map <leader>xi <Plug>(coc-implementation)
map <leader>xr <Plug>(coc-references)

" Misc: Non namespaced
nmap <leader>p :Prettier<CR>| " Run prettier on file using coc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Mode:                                                "
"   Keys maps for insert modes                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This maps <TAB> and <S-TAB> to be used with coc.nvim completion plugin
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" This allows <CR> to select completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" This allows <C-SPACE> to show completion menu
inoremap <silent><expr> <c-@> coc#refresh()

