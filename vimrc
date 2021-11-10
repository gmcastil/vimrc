" Do not try to emulate old-skool Vi (probably unneeded)
set nocompatible

let VIM_HOME = $HOME . '/.vim'
let VIM_KEYS = $VIM_HOME . '/keys.vim'

" Always start with line numbers turned on and make sure that there is
" sufficient space so that columns don't hop around as the number gets larger
set number
set numberwidth=4

" Turn on filetype settings
filetype plugin indent on

" When operating in a windowed environment, set the window title bar to
" include the username and hostname and the filename that is being edited
autocmd BufEnter * let &titlestring = $USER . "@" . hostname() . " " . expand("%:p")
if &term == "xterm-256color" || &term == "xterm"
  set title
endif

if filereadable(expand($VIM_KEYS))
  source $VIM_KEYS
endif

