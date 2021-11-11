" Do not try to emulate old-skool Vi (probably unneeded)
set nocompatible

" Always start with line numbers turned on and make sure that there is
" sufficient space so that columns don't hop around as the number gets larger
set number
set numberwidth=4

" Turn on filetype settings
filetype plugin indent on

" Each time a new buffer is entered, build up a title string using the user
" name and hostname of the machine that Vim is actually running on (this
" allows users to be aware when editing files remotely via SSH)
augroup window_title
  autocmd!
  autocmd BufEnter * let &titlestring = $USER . "@" . hostname() . " " . expand("%:p")
augroup END

if &term == "xterm-256color" || &term == "xterm"
  set title
endif

" Set a statusline
" Start with an empty status line
" Mode   username@hostname /path/to/file          (filetype)      %  Row/Col

source $HOME/.vim/keys.vim

