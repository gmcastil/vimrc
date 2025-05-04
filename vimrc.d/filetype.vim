" Python syntax plugin behavior (must come before filetype detection)
let g:python_highlight_all = 1
let g:python_no_builtin_highlight = 1
let g:python_recommended_style = 0 

" Per the help files, filetypes and 'compatible' don't work well together
set nocompatible
" Enable filetype detection
filetype on
" Enable filetype-specific plugins from .vim/ftplugin
filetype plugin on
" Apply filetype-specific indentation rules from .vim/indent
filetype indent on

if has('syntax')
    if !exists("g:syntax_on")
        syntax enable
    endif
endif

