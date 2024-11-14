augroup AfterShellSettings
    autocmd!
    " Use :make and :cnext so navigate quickfix thinger
    " See `man shellcheck` for details
    echom "loaded makeprg"
    autocmd FileType sh setlocal makeprg=shellcheck\ -f\ gcc\ %
augroup END

