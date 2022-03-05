"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode:                                                "
"   Used mainly to map plugin commands to shortcuts           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" K: File Exploration
" nmap <leader>kb :NERDTreeToggle<CR> 
" nmap <leader>kf :NERDTreeFind<CR>
nmap <leader>ko :! subl %<CR><CR>|  " Open FILE in sublime text
nmap <leader>ks :Sexplore<R>| " Open netrw in horizontal split
nmap <leader>kt :Texplore<CR>| " Open netrw in new tab
nmap <leader>kv :Vexplore<CR>|  " Open netrw in vertical split

" B: Buffers
nmap <leader>bt :tabnew<CR>
nmap <leader>bs :new<CR>
nmap <leader>bv :vnew<CR>

" C: Commenting
" This is reserved for nerdcommenter

" F: Searching
" nmap <leader>fc :BCommits<CR>|  " comment after
nmap <leader>ff :FZF<CR>
" nmap <leader>fi :Ag<CR>
" nmap <leader>fg :GitFiles<CR>
" nmap <leader>fh :History:<CR>

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0) " File Contents Only for Ag - move to plugins.settings.vim

" L: Linting etc
" nmap <leader>p :PrettierAsync<CR>

" G: Git and version control
nmap <leader>g :Git
nmap <leader>gd :Gvdiffsplit<CR>
" nmap <leader>gb :Git blame<CR>
" nmap <leader>gc :Git commit
" nmap <leader>gl :Git log<CR>
" nmap <leader>gw :Gwrite<CR>

" Save session (close nerdtree to stop opening buffer errors)
" nmap <leader>s :tabdo NERDTreeClose <bar> :SSave<CR>
" nmap <leader>o :SLoad<CR>
" nmap <leader>x :SClose<CR>


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

" This allows <C-SPACE> to show completion menu
inoremap <silent><expr> <c-@> coc#refresh()

