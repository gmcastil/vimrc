augroup ShellSettings
    autocmd!
    " U-boot script source code benefits from this
    autocmd BufNewFile,BufRead *.cmd   set filetype=sh
augroup END

