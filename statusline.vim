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

" Turn off redundant use of --INSERT-- and --REPLACE--
set noshowmode

" Always display a status line
set laststatus=2

" Start with a blank statusline
set statusline=
set statusline+=%-12{toupper(currentmode[mode()])}
set statusline+=[%n]
set statusline+=%10{$USER}@%-12{hostname()}:
set statusline+=%F
" Now begin right alignment
set statusline+=%=
set statusline+=%=%l:%c

autocmd VimEnter * echom "Status line set..."
