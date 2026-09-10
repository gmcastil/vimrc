setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

" Add support for joining comments and deleting the comment leader
if v:version > 703 || v:version == 703 && has('patch541')
  setlocal formatoptions+=j
endif

" Shellcheck itself is wired up in vimrc.d/lint.vim (autocmd-driven, runs on
" save) rather than here.
