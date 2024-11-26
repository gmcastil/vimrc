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
    " like lgrep or lmake. This opens the quickfix window below whatever the
    " current vertical split is (instead of all the way to the right, which is
    " the default)
    autocmd QuickFixCmdPost [^l]* :belowright cwindow
augroup END
" }}}
