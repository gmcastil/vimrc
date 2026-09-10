" Lint shell scripts with shellcheck. It supports gcc-style output, which
" Vim's default 'errorformat' already parses, so no custom errorformat is
" needed.
if executable('shellcheck')
    augroup Shellcheck
        autocmd!
        autocmd FileType sh,bash setlocal makeprg=shellcheck\ -f\ gcc\ %
        " Run it automatically on save, same as the nvim-lint setup
        autocmd FileType sh,bash autocmd BufWritePost <buffer> silent! make | silent! redraw!
    augroup END
else
    call PrintWarn("shellcheck not found on PATH - shell script linting disabled")
endif
