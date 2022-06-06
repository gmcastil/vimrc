" Switch out man pages for the Python documentation and hope that it is
" the version that I am developing for
augroup python_docs_not_man
  autocmd!
  autocmd BufNewFile,BufRead *.py set keywordprg=pydoc3.8
augroup END
