" U-boot script source code benefits from this
autocmd BufNewFile,BufRead *.cmd   set filetype=sh
" Use :make and :cnext so navigate quickfix thinger
autocmd filetype sh setlocal makeprg=shellcheck\ -f\ gcc\ %

