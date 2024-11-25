" Highlight the line in the active buffer -------------------------------- {{{
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
" }}}

" Set up code folding for Vim configuration files ------------------------ {{{
augroup FiletypeVim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Configure QuickFix window behavior -------------------------------------- {{{
augroup QuickFixWindow
    autocmd!
    " Fire this anytime something touches the quickfix window, except commands
    " like lgrep or lmake
    autocmd QuickFixCmdPost [^l]* cwindow
augroup END
" }}}
