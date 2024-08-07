" Begin ~/.vim/keys.vim
scriptencoding utf-8

function! keys#cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber     | set number',
          \ '01': 'set norelativenumber   | set number',
          \ '10': 'set relativenumber     | set nonumber',
          \ '11': 'set norelativenumber   | set nonumber'}[&number . &relativenumber]
  else
    " No relative number, just toggle on and off
    set number!<cr>
  endif
endfunction

" Limited key remappings
let mapleader = "-" 

" Edit Vim configuration files in new buffers
noremap <silent> <leader>ev :tabnew $MYVIMRC<cr>
noremap <silent> <leader>sv :source $MYVIMRC<cr>
noremap <silent> <leader>dv :tabnew $HOME/.vim/doc/cheats.md<cr>
noremap <silent> <leader>kv :tabnew $HOME/.vim/keys.vim<cr>

" Some Make / build specific shortcuts and keybinds
noremap <silent> <leader>m :make<cr>

" Switch to the previous buffer and delete the current one (not entirely what I
" really want right now, but it's better than nothing).
nnoremap <silent> <leader>bk :bp\|bd#<cr>
nnoremap <silent> <leader><leader> :b#<cr>

" Cycle through relative and normal line numbering combinations
nnoremap <silent> <leader>r :call keys#cycle_numbering()<cr>

" Navigate splits using more natural keys
nmap <silent> <C-j> :wincmd j<cr>
nmap <silent> <C-k> :wincmd k<cr>
nmap <silent> <C-h> :wincmd h<cr>
nmap <silent> <C-l> :wincmd l<cr>

" Get rid of arrow keys in insert, normal and visual mode
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

" Mouse wheel scrolling is not something I appreciate
:nmap <ScrollWheelUp>         <nop>
:nmap <S-ScrollWheelUp>       <nop>
:nmap <C-ScrollWheelUp>       <nop>
:nmap <ScrollWheelDown>       <nop>
:nmap <S-ScrollWheelDown>     <nop>
:nmap <C-ScrollWheelDown>     <nop>
:nmap <ScrollWheelLeft>       <nop>
:nmap <S-ScrollWheelLeft>     <nop>
:nmap <C-ScrollWheelLeft>     <nop>
:nmap <ScrollWheelRight>      <nop>
:nmap <S-ScrollWheelRight>    <nop>
:nmap <C-ScrollWheelRight>    <nop>

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>

" Stop highlighting for the 'hlsearch' option. Doing it this way
" will clear all of the highlights of the previous search without having to do
" silly things like /asdf which trashes the result of the previous search, which
" might get reused
nnoremap <silent> <leader>/   :nohlsearch<CR>

" Repeats the last search but unfolds the code enough to make the cursor
" visible, and then centers the search result in the buffer
nnoremap n nzvzz
nnoremap N Nzvzz

autocmd VimEnter * echom "Key maps loaded..."

