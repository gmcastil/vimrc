" Begin ~/.vim/keys.vim

" echom "Loading key maps..."

" Limited key remappings
let mapleader = "-" 

" Edit Vim configuration files in new buffers
noremap <leader>ev :edit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>kv :edit $HOME/.vim/keys.vim<cr>

" Buffer navigation that I like better
noremap <leader>bn :bnext<cr>
noremap <leader>bp :bprevious<cr>

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

" Mouse wheel scrolling is not something I appreciate
:nmap <ScrollWheelUp>		      <nop>
:nmap <S-ScrollWheelUp>		    <nop>
:nmap <C-ScrollWheelUp>		    <nop>
:nmap <ScrollWheelDown>		    <nop>
:nmap <S-ScrollWheelDown>		  <nop>
:nmap <C-ScrollWheelDown>		  <nop>
:nmap <ScrollWheelLeft>		    <nop>
:nmap <S-ScrollWheelLeft>		  <nop>
:nmap <C-ScrollWheelLeft>		  <nop>
:nmap <ScrollWheelRight>		  <nop>
:nmap <S-ScrollWheelRight>	  <nop>
:nmap <C-ScrollWheelRight>	  <nop>

" Stop highlighting for the 'hlsearch' option. Doing it this way
" will clear all of the highlights of the previous search without having to do
" silly things like /asdf which trashes the result of the previous search, which
" might get reused
nnoremap <silent> <C-L>   :nohlsearch<CR>

