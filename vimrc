" Do not try to emulate old-skool Vi (probably unneeded)
set nocompatible

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

" Limited key remappings
let mapleader = "-"

" Edit Vim configuration in a new buffer
noremap <leader>ev :e $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" Get rid of arrow keys in normal
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

noremap  <up>    <nop>
noremap  <down>  <nop>
noremap  <left>  <nop>
noremap  <right> <nop>

vnoremap <up>    <nop>
vnoremap <down>  <nop>
vnoremap <left>  <nop>
vnoremap <right> <nop>


