"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core:
"   Generic keys and that will be mapped in multiple modes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap left/right arrows to switch tabs
nnoremap <Left> gT
nnoremap <Right> gt
inoremap <Left> <Esc> gT
inoremap <Right> <Esc> gt

command! W w " Shift kills me

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal Mode:                                                "
"   Used mainly to map plugin commands to shortcuts           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" K: File Exploration
noremap <leader>kb :call NetrwSidebar()<CR>| " Rough and ready netrw sidebar
nmap <leader>ko :! subl %<CR><CR>| " Open FILE in sublime text
nmap <leader>ke :Explore<CR>| " Open netrw in current buffer
nmap <leader>kh :Sexplore<CR>| " Open netrw in horizontal split
nmap <leader>kt :Texplore<CR>| " Open netrw in new tab
nmap <leader>kv :Vexplore<CR>| " Open netrw in vertical split

" B: Buffers
nmap <leader>bt :tabnew<CR>
nmap <leader>bh :new<CR>
nmap <leader>bv :vnew<CR>

" C: Commenting
" This is reserved keyspace for nerdcommenter

" F: Searching
" This function allows us to fall back to FZF if not a git repo
function! SearchFiles()
  let s = execute('GitFiles')
  if strtrans(s) ==? '^@Not in git repo'
    execute 'FZF'
  endif
endfunction
" nmap <leader>ff :call SearchFiles()<CR>| " Only search through git file names (don't search .gitignore for example)
" nmap <leader>ffa :FZF<CR>| " Search through all file names
nmap <leader>ff :FZF -i <CR>| " Search through all file names
nmap <leader>fg :call SearchFiles()<CR>| " Only search through git file names (don't search .gitignore for example)
nmap <leader>fb :Buffers -i <CR>| " Search through current buffers
nmap <leader>fi :Ag<CR>| " Search through file contents
nmap <leader>fc :Commands<CR>| " Search through available commands
nmap <leader>fm :Marks<CR>| " Search through marks (bookmarks)
nmap <leader>fl :BLines<CR>| " Search through current buffer lines

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]
nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResourcesRpc project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatusRpc<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActionsRpc<CR>
nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffersRpc<CR>
nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffersRpc<CR>
nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResourcesRpc buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumpsRpc<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChangesRpc<CR>
nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrepRpc<Space>
xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrepRpc<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTagsRpc<CR>
nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFixRpc<CR>

" G: Git and version control
nmap <leader>g :Git
nmap <leader>gb :Git blame<CR>
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gc :BCommits<CR>| " FZF to search buffer commits
nmap <leader>gx :tab term lazygit<CR>| " open up lazy git in new tab

" P: Vim Yank Stack
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-P> <Plug>yankstack_substitute_newer_paste

" T: Vim Test
nmap <leader>tt :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>tl :TestLast<CR>
nmap <leader>ts :TestSuite<CR>

" V: Vimspector
nnoremap <leader>vd :call vimspector#Launch()<CR>
nnoremap <leader>ve :call vimspector#Reset()<CR>
nnoremap <leader>vc :call vimspector#Continue()<CR>
nnoremap <leader>vt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>vT :call vimspector#ClearBreakpoints()<CR>
nnoremap <leader>vw :VimspectorWatch 
nnoremap <leader>vr <Plug>VimspectorRestart
nnoremap <leader>vk <Plug>VimspectorStepOut
nnoremap <leader>vj <Plug>VimspectorStepInto
nnoremap <leader>vl <Plug>VimspectorStepOver
" NOTE: Also see: https://github.com/puremourning/vimspector#human-mode

" W: Windows
" This is used by vim-windowswap

" X: COC.VIM settings
nmap <leader>c :CocFzfList<CR>| " Project lists 
nmap <leader>cc :CocCommand | " Enter coc command mode
nmap <leader>ca :CocDiagnostics<CR>| " Show diagnostics
map <leader>c] <Plug>(coc-diagnostic-next)| " Go to next diagnostic
map <leader>c[ <Plug>(coc-diagnostic-prev)| " Go to previous diagnostic
" GoTo code navigation.
map <leader>cd <Plug>(coc-definition)
map <leader>cds :call CocAction('jumpDefinition', 'split')<CR>
map <leader>cdv :call CocAction('jumpDefinition', 'vsplit')<CR>
map <leader>cdt :call CocAction('jumpDefinition', 'tabe')<CR>

map <leader>xy <Plug>(coc-type-definition)
map <leader>xi <Plug>(coc-implementation)
map <leader>xr <Plug>(coc-references)

" Misc: Non namespaced
nmap <leader>d :DogeGenerate<CR>
nmap <C-y> :Yanks<CR>| " Show yanks from yank stack (simialr to :reg)

" Prettier / Formatting
nmap <leader>p :Prettier<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Mode:                                                "
"   Keys maps for insert modes                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This maps <TAB> and <S-TAB> to be used with coc.nvim completion plugin
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" This allows <C-SPACE> to show completion menu
inoremap <silent><expr> <c-@> coc#refresh()

" Yank Stack go back/forward 'clipboard'
inoremap <C-p> <Plug>yankstack_substitute_older_paste
inoremap <C-P> <Plug>yankstack_substitute_newer_paste
