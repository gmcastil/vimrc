autocmd BufNewFile,BufRead *.v    set filetype=verilog
autocmd BufNewFile,BufRead *.vh   set filetype=verilog
" Vim still sees Verilog and SystemVerilog as separate filetypes
autocmd BufNewFile,BufRead *.sv   set filetype=systemverilog
autocmd BufNewFile,BufRead *.svh  set filetype=systemverilog
