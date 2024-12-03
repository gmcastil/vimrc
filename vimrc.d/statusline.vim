scriptencoding utf-8

" Create color groups for highlighting portions of the status line - these
" colors assume that the color scheme for the terminal is gruvbox dark.
" TODO: Verify this works when at an actual console
highlight FilenameHighlightGroup cterm=bold ctermfg=11 ctermbg=239
highlight FilenameHighlightGroupNC cterm=bold ctermfg=11 ctermbg=237
highlight ColumnHighlightGroup cterm=bold ctermfg=1 ctermbg=239
highlight ColumnHighlightGroupNC cterm=bold ctermfg=3 ctermbg=237

" Possible current mode strings
let g:currentmode={
    \ 'n'      : 'Normal',
    \ 'no'     : 'NOP',
    \ 'v'      : 'Visual',
    \ 'V'      : 'V·Line',
    \ "\<C-v>" : 'V·Block',
    \ 's'      : 'Select',
    \ 'S'      : 'S·Line',
    \ '^S'     : 'S·Block',
    \ 'i'      : 'Insert',
    \ 'R'      : 'Replace',
    \ 'Rv'     : 'V·Replace',
    \ 'c'      : 'Command',
    \ 'cv'     : 'Vim Ex',
    \ 'ce'     : 'Ex',
    \ 'r'      : 'Prompt',
    \ 'rm'     : 'More',
    \ 'r?'     : 'Confirm',
    \ '!'      : 'Shell',
    \ 't'      : 'Term'
    \}

" Create a sttus
function CreateStatusLine() abort

  " Start with a blank statusline
  let sl = ""

  " Now pick the mode from the hash table we created earlier
  let sl .= "%-12{toupper(currentmode[mode()])}"
  " Then insert the current buffer number
  " TODO An alternate thing to do here would be to create a custom indicator of
  " flags that I actually care about.  Which are, read only, modified, buffer
  " number. For now, just the current buffer number is good enough.
  let sl .= "[%n]"
  " Username and hostname in an rsync friendly way
  let sl .= "%10{$USER}@%{hostname()}:"

  " Active vs. inactive window differences
  if g:statusline_winid == win_getid(winnr())
    " Display the filename with the appropriate background color, depending on
    " whether we are in an active or inactive window
    let sl .= "%#FilenameHighlightGroup#%F%*"
  else
    let sl .= "%#FilenameHighlightGroupNC#%F%*"
  endif

  " Now begin right alignment
  let sl .= "%="
  " Add the vim-fugitive Git statusline component
  let sl .= "%{FugitiveStatusline()}"

  if g:statusline_winid == win_getid(winnr())
    " And then add the row number, a colon character....but then
    let sl .= "%=%l:"
    " ...for active windows, we want to know if the current line is greater than
    " the approved number of columns and if it is, to subtlely highlight it
    if strlen(getline(".")) > &textwidth && &textwidth != 0
      let sl .= "%#ColumnHighlightGroup#%c%*"
    else
      let sl .= "%c"
    endif
  else
    let sl .= "%=%l:%c"
  endif

  return sl

endfunction

" Turn off redundant use of --INSERT-- and --REPLACE--
set noshowmode
" Always display a status line
set laststatus=2

set statusline=%!CreateStatusLine()
