" Do not try to emulate old-skool Vi (probably unneeded)
set nocompatible

" Always start with line numbers turned on
set number

" Turn on filetype settings
filetype plugin indent on

" When operating in a windowed environment, set the window title bar to
" include the username and hostname and the filename that is being edited
autocmd BufEnter * let &titlestring = $USER . "@" . hostname() . " " . expand("%:p")
if &term == "xterm-256color" || &term == "xterm"
  set title
endif
