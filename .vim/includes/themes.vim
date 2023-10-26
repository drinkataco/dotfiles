"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General:                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set colourscheme -
"  based off of a theme set for vim, or the shell theme
if exists('$BASE16_VIM')
  colorscheme base16-$BASE16_VIM
elseif exists('$BASE16_THEME')
  " There an issue where sometimes this variable begines with base16-,
  " sometimes it doesn't...
  if $BASE16_THEME =~# '^base16-'
    colorscheme $BASE16_THEME
  else
    colorscheme base16-$BASE16_THEME
  endif
endif
set termguicolors


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlights:                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight lookup function - allows theme defaults to be used elsewhere
" Thanks https://vi.stackexchange.com/questions/12293/read-values-from-a-highlight-group
function! ReturnHighlightTerm(group, term)
   " Store output of group to variable
   let output = execute('hi ' . a:group)

   " Find the term we're looking for
   return matchstr(output, a:term.'=\zs\S*')
endfunction

highlight Error term=bold,underline cterm=bold,underline ctermfg=1 gui=bold,underline guifg=#EC5f67 guibg=NONE

" MattesGroeger/vim-bookmark
highlight BookmarkSign guibg=#343D46

" Cursor Line
set cursorline
highlight cursorline guibg=#1b2b34
highlight cursorlinenr term=bold cterm=NONE ctermbg=NONE
set concealcursor-=n

