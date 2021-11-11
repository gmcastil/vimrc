" Begin ~/.vim/keys.vim

echom "Loading key maps..."

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

